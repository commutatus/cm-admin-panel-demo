class CreateCourseCoaches < ActiveRecord::Migration[6.1]
  def change
    create_table :course_coaches do |t|
      t.references :course, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
