class ShowIssueResourcesHook < Redmine::Hook::ViewListener
  render_on :view_issues_show_desc_bottom, :partial => "issues/resources" 

private
  def protect_against_forgery?
    false
  end
end
