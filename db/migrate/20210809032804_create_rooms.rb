class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      # t.integer :id
      t.references :user

      t.timestamps
    end
  end
end
