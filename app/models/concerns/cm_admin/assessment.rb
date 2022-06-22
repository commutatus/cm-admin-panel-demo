module CmAdmin::Assessment
  extend ActiveSupport::Concern
  included do
    cm_admin do
      visible_on_sidebar false
      actions only: []
      set_icon "fa fa-user"
      cm_index do
        page_title 'Assessment'
        page_description 'Manage all Assessment here'

        column :title
        column :description

      end

      cm_show page_title: :title do
        tab :profile, '' do
          cm_show_section 'Assessment details' do
            field :title
            field :description
          end
        end
      end

      cm_new page_title: 'Add Assessment', page_description: 'Enter all details to add Assessment' do
        form_field :title, input_type: :string
        form_field :description, input_type: :string
      end

      cm_edit page_title: 'Edit Assessment', page_description: 'Enter all details to edit Assessment' do
        form_field :title, input_type: :string
        form_field :description, input_type: :string
      end
    end
  end
end