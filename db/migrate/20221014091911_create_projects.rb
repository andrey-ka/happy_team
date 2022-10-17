class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects, id: :uuid do |t|
      t.string :name, null: false
      t.string :code, null: false
      t.string :state, default: 'new', null: false
      t.integer :objective_type, default: 0
      t.text :description

      t.timestamps
    end
    add_index :projects, :code, unique: true
  end
end
