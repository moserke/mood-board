class Person < ActiveRecord::Base
  def image_url
    Gravatar.new(email).image_url
  end
end
