class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      #t.references :instructor, index: true
      #t.references :student, index: true

      t.integer :instructor_id, index: true
      t.integer :student_id, index: true

      t.references :assesment, index: true

      t.integer :grade
      t.timestamps
    end
    add_foreign_key :grades, :users, column: :instructor_id, primary_key: :id
    add_foreign_key :grades, :users, column: :student_id, primary_key: :id
  end
end
