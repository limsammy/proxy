require_relative 'spec_helper'

describe ProxyScrape do
  before(:each) do
    @proxy = ProxyScrape.new('./to_check.txt')
  end
end