class CreateToy < ActiveRecord::Migration[7.0]
  def change
    create_table :toys do |t|
      t.string :name
      t.references :toyable_type, null: false, polymorphic: true
      t.references :toyable, null: false, polymorphic: true

      t.timestamps
    end
    add_index :toys, [:name, :toyable_id, :toyable_type], unique: true
  end
end
