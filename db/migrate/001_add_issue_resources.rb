class AddIssueResources < ActiveRecord::Migration
  def self.up
    create_table :issue_resources, :force => true do |t|
      t.integer "issue_id", :default => 0, :null => false
      t.string "resource", :limit => 200, :null => false
      t.string "description", :limit => 200, :null => true, :default => nil
    end
  end

  def self.down
    drop_table :issue_resources
  end
end
