module RedmineResources
  # Patches Redmine's Issues dynamically. Adds a relationship
  # Issue +has_many+ to IssueResource
  module IssuePatch
    def self.included(base) # :nodoc:
      # Same as typing in the class
      base.class_eval do
        belongs_to :deliverable
        has_many :resources, :class_name => 'IssueResource', :foreign_key => 'issue_id', :dependent => :delete_all
      end
   
    end
  end
end
