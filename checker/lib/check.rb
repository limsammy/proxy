require 'pry'

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
end