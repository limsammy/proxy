require_relative 'spec_helper'

describe ProxyCheck do
  before(:each) do
    @proxy = ProxyCheck.new('./to_check.txt')
  end

  it 'reads file into array' do
    expect(@proxy.to_check).to be_instance_of(Array)
  end

  it 'sanitize method removes newline char from to_check array' do
    @proxy.sanitize.each do |proxy|
      expect(proxy).to_not include("\n")
    end
  end

  it 'sanitize method returns array' do
    expect(@proxy.sanitize).to be_instance_of(Array)
  end

  it 'pings all proxies and returns array of true or false' do
    @proxy.check_all
    expect(@proxy.check_all).to be nil
  end
end