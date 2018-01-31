json.extract! review, :id, :rating, :first_name, :last_initial, :location, :description, :created_at, :updated_at
json.url review_url(review, format: :json)