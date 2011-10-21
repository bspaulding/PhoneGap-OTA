require 'net/http'
require 'net/https'

class PhoneGapUser
  attr_accessor :apps

  def initialize(username, password)
    @apps = load_apps(username, password)
  end

private
  
  def load_apps(username, password)
    http = Net::HTTP.new('build.phonegap.com', 443)
    http.use_ssl = true
    req = Net::HTTP::Get.new('/api/v1/apps')
    req.basic_auth username, password
    response = http.request(req)

    JSON.parse(response.body)["apps"]
  end
end