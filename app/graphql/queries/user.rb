module Queries
  class User < Queries::BaseQuery
    description 'Fetch all user'

    type Types::Objects::UserListType, null: true

    argument :paging, Types::Inputs::Base::Paging, required: false
    argument :sort, Types::Inputs::Base::Sort, required: false

    def resolve(paging: nil, filters: nil, sort: nil)
      ::User.list(paging&.per_page, paging&.page_no)
    end
  end
end
