module CmAdmin::ZoomRegistration
  extend ActiveSupport::Concern
  included do
    cm_admin do
      actions only: []
      set_icon "fa fa-user"
      cm_index do
        page_title 'Zoom Registration'
        page_description 'Manage all Zoom Registrations here'

        column :zoom_id, header: 'Zoom ID'
        column :registrant_name, header: 'Registrant Name'

      end

      cm_show page_title: :registrant_name do
        tab :profile, '' do
          cm_show_section 'Zoom Registration details' do
            field :zoom_id, label: 'Zoom ID'
            field :registrant_name, label: 'Registrant name'
            field :cover_image, field_type: :attachment
            field :body_text, label: 'Body text'
          end
        end

      end
      
      cm_new page_title: 'Add Zoom', page_description: 'Enter all details to add zoom' do
        cm_section 'Add zoom details' do
          form_field :zoom_id, input_type: :string
          form_field :registrant_name, input_type: :string
          form_field :cover_image, input_type: :single_file_upload
          form_field :body_text, input_type: :rich_text
        end
      end

      cm_edit page_title: 'Edit Zoom', page_description: 'Enter all details to edit zoom' do
        cm_section 'Edit zoom details' do
          form_field :zoom_id, input_type: :string
          form_field :registrant_name, input_type: :string
          form_field :cover_image, input_type: :single_file_upload
          form_field :body_text, input_type: :rich_text
        end
      end
    end
  end
end