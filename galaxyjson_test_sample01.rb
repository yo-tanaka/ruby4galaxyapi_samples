#!/usr/bin/ruby
require "net/http" 
require "json" 

header  = {"user-agent"   => "Ruby Test Script", "Content-Type" => "application/json"}

idkey   = "473ea466a4d34e157fba434552725ae4"
baseurl = "localhost" 

apipath = "/api/libraries?key=#{idkey}" 
data    = {"name" => "Ruby Test", "description" => "This is Test for Ruby Scripts"}.to_json

begin
    Net::HTTP.start(baseurl, 80) do |_http|
        res = _http.post(apipath, data, header)
        puts JSON.parse(res.body)
    end
rescue => e
    puts "Error !!: #{[e.class, e].join(" : ")}" 

end
