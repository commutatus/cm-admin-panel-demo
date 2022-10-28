module Types::Objects
  class CourseType < Types::BaseObject

    graphql_name "Course"

    field :id,                  Integer, null: false
    field :title,               String, null: false
  end
end