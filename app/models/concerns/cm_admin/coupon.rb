module CmAdmin::Coupon
  extend ActiveSupport::Concern
  included do
    cm_admin do
      actions only: []
      set_icon "fa fa-user"
      cm_index do
        page_title 'Coupon'
        page_description 'Manage all Coupon here'

        column :title
        column :status, header: 'Status'

        custom_action name: 'activate', route_type: "member", verb: "post", path: ':id/activate', display_type: :button, display_if: ->(coupon) { coupon.disabled? } do
          coupon = ::Coupon.find(params[:id])
          coupon.activate
          coupon
        end

        custom_action name: 'deactivate', route_type: "member", verb: "post", path: ':id/deactivate', display_type: :button, display_if: ->(coupon) { coupon.enabled? } do
          coupon = ::Coupon.find(params[:id])
          coupon.deactivate
          coupon
        end

      end

      cm_show page_title: :title do
        tab :profile, '' do
          cm_show_section 'Coupon details' do
            field :title
          end
        end
      end

      cm_new page_title: 'Add Coupon', page_description: 'Enter all details to add Coupon' do
        cm_section 'Add coupon details' do
          form_field :title, input_type: :string
          form_field :discount_amount_cents, input_type: :string
        end
      end

      cm_edit page_title: 'Edit Coupon', page_description: 'Enter all details to edit Coupon' do
        cm_section 'Edit Coupon details' do
          form_field :title, input_type: :string
          form_field :discount_amount_cents, input_type: :string
        end
      end
    end
  end
end