class TripMailer < ActionMailer::Base
  default from: "dream@mywanderlust.co"

  def share_trip_email(url, email)
  	@url = url
  	mail(to: email, subject: 'Help plan your friends vacation')
  end
end
