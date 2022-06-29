module CmAdmin
  module CustomHelper
    def print_name
      ['name']
    end
    
    def course_collection
      ::Course.only_beginner.map {|course| [course.title, course.id]}
    end

    def gender_collection
      ::User.genders.map {|gender| [gender[0].titleize, gender[0]]}
    end
  end
end