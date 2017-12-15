class CreateUsercourses < ActiveRecord::Migration[5.1]
  def change
    create_table :usercourses do |t|

      t.integer :instructor_id, index: true
      t.integer :student_id, index: true

      t.references :course, index: true

      t.timestamps
    end
    add_foreign_key :usercourses, :users, column: :instructor_id, primary_key: :id
    add_foreign_key :usercourses, :users, column: :student_id, primary_key: :id
  end
end
