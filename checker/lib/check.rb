require 'pry'

class ProxyCheck
  attr_reader :to_check

  def initialize(path)
    @to_check = File.readlines(path)
  end

  def sanitize(string)
    string.gsub("\n", '')
  end
end