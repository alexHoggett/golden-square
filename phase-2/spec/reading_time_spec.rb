require "reading_time"

describe "reading_time method" do
  string200 = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam risus turpis, mollis sit amet nibh et, maximus blandit dolor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Vivamus luctus tortor sit amet risus fringilla, quis tincidunt enim luctus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam posuere nunc augue, sed malesuada nisi accumsan id. Pellentesque eleifend maximus lorem a elementum. Sed pretium risus sed tellus eleifend, non molestie metus semper. Nullam mollis facilisis justo et eleifend. In rutrum mi nec quam interdum elementum.
  
  Aenean in tincidunt felis. Maecenas ut urna nec ipsum venenatis aliquet et eu nunc. Phasellus hendrerit suscipit purus, sit amet facilisis velit. Pellentesque sagittis metus ac diam sollicitudin pharetra. Phasellus tellus risus, malesuada non urna id, lacinia tempus ante. Maecenas commodo facilisis interdum. Duis mattis, augue sit amet vulputate porta, erat leo laoreet enim, eu cursus mauris eros eget odio. Nunc faucibus tempus quam ac porta. Vestibulum scelerisque diam sed metus ullamcorper, non pellentesque tortor pulvinar. Vivamus dignissim porta felis. Cras ut tortor felis. Curabitur vel lorem ac orci ultrices ultricies. Integer facilisis elit vel placerat tincidunt. Curabitur volutpat pellentesque quam, ac fermentum dolor blandit sed. Quisque pellentesque lacus.'

  string100 = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur pharetra pulvinar turpis, eu viverra augue interdum at. Sed nec nulla sit amet ipsum sollicitudin egestas. Nullam vel augue sem. Praesent in orci vitae justo sagittis elementum quis sit amet mi. Cras eget viverra turpis. Sed non condimentum elit. Etiam et pulvinar lectus, at sodales nisi. Vestibulum vitae consectetur leo, ut consectetur nunc. Nam sed nibh pulvinar, feugiat tortor in, ornare mi. Aliquam rutrum, dolor aliquam suscipit volutpat, libero nisl congue mi, a aliquet tortor odio id orci. Nam tempor, lorem vitae tincidunt porttitor, augue libero vehicula lectus, elementum iaculis lorem. '

  it "returns 0 minutes, given an empty string" do
    expect(reading_time(' ')).to eq '0.0 minutes'
  end

  it "returns 1 minute, given a string of 200 words" do
    expect(reading_time(string200)).to eq '1.0 minutes'
  end

  it "returns 0.50, given a string of 100 words" do
    expect(reading_time(string100)).to eq '0.5 minutes'
  end

  it "returns an error when a string is not provided" do
    expect{ reading_time(3) }.to raise_error "Please provide a string!"
  end
end