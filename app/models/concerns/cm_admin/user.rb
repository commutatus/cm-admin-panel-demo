module CmAdmin::User
  extend ActiveSupport::Concern
  included do
    cm_admin do
      actions only: []
      set_icon "fa fa-user"
      cm_index do
        page_title 'User'
        page_description 'Manage all users here'

        filter [:first_name, :last_name, :email], :search, placeholder: 'Search'

        column :first_name, header: 'First Name'
        column :last_name, header: 'Last Name'
        column :email

      end

      cm_show page_title: :first_name do
        tab :profile, '' do
          cm_show_section 'User details' do
            field :first_name, label: 'First name'
            field :last_name, label: 'Last name'
            field :email, label: 'Email'
          end
        end
        tab :dsl, 'user_dsl', layout_type: 'cm_association_show', partial: '/cm_admin_demo/users/dsl'
      end
    end
  end
end