module ApplicationHelper

  # curl http://localhost:9292/faye -d 'message={[channel]("/messages/new",) [data]("hello")}'
  def broadcast(channel, &block)
    message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN}}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end

end
