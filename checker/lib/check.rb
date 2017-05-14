require 'pry'
require 'faraday'
require 'cgi'

class ProxyCheck
  attr_reader :to_check

  def initialize(path)
    @to_check = File.readlines(path)
  end

  def sanitize
    @to_check.map do |string|
      string.gsub("\n", '')
    end
  end

  def valid?(host, port)
    begin
      proxy = host + ':' + port
      f = Faraday.new(:proxy => { :uri => "http://" + proxy})
      response = f.get "http://www.google.com"
      @cookie = CGI::Cookie.parse(response.headers["set-cookie"])
      if(@cookie["NID"].empty?)
        false
      else
        true
      end
    rescue
      false
    end
  end

  def check_all(list = @to_check)
    list.map do |proxy|
      host, port = proxy.split(':')
      valid?(host, port)
    end
  end
end