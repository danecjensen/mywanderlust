class Destination < ActiveRecord::Base
  attr_accessible :address, :city, :country, :cross_street, :distance, :lat, :lng, :name, :photo_url, :postal_code, :state, :trip_id
  belongs_to :trip
end
