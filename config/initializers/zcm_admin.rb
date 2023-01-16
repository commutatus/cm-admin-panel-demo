CmAdmin.configure do |config|
  # Sets the default layout to be used for admin
  config.layout = 'admin'
  config.included_models = [Location, Address, User, ZoomRegistration, Course, Chapter, Lesson, CourseCoach, Assessment, Coupon, Log, Product, OrderItem, FileImport]
end