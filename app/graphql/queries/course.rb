module Queries
  class Course < Queries::BaseQuery
    description "Fetch all or specific Course detail"

    type Types::Objects::CourseListType, null: true

    argument :paging, Types::Inputs::Base::Paging, required: false
    argument :sort, Types::Inputs::Base::Sort, required: false

    def resolve(paging: nil, filters: nil, sort: nil)
      raise Unauthorized, I18n.t("graphql.unauthorized") if (filters && filters.my) && Current.user.nil?
      ::Course.all.list(paging&.per_page, paging&.page_no)
    end

  end
end
