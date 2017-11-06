class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :description
      t.string :semester
      t.string :note

      t.timestamps
    end
  end
end
