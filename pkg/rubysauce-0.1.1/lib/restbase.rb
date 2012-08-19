require 'rubygems'
require 'rest_client'
require 'json'

module RubySauce
  class SauseLabsRestBase
    SAUSE_REST = "saucelabs.com/rest/v1"
    SAUSE_RESULT = "saucelabs.com/rest"

    def initialize(user,password)
      @user = user
      @password = password
    end

    def url
      "https://#{@user}:#{@password}@#{SAUSE_REST}/#{@user}"
    end

    def result_url
      "https://#{@user}:#{@password}@#{SAUSE_RESULT}/#{@user}"
    end

    def get_json(dest)
      JSON.parse RestClient.get("#{url}/#{dest}",{:accept => :json})
    end

    def get_result(dest)
      RestClient.get "#{result_url}/#{dest}"
    end

  end
end
