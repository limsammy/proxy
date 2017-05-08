require_relative 'spec_helper'

describe ProxyCheck do
  before(:each) do
    @proxy = ProxyCheck.new('./to_check.txt')
  end

  it 'reads file into array' do
    expect(@proxy.to_check).to be_instance_of(Array)
    expect(@proxy.to_check.count).to eq(18)
  end

  it 'removes newline char from to_check array' do
    @proxy.to_check.each do |proxy|
      expect(proxy).to_not include('\n')
    end
  end
end