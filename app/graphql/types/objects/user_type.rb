module Types::Objects
  class UserType < Types::BaseObject

    graphql_name "User"

    field :id,                  Integer, null: false
    field :email,               String, null: false
  end
end