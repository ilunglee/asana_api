require 'spec_helper'

describe AsanaAPI::Team do
  let(:subject)    { AsanaAPI::Team.new }
  let(:workspaces) { AsanaAPI::Workspace.index! }

  it 'returns 200 for index', vcr: true do
    expect(subject.index(organization: workspaces.first['id']).code).to eq(200)
  end

  it 'returns 200 for show', vcr: true do
    subject.index(organization: workspaces.first['id'])
    expect(subject.show(id: subject.parsed.first['id']).code).to eq(200)
  end

  it 'returns 200 for users', vcr: true do
    subject.index(organization: workspaces.first['id'])
    expect(subject.users(id: subject.parsed.first['id']).code).to eq(200)
  end
end
