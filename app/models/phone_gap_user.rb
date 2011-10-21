require 'net/http'
require 'net/https'

class PhoneGapUser < ActiveRecord::Base
  has_many :apps
  
  validates_uniqueness_of :email

  def load_apps(password)
    http = Net::HTTP.new('build.phonegap.com', 443)
    http.use_ssl = true
    req = Net::HTTP::Get.new('/api/v1/apps')
    req.basic_auth email, password
    response = http.request(req)

    apps_attributes = JSON.parse(response.body)["apps"]
    apps_attributes.collect! do |attributes|
      {
        "app_id" => attributes["id"].to_s,
        "title" => attributes["title"],
        "version" => (attributes["version"].blank? ? "1.0" : attributes["version"]),
        "package" => attributes["package"],
        "url" => ["https://build.phonegap.com", attributes["download"]["ios"]].join
      }
    end

    apps_attributes.each do |app_attributes|
      apps.find_or_create_by_app_id(app_attributes)
    end

    apps
  end
end