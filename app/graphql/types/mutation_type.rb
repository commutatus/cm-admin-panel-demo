module Types
  class MutationType < Types::BaseObject
    # TODO: remove me

    field :cart_item_add,         mutation: Mutations::Cart::ItemAdd
    field :cart_item_remove,      mutation: Mutations::Cart::ItemRemove
    field :link_cart_to_user,     mutation: Mutations::Cart::LinkCartToUser

  end
end
