class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.uuid :project_id, null: false
      t.integer :scoped_number, default: 0
      t.string :title, null: false
      t.string :state, default: 'new', null: false
      t.integer :priority, default: 0
      t.uuid :owner_id
      t.text :description

      t.timestamps
    end

    add_index :tasks, %i[project_id scoped_number], unique: true
    add_index :tasks, :owner_id
  end
end
