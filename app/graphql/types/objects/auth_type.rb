module Types::Objects
  class AuthType < Types::BaseObject
    graphql_name "AuthType"
    field :access_token, String, null: true
    field :expires_at, Types::DateTime, null: true
  end
end
