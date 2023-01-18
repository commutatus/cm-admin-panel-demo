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

    def location_type_collection(record, field)
      ::Location.location_types.map {|key, val| [key.titleize, key]}
    end

    def parent_location_collection(record, field)
      ::Location.all.map {|location| [location.name, location.id]}
    end

    def country_collection(record, field)
      ::Location.country.map {|location| [location.name, location.id]}
    end

    def product_collection(record, field)
      ::Product.all.map {|product| [product.name, product.id]}
    end

    def product_type_collection(record, field)
      [['Ring', 'ring'], ['Earring', 'earring'], ['Necklace', 'necklace'], ['Bracelet', 'bracelet'], ['Bangle', 'bangle'], ['Pendant', 'pendant'], ['Chain', 'chain'], ['Other', 'other']]
    end
  end
end