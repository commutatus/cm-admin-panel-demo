module Types::Objects
  class UserListType < Types::BaseObject
    graphql_name "UserListType"

    field :paging, Types::Objects::Base::PagingType, null: true
    field :data, [Types::Objects::UserType], null: false
  end
end