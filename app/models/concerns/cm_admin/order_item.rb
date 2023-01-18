module CmAdmin::OrderItem
  extend ActiveSupport::Concern
  included do
    cm_admin do
      actions only: []
      set_icon "fa fa-user"
      cm_index do
        page_title 'order_item'
        page_description 'Manage all order_item here'

        column :product_id

        custom_action name: 'fetch_product_details', route_type: 'member', verb: 'get', path: '/products/:product_id/detail', display_type: :route do
          allowed_params = params.permit(:product_id).to_h
          product_id = allowed_params[:product_id]
          product = Product.find(product_id)
          {
            fields: [
              {
                target_type: :input,
                target_value: {
                  table: 'order_item',
                  field_name: 'product_price',
                  field_value: product.price.to_i
                }
              }
            ]
          }
        end

      end

      cm_show page_title: :name do
        tab :profile, '' do
          cm_show_section 'order_item details' do
            field :product_id
          end
        end
      end

      cm_new page_title: 'Add order_item', page_description: 'Enter all details to add order_item' do
        # Uncomment below field once the linked field PR is merged
        form_field :product_id, input_type: :single_select, helper_method: :product_collection, target: { action_name: :fetch_product_details }
        form_field :product_price, input_type: :string
      end

      cm_edit page_title: 'Edit order_item', page_description: 'Enter all details to edit order_item' do
        form_field :order_item_type, input_type: :string
        form_field :product_price, input_type: :string
      end
    end
  end
end