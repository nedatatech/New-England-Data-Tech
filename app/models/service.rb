class Service < ApplicationRecord
  has_many :service_contents

  def to_param
    slug
  end	
end
