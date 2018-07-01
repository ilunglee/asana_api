# AsanaAPI
Simplify Asana RESTful API. For more information please see https://asana.com/developers/api-reference/projects

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'asana_api'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install asana_api
```

## Usage
#### SETUP
```ruby
AsanaAPI.setup do |s|
  s.api_key = ENV['API_KEY']
end
```
---
#### PROJECT
```ruby
# Get all projects
AsanaAPI::Project.index! # JSON parsed response
AsanaAPI::Project.index # raw response
# Accepts options
AsanaAPI::Project.index!(workspace: 'WORKSPACE_ID', team: 'TEAM_ID', archiced: 'TURE / FALSE')
# Show a project
AsanaAPI::Project.show!(id: 'PROJECT_ID') # JSON parsed response
AsanaAPI::Project.show(id: 'PROJECT_ID') # raw response
# Get project sections
AsanaAPI::Project.sections!(id: 'PROJECT_ID') # JSON parsed response
AsanaAPI::Project.sections(id: 'PROJECT_ID') # raw response
# Changing the display fields - for complete fields see Asana offical doc https://asana.com/developers/api-reference/projects
req = AsanaAPI::Project.new(options: { opt_fields: %i[field1 field2], opt_expand: %i[field1 field2] })
req.index
req.parsed
```

#### TAG
```ruby
# Get all tags
AsanaAPI::Tag.index! # JSON parsed response
AsanaAPI::Tag.index # raw response
# Accepts options
AsanaAPI::Tag.index!(workspace: 'WORKSPACE_ID', team: 'TEAM_ID', archiced: 'TURE / FALSE', options: { limit: 10, offset: 0 })
# Show a tag
AsanaAPI::Tag.show!(id: 'TAG_ID') # JSON parsed response
AsanaAPI::Tag.show(id: 'TAG_ID') # raw response
# Changing the display fields - for complete fields see Asana offical doc https://asana.com/developers/api-reference/tags
req = AsanaAPI::Tag.new(options: { opt_fields: %i[field1 field2], opt_expand: %i[field1 field2] })
req.index
req.parsed
```

#### Task
```ruby
# Get all tasks
AsanaAPI::Task.index! # JSON parsed response
AsanaAPI::Task.index # raw response
# Accepts options
AsanaAPI::Task.index!(workspace: 'WORKSPACE_ID', assignee: 'ASSIGNEE_ID', completed_since: 'UNIX_TIMESTAMP', modified_since: 'UNIX_TIMESTAMP', options: { limit: 10, offset: 0 })
# Show a task
AsanaAPI::Task.show!(id: 'TASK_ID') # JSON parsed response
AsanaAPI::Task.show(id: 'TASK_ID') # raw response
# Show task stories
AsanaAPI::Task.stories!(id: 'TASK_ID') # JSON parsed response
AsanaAPI::Task.stories(id: 'TASK_ID') # raw response
# Changing the display fields - for complete fields see Asana offical doc https://asana.com/developers/api-reference/tasks
req = AsanaAPI::Task.new(options: { opt_fields: %i[field1 field2], opt_expand: %i[field1 field2] })
req.index
req.parsed
```

#### Team
```ruby
# Get all teams
AsanaAPI::Team.index! # JSON parsed response
AsanaAPI::Team.index # raw response
# Accepts options
AsanaAPI::Team.index!(organization: 'ORGANIZATION_ID', options: { limit: 10, offset: 0 })
# Show a team
AsanaAPI::Team.show!(id: 'TEAM_ID') # JSON parsed response
AsanaAPI::Team.show(id: 'TEAM_ID') # raw response
# Show team users
AsanaAPI::Team.users!(id: 'TEAM_ID') # JSON parsed response
AsanaAPI::Team.users(id: 'TEAM_ID') # raw response
# Changing the display fields - for complete fields see Asana offical doc https://asana.com/developers/api-reference/teams
req = AsanaAPI::Team.new(options: { opt_fields: %i[field1 field2], opt_expand: %i[field1 field2] })
req.index
req.parsed
```

#### User
```ruby
# Get all users
AsanaAPI::User.index! # JSON parsed response
AsanaAPI::User.index # raw response
# Accepts options
AsanaAPI::User.index!(workspace: 'WORKSPACE_ID', options: { limit: 10, offset: 0 })
# Show a user
AsanaAPI::User.show!(id: 'USER_ID') # JSON parsed response
AsanaAPI::User.show(id: 'USER_ID') # raw response
# Changing the display fields - for complete fields see Asana offical doc https://asana.com/developers/api-reference/teams
req = AsanaAPI::User.new(options: { opt_fields: %i[field1 field2], opt_expand: %i[field1 field2] })
req.index
req.parsed
```

#### Workspace
```ruby
# Get all workspaces
AsanaAPI::Workspace.index! # JSON parsed response
AsanaAPI::Workspace.index # raw response
# Accepts options
AsanaAPI::Workspace.index!(options: { limit: 10, offset: 0 })
# Show a workspace
AsanaAPI::Workspace.show!(id: 'WORKSPACE_ID') # JSON parsed response
AsanaAPI::Workspace.show(id: 'WORKSPACE_ID') # raw response
# Changing the display fields - for complete fields see Asana offical doc https://asana.com/developers/api-reference/teams
req = AsanaAPI::Workspace.new(options: { opt_fields: %i[field1 field2], opt_expand: %i[field1 field2] })
req.index
req.parsed
```

## Contributing
- Clone this repo and go into the gem top-level directory and run `bundle install`
- To run the specs run `rspec spec`.
- To access irb development environment run `ruby bin/console`
- Submit a pull request for and explain what your changes are.
ps. You will usually want to write tests for your changes

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
