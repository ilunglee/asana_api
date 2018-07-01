require 'spec_helper'

describe AsanaAPI do
  it 'should have a version number' do
    expect(AsanaAPI::VERSION).not_to be nil
  end

  it 'should have an api_key property' do
    expect(AsanaAPI).to respond_to(:api_key)
  end
end

