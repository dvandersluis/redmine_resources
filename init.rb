require 'redmine'

# Patches to the Redmine core.
require 'dispatcher'

Dispatcher.to_prepare :redmine_resources do
  require_dependency 'issue'
  # Guards against including the module multiple time (like in tests)
  # and registering multiple callbacks
  unless Issue.included_modules.include? RedmineResources::IssuePatch
    Issue.send(:include, RedmineResources::IssuePatch)
  end
end

require_dependency 'resources_show_issue_hook'

Redmine::Plugin.register :redmine_resources do
  name 'Issue Resources'
  author 'Daniel Vandersluis'
  description 'Allows links to resources to be attached to an issue'
  version '0.1.2'

  project_module :resources do |map|
    map.permission :view_resources, { }
    map.permission :add_resources, { :issue_resources => :new }
    map.permission :delete_resources, { :issue_resources => :destroy }
  end
end
