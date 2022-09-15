class CreateAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :assignments do |t|
      t.integer :student_id
      t.string :title
      t.string :category
      t.string :description
      t.integer :possible_points
      t.integer :earned_points
      t.datetime :due_date
      t.timestamps
    end
  end
end


class add_new_item_to_db  < ActiveRecord::Migration[6.1]
  def change
    add_column :db_name, :column_name, :string
  end
end
