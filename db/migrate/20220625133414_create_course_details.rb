class CreateCourseDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :course_details do |t|
      t.string :share_link
      t.integer :page_visit
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
