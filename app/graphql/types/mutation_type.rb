module Types
  class MutationType < Types::BaseObject
    # TODO: remove me

    field :login,                 mutation: Mutations::Auth::Login
    field :verify_otp,            mutation: Mutations::Auth::VerifyOtp

    field :cart_item_add,         mutation: Mutations::Cart::ItemAdd
    field :cart_item_remove,      mutation: Mutations::Cart::ItemRemove
    field :link_cart_to_user,     mutation: Mutations::Cart::LinkCartToUser
    field :razorpay_order_create, mutation: Mutations::Payment::Razorpay::OrderCreate

  end
end
