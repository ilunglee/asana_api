require 'spec_helper'

describe AsanaAPI::Task do
  let(:subject)    { AsanaAPI::Task.new }
  let(:workspaces) { AsanaAPI::Workspace.index! }
  let(:users)      { AsanaAPI::User.index! }

  it 'returns 200 for index', vcr: true do
    expect(
      subject.
      index(workspace: workspaces.first['id'],
            assignee: users.first['id']).code
    ).to eq(200)
  end

  it 'returns 200 for show', vcr: true do
    subject.index(workspace: workspaces.first['id'], assignee: users.first['id'])
    expect(subject.show(id: subject.parsed.first['id']).code).to eq(200)
  end

  it 'returns 200 for stories', vcr: true do
    subject.index(workspace: workspaces.first['id'], assignee: users.first['id'])
    expect(subject.stories(id: subject.parsed.first['id']).code).to eq(200)
  end
end
