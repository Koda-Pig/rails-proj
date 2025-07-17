class CreatePigs < ActiveRecord::Migration[8.0]
  def change
    create_table :pigs do |t|
      t.string :name
      t.boolean :dead

      t.timestamps
    end
  end
end
