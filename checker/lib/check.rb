class ProxyCheck
  attr_reader :to_check

  def initialize(path)
    @to_check = File.readlines(path)
  end
end