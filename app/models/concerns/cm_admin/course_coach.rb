module CmAdmin::CourseCoach
  extend ActiveSupport::Concern
  included do
    cm_admin do
      visible_on_sidebar false
      actions only: []
      set_icon "fa fa-user"
      cm_index do
        page_title 'CourseCoach'
        page_description 'Manage all CourseCoach here'

        column :title
        column :description

      end

      cm_show page_title: :course do
        tab :profile, '' do
          cm_show_section 'CourseCoach details' do
            field :title
            field :description
          end
        end
      end

      cm_new page_title: 'Add CourseCoach', page_description: 'Enter all details to add CourseCoach' do
        cm_section 'CourseCoach Details' do
          form_field :user_id, input_type: :string
          form_field :course_id, input_type: :single_select, label: 'Access level', collection: Course.only_beginner.map {|course| [course.title, course.id]}
          form_field :description, input_type: :string
        end
      end

      cm_edit page_title: 'Edit CourseCoach', page_description: 'Enter all details to edit CourseCoach' do
        cm_section 'CourseCoach Details' do
          form_field :title, input_type: :string
          form_field :description, input_type: :string
        end
      end
    end
  end
end