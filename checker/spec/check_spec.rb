require_relative 'spec_helper'

describe ProxyCheck do
  before(:each) do
    @proxy = ProxyCheck.new('./to_check.txt')
  end
end