require 'date'
require 'json'
require 'net/http'

class TimeError
  # Returns difference in seconds between server time
  # and the time on this computer
  def initialize(requester)
    @requester = requester
  end

  def error(local_time)
    return get_server_time - local_time
  end

  private

  def get_server_time
    text_response = @requester.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end

# p Time.now

p DateTime.parse("2022-12-15T10:53:19.003492+00:00").to_time - Time.now