module CmAdmin::Product
  extend ActiveSupport::Concern
  included do
    cm_admin  do
      actions only: []
      cm_index page_title: 'Products', page_description: 'Manage all products here', partial: '/admin/products/index' do
        custom_action name: 'create_product', route_type: "collection", verb: "post", path: '/create', display_type: :modal, partial: '/admin/products/create_modal' do
          allowed_params = params.permit(product: :name).to_h
          product_params = allowed_params[:product]
          Product.new(product_params).save(validate: false)
          @product = Product.where(name: product_params['name']).last
          current_action.redirection_url = "/cm_admin/products/#{@product.id}"
          @product
        end
        # custom_action name: 'list', layout_type: 'cm_association_show', route_type: "collection", verb: "get", path: '/list', display_type: :page, partial: '/un_admin/courses/logs'
        # custom_action name: 'read_all_notification', route_type: "collection", verb: "patch", path: '/read_all', display_type: :button do
        #   # Logic to be added
        #   Current.user.logs
        # end

        custom_action name: 'toggle_review_count', route_type: 'collection', verb: 'get', path: 'toggle/review_count', display_type: :route do
          {
            fields: [
              {
                target_type: :toggle_visibility,
                target_value: {
                  table: 'product',
                  field_name: 'review_count',
                  field_value: ''
                }
              }
            ]
          }
        end
      end
      cm_show page_title: :name do
        tab :profile, '' do
          cm_show_section 'Product details' do
            field :name
            field :description
          end
        end
      end


      cm_new page_title: 'Add product', page_description: 'Enter product details' do
        form_field :name, input_type: :string
        form_field :price, input_type: :string
        form_field :description, input_type: :string
        form_field :display_review, input_type: :check_box, target: { action_name: :toggle_review_count }
        form_field :review_count, input_type: :integer
        form_field :product_type, input_type: :check_box, helper_method: :product_type_collection
      end

      cm_edit page_title: 'Edit product', page_description: 'Enter product details' do
        form_field :name, input_type: :string
        form_field :price, input_type: :string
        form_field :description, input_type: :string
        form_field :display_review, input_type: :check_box
        form_field :review_count, input_type: :integer
        form_field :product_type, input_type: :check_box, helper_method: :product_type_collection
      end
    end
  end
end