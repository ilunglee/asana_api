require 'spec_helper'

describe AsanaAPI::Tag do
  let(:subject) { AsanaAPI::Tag.new }

  it 'returns 200 for index', vcr: true do
    expect(subject.index.code).to eq(200)
  end

  it 'returns 200 for show', vcr: true do
    subject.index
    expect(subject.show(id: subject.parsed.first['id']).code).
      to eq(200)
  end
end
