class IssueResource < ActiveRecord::Base
  belongs_to :issue

  validates_presence_of :issue_id, :resource
  validates_uniqueness_of :resource, :scope => :issue_id

  before_validation :normalize_description
  
private
  def normalize_description
    self.description = nil if self.description.blank?
  end
end
