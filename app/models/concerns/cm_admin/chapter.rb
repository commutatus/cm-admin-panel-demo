module CmAdmin::Chapter
  extend ActiveSupport::Concern
  included do
    cm_admin do
      visible_on_sidebar false
      actions only: []
      set_icon "fa fa-user"
      # nested_inside :course
      cm_index do
        page_title 'Chapter'
        page_description 'Manage all chapters here'
        
        filter [:title], :search, placeholder: 'Search'

        column :title
        column :description

      end

      cm_show page_title: :title do
        tab :profile, '' do
          cm_show_section 'Chapter details' do
            field :title
            field :description
          end
        end
        tab :lessons, 'lessons', associated_model: :lessons, layout_type: 'cm_association_index' do
          column :title, header: "Title"
          column :description, header: "Description"
        end
      end

      cm_new page_title: 'Add Chapter', page_description: 'Enter all details to add chapter' do
        form_field :title, input_type: :string
        form_field :description, input_type: :string
      end

      cm_edit page_title: 'Edit Chapter', page_description: 'Enter all details to edit chapter' do
        form_field :title, input_type: :string
        form_field :description, input_type: :string
      end
    end
  end
end