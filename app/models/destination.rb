class Destination < ActiveRecord::Base
  attr_accessible :address, :city, :country, :cross_street, :distance, :lat, 
  :latitude, :lng, :longitude, :name, :photo_url, :postal_code, :state, :cc, 
  :trip_id, :fsq_prefix_url, :fsq_suffix_url, :added_by, :added_by_photo_url,
  :directions, :url
  belongs_to :trip
  acts_as_commentable
end
