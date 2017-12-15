class CreateAssesments < ActiveRecord::Migration[5.1]
  def change
    create_table :assesments do |t|
      t.string :title
      t.decimal :weight, precision: 2, scale: 1

      t.references :course
      t.timestamps
    end
  end
end
