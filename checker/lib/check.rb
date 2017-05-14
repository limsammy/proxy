require 'pry'
require 'net/ping'

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

  def verify?(proxy)
    host, port = proxy.split(':')
    binding.pry
    return Net::Ping::TCP.new(host, port).ping
  end
end