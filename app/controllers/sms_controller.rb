class SMSController < ActionController::Base

  def receive
    query = params[:Body]
    test_location = Geocoder.search query
    test_location = test_location[0].data["geometry"]["location"].values
    result = Organization.all.collect{|o| [o, Geocoder::Calculations.distance_between(test_location, [o.latitude, o.longitude])]}.sort{|a,b| a[0] <=> b[0]}.first

    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "Nearest help is at #{result[0].address}, #{result[0].address2} https://www.google.com/maps/preview?q=##{result[0].latitude},#{result[0].longitude}"
    end
    twiml.text
  end
end
