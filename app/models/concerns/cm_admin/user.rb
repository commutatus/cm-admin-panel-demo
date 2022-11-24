module CmAdmin::User
  extend ActiveSupport::Concern
  included do
    cm_admin do
      importable class_name: 'ImportUser', importer_type: 'csv_importer'
      permit_additional_fields [:password]
      actions only: []
      set_icon "fa fa-user"
      cm_index do
        page_title 'User'
        page_description 'Manage all users here'

        filter [:first_name, :last_name, :email], :search, placeholder: 'Search'
        filter :age, :range, placeholder: 'User age'
        filter :dob, :date, placeholder: 'Birthday'
        filter :gender, :single_select,
          collection: ['male', 'female'],
          placeholder: 'Gender'
        filter :gender, :multi_select,
          collection: ['male', 'female'],
          placeholder: 'Gender'

        column :first_name, header: 'First Name'
        column :last_name, header: 'Last Name'
        column :email
        column :age
        column :dob, header: 'Date of birth', field_type: :datetime, format: "%b %d, %Y"
        column :gender, field_type: :tag
        column :mobile_number

        # custom_action name: 'import', route_type: "collection", verb: "post", path: '/import', display_type: :route do
        #   allowed_params = params.permit(file_import: [:import_file, :associated_model_name]).to_h
        #   file_import_params = allowed_params[:file_import]
        #   file_import = FileImport.new(file_import_params).save(validate: false)
        #   FileImport.last
        # end

      end

      cm_show page_title: :first_name do
        tab :profile, '' do
          cm_show_section 'User details' do
            field :first_name, label: 'First name'
            field :last_name, label: 'Last name'
            field :email, label: 'Email'
            field :age
            field :dob, label: 'Date of birth', field_type: :datetime, format: "%b %d, %Y"
            field :gender
            field :mobile_number
          end
        end
        tab :dsl, 'user_dsl', layout_type: 'cm_association_show', partial: '/cm_admin_demo/users/dsl'
        tab :import, 'user_import', layout_type: 'cm_association_show', partial: '/cm_admin_demo/users/import'
      end

      cm_new page_title: 'Add Learner', page_description: 'Enter all details to add learner' do
        form_field :first_name, input_type: :string
        form_field :last_name, input_type: :string
        form_field :email, input_type: :string
        form_field :password, input_type: :string
        form_field :profile_picture, input_type: :single_file_upload
        form_field :age, input_type: :integer
        form_field :dob, input_type: :date
        # To be uncommented once the helper method PR is merged.
        # form_field :gender, input_type: :single_select, helper_method: :gender_collection
        # form_field :mobile_number, input_type: :hidden, helper_method: :formatted_mobile_number
      end

      cm_edit page_title: 'Add Learner', page_description: 'Enter all details to add learner' do
        form_field :first_name, input_type: :string
        form_field :last_name, input_type: :string
        form_field :email, input_type: :string
        form_field :profile_picture, input_type: :single_file_upload
        form_field :age, input_type: :integer
        form_field :dob, input_type: :date
        # form_field :gender, input_type: :single_select, helper_method: :gender_collection
        form_field :mobile_number, input_type: :string
      end

    end
  end
end