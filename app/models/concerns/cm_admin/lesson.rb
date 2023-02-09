module CmAdmin::Lesson
  extend ActiveSupport::Concern
  included do
    cm_admin do
      visible_on_sidebar false
      actions only: []
      set_icon "fa fa-user"
      # nested_inside :chapter
      cm_index do
        page_title 'Lesson'
        page_description 'Manage all Lesson here'

        column :title
        column :description

      end

      cm_show page_title: :title do
        tab :profile, '' do
          cm_show_section 'Lesson details' do
            field :title
            field :description
          end
        end
      end

      cm_new page_title: 'Add Lesson', page_description: 'Enter all details to add lesson' do
        cm_section 'Lesson Details' do
          form_field :title, input_type: :string
          form_field :description, input_type: :string
        end
      end

      cm_edit page_title: 'Edit Lesson', page_description: 'Enter all details to edit lesson' do
        cm_section 'Lesson Details' do
          form_field :title, input_type: :string
          form_field :description, input_type: :string
        end
      end
    end
  end
end