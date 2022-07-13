module CmAdmin::Log
  extend ActiveSupport::Concern
  included do
    cm_admin  do
      actions only: [:index]
      cm_index page_title: 'Logs', page_description: 'Manage all logs here', partial: '/admin/logs/index' do
        # custom_action name: 'list', layout_type: 'cm_association_show', route_type: "collection", verb: "get", path: '/list', display_type: :page, partial: '/un_admin/courses/logs'
        # custom_action name: 'read_all_notification', route_type: "collection", verb: "patch", path: '/read_all', display_type: :button do
        #   # Logic to be added
        #   Current.user.logs
        # end
      end
    end
  end
end