require 'spec_helper'

describe AsanaAPI::Workspace do
  let(:subject)    { AsanaAPI::Workspace.new }
  let(:workspaces) { AsanaAPI::Workspace.index! }

  it 'returns 200 for index', vcr: true do
    expect(subject.index.code).to eq(200)
  end

  it 'returns 200 for show', vcr: true do
    subject.index
    expect(subject.show(id: subject.parsed.first['id']).code).to eq(200)
  end
end
