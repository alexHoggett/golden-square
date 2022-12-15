require "time_error"

describe TimeError do
  it "returns the difference between world and local clock" do
    requester_dbl = double(:requester)
    expect(requester_dbl)
    .to receive(:get)
    .with(URI("https://worldtimeapi.org/api/ip"))
    .and_return('{"abbreviation":"GMT","client_ip":"2a02:c7f:503e:1f00:c971:f71f:2d62:b06a","datetime":"2022-12-15T10:53:19.003492+00:00","day_of_week":4,"day_of_year":349,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1671101599,"utc_datetime":"2022-12-15T10:53:19.003492+00:00","utc_offset":"+00:00","week_number":50}')
    time_error = TimeError.new(requester_dbl)
    time = Time.now
    expect(time_error.error(time)).to eq DateTime.parse("2022-12-15T10:53:19.003492+00:00").to_time - time
  end
end