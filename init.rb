require 'redmine'

require_dependency 'resources_issue_patch'
require_dependency 'resources_show_issue_hook'

Redmine::Plugin.register :redmine_resources do
  name 'Issue Resources'
  author 'Daniel Vandersluis'
  description 'Allows links to resources to be attached to an issue'
  version '0.1.0'

  project_module :resources do |map|
    map.permission :view_resources, { }
    map.permission :add_resources, { :issue_resources => :new }
    map.permission :delete_resources, { :issue_resources => :destroy }
  end
end
