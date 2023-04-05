module CmAdmin::Location
  extend ActiveSupport::Concern
  included do
    cm_admin do
      actions only: []
      set_icon "fa fa-user"
      cm_index do
        page_title 'location'
        page_description 'Manage all location here'

        column :name
        column :location_type

      end

      cm_show page_title: :name do
        tab :profile, '' do
          cm_show_section 'location details' do
            field :name
            field :location_type
          end
        end
      end

      cm_new page_title: 'Add location', page_description: 'Enter all details to add location' do
        cm_section 'Add location details' do
          form_field :name, input_type: :string
          form_field :location_type, input_type: :single_select, helper_method: :location_type_collection
          form_field :parent_id, input_type: :single_select, helper_method: :parent_location_collection
        end
      end

      cm_edit page_title: 'Edit location', page_description: 'Enter all details to edit location' do
        cm_section 'Edit location details' do
          form_field :name, input_type: :string
          form_field :location_type, input_type: :string
        end
      end
    end
  end
end