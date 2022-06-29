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

      end

      cm_show page_title: :title do
        tab :profile, '' do
          cm_show_section 'Coupon details' do
            field :title
          end
        end
      end

      cm_new page_title: 'Add Coupon', page_description: 'Enter all details to add Coupon' do
        form_field :title, input_type: :string
        form_field :discount_amount_cents, input_type: :string
      end

      cm_edit page_title: 'Edit Coupon', page_description: 'Enter all details to edit Coupon' do
        form_field :title, input_type: :string
        form_field :discount_amount_cents, input_type: :string
      end
    end
  end
end