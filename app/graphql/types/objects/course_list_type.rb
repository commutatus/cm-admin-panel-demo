module Types::Objects
  class CourseListType < Types::BaseObject
    graphql_name "CourseListType"

    field :paging, Types::Objects::Base::PagingType, null: true
    field :data, [Types::Objects::CourseType], null: false
  end
end