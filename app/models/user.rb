class User < ApplicationRecord
  include CmAdmin::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :educational_details, inverse_of: :user
    accepts_nested_attributes_for :educational_details, reject_if: :all_blank, allow_destroy: true

  has_one_attached :profile_picture

  validates :first_name, presence: true
  validates :first_name, length: { maximum: 10, too_long: "%{count} characters is the maximum allowed" }


  enum gender: { male: 0, female: 1 }

  def user_name
    email.split('@').first
  end

  def super_admin?
    true
  end
end
