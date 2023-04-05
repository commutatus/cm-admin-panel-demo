class AddCourseMetaToCourse < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :meta_data, :jsonb
  end
end
