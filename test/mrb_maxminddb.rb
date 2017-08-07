##
## MaxMindDB Test
##

MaxMindDbDat = File.expand_path("../mruby-maxminddb/test/fixtures/GeoLite2-City.mmdb")

FullDataExpect = {
  :ip_addr      => "9.9.9.9",
  :country_code => "US",
  :region       => "NC",
  :region_name  => "North Carolina",
  :city         => "Durham",
  :postal_code  => "27709",
  :latitude     => 35.994000,
  :longitude    => -78.898600,
  :metro_code   => 560,
  :time_zone    => "America/New_York",
}

PoorDataExpect = {
  :ip_addr      => "74.122.8.1",
  :country_code => nil,
  :region       => nil,
  :region_name  => nil,
  :city         => nil,
  :postal_code  => nil,
  :latitude     => nil,
  :longitude    => nil,
  :metro_code   => nil,
  :time_zone    => nil,
}

assert("MaxMindDB#new") do
  maxminddb = MaxMindDB.new MaxMindDbDat
  assert_not_equal(nil, maxminddb)
end

assert("MaxMindDB#lookup_string") do
  maxminddb = MaxMindDB.new MaxMindDbDat
  maxminddb.lookup_string FullDataExpect[:ip_addr]
  maxminddb.lookup_string PoorDataExpect[:ip_addr]
end

assert("MaxMindDB#country_code") do
  maxminddb = MaxMindDB.new MaxMindDbDat
  maxminddb.lookup_string FullDataExpect[:ip_addr]
  assert_equal(FullDataExpect[:country_code], maxminddb.country_code)
end

assert("MaxMindDB#region") do
  maxminddb = MaxMindDB.new MaxMindDbDat
  maxminddb.lookup_string FullDataExpect[:ip_addr]

  assert_equal(FullDataExpect[:region], maxminddb.region)
end

assert("MaxMindDB#region_name") do
  maxminddb = MaxMindDB.new MaxMindDbDat
  maxminddb.lookup_string FullDataExpect[:ip_addr]

  assert_equal(FullDataExpect[:region_name], maxminddb.region_name)
end

assert("MaxMindDB#city") do
  maxminddb = MaxMindDB.new MaxMindDbDat
  maxminddb.lookup_string FullDataExpect[:ip_addr]

  assert_equal(FullDataExpect[:city], maxminddb.city) # => nil

  maxminddb.lookup_string FullDataExpect[:ip_addr]
  assert_equal(FullDataExpect[:city], maxminddb.city)
end

assert("MaxMindDB#postal_code") do
  maxminddb = MaxMindDB.new MaxMindDbDat
  maxminddb.lookup_string FullDataExpect[:ip_addr]

  assert_equal(FullDataExpect[:postal_code], maxminddb.postal_code) # => nil
end

assert("MaxMindDB#latitude") do
  maxminddb = MaxMindDB.new MaxMindDbDat
  maxminddb.lookup_string FullDataExpect[:ip_addr]

  assert_equal(FullDataExpect[:latitude], maxminddb.latitude)
end

assert("MaxMindDB#longitude") do
  maxminddb = MaxMindDB.new MaxMindDbDat
  maxminddb.lookup_string FullDataExpect[:ip_addr]

  assert_equal(FullDataExpect[:longitude], maxminddb.longitude.round(4))
end

assert("MaxMindDB#metro_code") do
  maxminddb = MaxMindDB.new MaxMindDbDat
  maxminddb.lookup_string FullDataExpect[:ip_addr]

  assert_equal(FullDataExpect['metro_code'], maxminddb.metro_code)
end

assert("MaxMindDB#time_zone") do
  maxminddb = MaxMindDB.new MaxMindDbDat
  maxminddb.lookup_string FullDataExpect[:ip_addr]

  assert_equal(FullDataExpect[:time_zone], maxminddb.time_zone) # => nil

  maxminddb.lookup_string FullDataExpect[:ip_addr]
  assert_equal(FullDataExpect[:time_zone], maxminddb.time_zone)
end

