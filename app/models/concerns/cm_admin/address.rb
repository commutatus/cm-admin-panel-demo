module CmAdmin::Address
  extend ActiveSupport::Concern
  included do
    cm_admin do
      actions only: []
      set_icon "fa fa-user"
      cm_index do
        page_title 'address'
        page_description 'Manage all address here'

        column :street_name

        custom_action name: 'country_associated_states', route_type: 'collection', verb: 'get', path: ':country_id/states', display_type: :route do
          allowed_params = params.permit(:country_id).to_h
          country_id = allowed_params[:country_id]
          states = Location.where(parent_id: country_id).map{ |state| [state.name, state.id] }
          {
            fields: [
              {
                target_type: :select,
                target_value: {
                  table: 'address',
                  field_name: 'state_id',
                  field_value: states
                }
              }
            ]
          }
        end

        custom_action name: 'state_associated_cities', route_type: 'collection', verb: 'get', path: ':state_id/cities', display_type: :route do
          allowed_params = params.permit(:state_id).to_h
          state_id = allowed_params[:state_id]
          cities = Location.where(parent_id: state_id).map{ |city| [city.name, city.id] }
          {
            fields: [
              {
                target_type: :select,
                target_value: {
                  table: 'address',
                  field_name: 'city_id',
                  field_value: cities
                }
              }
            ]
          }
        end

      end

      cm_show page_title: :name do
        tab :profile, '' do
          cm_show_section 'address details' do
            field :street_name
          end
        end
      end

      cm_new page_title: 'Add address', page_description: 'Enter all details to add address' do
        form_field :street_name, input_type: :string
        # Uncomment below once the linked field PR is merged
        # form_field :country_id, input_type: :single_select, helper_method: :country_collection, target: { action_name: :country_associated_states }
        # form_field :state_id, input_type: :single_select, target: { action_name: :state_associated_cities }
        form_field :city_id, input_type: :single_select
        # form_field :parent_id, input_type: :single_select, helper_method: :parent_address_collection
      end

      cm_edit page_title: 'Edit address', page_description: 'Enter all details to edit address' do
        form_field :street_name, input_type: :string
      end
    end
  end
end