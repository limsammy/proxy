require_relative 'spec_helper'

describe ProxyCheck do
  before(:each) do
    @proxy = ProxyCheck.new('./to_check.txt')
  end

  it 'reads file into array' do
    expect(@proxy.to_check).to be_instance_of(Array)
  end
end