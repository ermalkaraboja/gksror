class CreateUserCourse < ActiveRecord::Migration[5.1]
  def change
    create_table :usercourse do |t|
      t.references :instructor, index: true
      t.references :student, index: true
      t.references :course, index: true

      t.timestamps
    end
    add_foreign_key :grades, :users, column: :instructor_id, primary_key: :id
    add_foreign_key :grades, :users, column: :student_id, primary_key: :id
  end
end
