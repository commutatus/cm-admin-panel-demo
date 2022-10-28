module CmAdmin
  module CustomHelper
    
    def course_collection
      ::Course.only_beginner.map {|course| [course.title, course.id]}
    end

    def gender_collection
      ::User.genders.map {|gender| [gender[0].titleize, gender[0]]}
    end

    def formatted_mobile_number
      "9677118767"
    end
  end
end