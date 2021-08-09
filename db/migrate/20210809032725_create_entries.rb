class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      # t.integer :id
      t.references :user
      t.references :room

      t.timestamps
    end
  end
end
