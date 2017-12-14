class AddCoursesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :user, :course, :refrences
  end
end
