require 'open-uri'
require 'nokogiri'
require 'fileutils'

def get_ratings
  n = Nokogiri::HTML(open('http://www.homeadvisor.com/rated.NewEnglandDataTech.55951844.html'))

  all_ratings = []

  pages = n.css('.new-profile-pagination-list .t-heavy').text.strip.match(/of (\d+)/)[1].to_i
  pages = (pages / 10) + ((pages % 10) > 0 ? 1 : 0)
  cur_page = 2

  all_ratings.concat get_ratings_from_page(n)

  (cur_page..pages).each do |page_index|
    all_ratings.concat get_ratings_from_page(
      Nokogiri::HTML(
        open(
          "http://www.homeadvisor.com/rated.NewEnglandDataTech.55951844.html?page=#{page_index}"
        )
      )
    )
  end

  all_ratings
end

def get_ratings_from_page(page)
  page_ratings = []
  ratings = page.css('.ratings-container .profile-rating-border').each do |rating|
    stars = rating.css('span[itemprop="ratingValue"]')[0].text.strip.to_f
    date = rating.css('span[itemprop="datePublished"]')[0].text.strip
    name = rating.css('span[itemprop="author"]')[0].text.strip
    location = rating.css('.profile-user-review-body a')[0]&.text&.strip
    job_type = rating.css('.profile-user-review-body .t-heavy a')[1]&.text&.strip
    review = rating.css('span[itemprop="reviewBody"]')[0].text.strip

    page_ratings.push({
      stars: stars,
      date: date,
      name: name,
      location: location,
      job_type: job_type,
      review: review
    })
  end

  page_ratings
end

def output_to_file(filename, ratings)
  File.open(filename, 'w+') do |file|
    ratings.each do |rating|
      first_name = rating[:name]
      last_name = ''
      first_name = rating[:name].split(' ').first if rating[:name].include?(' ')
      last_name = rating[:name].split(' ').last if rating[:name].include?(' ')
      file << 'Review.create(rating: '
      file << rating[:stars]
      file << ', first_name: "'
      file << first_name
      file << '", last_initial: "' unless last_name == ''
      file << last_name unless last_name == ''
      file << '", location: "'
      file << rating[:location]
      file << '", description: "'
      file << rating[:review].gsub(/  /, ' ').gsub(/\n/, ' ')
      file << "\")\n"
    end
  end
end

root_dir = File.join(File.dirname(__FILE__), '../')

FileUtils.move("#{root_dir}/db/seeds.rb", "#{root_dir}/db/seeds.rb.old")
output_to_file("#{root_dir}/db/seeds.rb", get_ratings)
