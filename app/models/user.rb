class User < ApplicationRecord
  include CmAdmin::User
  include Paginator
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :educational_details, inverse_of: :user
    accepts_nested_attributes_for :educational_details, reject_if: :all_blank, allow_destroy: true

  has_one_attached :profile_picture

  enum gender: { male: 0, female: 1 }

  def user_name
    email.split('@').first
  end

  def super_admin?
    true
  end
end
