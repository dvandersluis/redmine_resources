# Extension to ViewListener to allow an :if parameter to render_on.
# See <http://www.redmine.org/boards/3/topics/show/4316>
module Redmine
  module Hook
    class ViewListener
      def self.render_on(hook, options={})
        define_method hook do |context|
          if !options.include?(:if) || evaluate_if_option(options[:if], context)
            context[:controller].send(:render_to_string, {:locals => context}.merge(options))
          end
        end
      end

      private

      def evaluate_if_option(if_option, context)
        case if_option
        when Symbol
          send(if_option, context)
        when Method, Proc
          if_option.call(context)
        end        
      end
    end
  end
end

class ShowIssueResourcesHook < Redmine::Hook::ViewListener
  render_on :view_issues_show_desc_bottom, :partial => "issues/resources", :if => :has_permission? 

private
  def protect_against_forgery?
    false
  end

  def has_permission?(context)
    context[:project].module_enabled?('resources') and User.current.allowed_to?(:view_resources, context[:project])
  end
end
