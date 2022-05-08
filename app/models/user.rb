class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :educational_details, inverse_of: :user
    accepts_nested_attributes_for :educational_details, reject_if: :all_blank, allow_destroy: true

  
    cm_admin do
      actions only: []
      set_icon "fa fa-user"
      cm_index do
        page_title 'User'
        page_description 'Manage all users here'

        filter [:first_name, :last_name, :email], :search, placeholder: 'Search'

        column :first_name, header: 'First Name'
        column :last_name, header: 'Last Name'
        column :email

      end
    end

  def super_admin?
    true
  end
end
