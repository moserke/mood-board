class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :email
      t.string :name
      t.integer :top
      t.integer :left

      t.timestamps
    end
  end
end
