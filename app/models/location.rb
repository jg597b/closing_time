class Location < ActiveRecord::Base
	has_many :business_hours
	accepts_nested_attributes_for :business_hours

end
