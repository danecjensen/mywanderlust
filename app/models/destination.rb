class Destination < ActiveRecord::Base
  attr_accessible :address, :city, :country, :cross_street, :distance, :lat, :latitude, :lng, :longitude, :name, :photo_url, :postal_code, :state, :cc, :trip_id
  belongs_to :trip
end
