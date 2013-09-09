class TripMailer < ActionMailer::Base
  default from: "dream@mywanderlust.co"

  def share_trip_email(email, url)
  	@url = url
  	mail(to: email, subject: 'Help plan your friends vacation')
  end
end
