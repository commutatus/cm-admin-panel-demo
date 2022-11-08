CmAdmin.configure do |config|
  # Sets the default layout to be used for admin
  config.layout = 'admin'
  config.included_models = [User, EducationalDetail, ZoomRegistration, Course, Chapter, Lesson, CourseCoach, Assessment, Coupon, Log, Product]
end