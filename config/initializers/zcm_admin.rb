Rails.application.reloader.to_prepare do
  CmAdmin.configure do |config|
    # Sets the default layout to be used for admin
    config.layout = 'admin'
    # byebug
    config.included_models = [User, ZoomRegistration, Course, Chapter, Lesson, CourseCoach, Assessment, Coupon, Log, Product, FileImport]
  end
end