class Trip < ActiveRecord::Base
  attr_accessible :current_lat, :current_lng, :name
  has_many :destinations
  belongs_to :user
  before_create :trip_codes

  def self.from_param(webstring)
    find_by_webstring(webstring)
  end

  def to_param
    self.webstring
  end

  private
  
  def trip_codes
    require 'digest/sha1'
    self.webstring = Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by{rand}.join)
  end

end
