class Service < ApplicationRecord
  def to_param
    slug
  end	
end
