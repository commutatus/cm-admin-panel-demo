module CmAdmin
  module CustomHelper
    def print_name
      ['name']
    end
    def course_collection
      ::Course.only_beginner.map {|course| [course.title, course.id]}
    end
  end
end