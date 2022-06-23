module CmAdmin::Course
  extend ActiveSupport::Concern
  included do
    cm_admin do
      actions only: []
      set_icon "fa fa-user"
      cm_index do
        page_title 'Course'
        page_description 'Manage all courses here'

        column :title
        column :description
      end

      cm_show page_title: :title do
        tab :profile, '' do
          cm_show_section 'User details' do
            field :title
            field :description
          end
        end
        tab :chapters, 'chapters', associated_model: :chapters, layout_type: 'cm_association_index', display_if: lambda {|obj| obj.beginner? } do
          column :title, header: "Title"
          column :description, header: "Description"
        end
        tab :coaches, 'course_coaches', associated_model: :course_coaches, layout_type: 'cm_association_index' do
          column :user_id, header: "User"
        end
        tab :assessments, 'assessments', associated_model: :assessments, layout_type: 'cm_association_index' do
          column :title, header: "Title"
        end
      end

      cm_new page_title: 'Add Course', page_description: 'Enter all details to add course' do
        form_field :title, input_type: :string
        form_field :description, input_type: :string
      end

      cm_edit page_title: 'Edit Course', page_description: 'Enter all details to edit course' do
        form_field :title, input_type: :string
        form_field :description, input_type: :string
      end
    end
  end
end