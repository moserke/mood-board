class CreateMood < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.integer :top
      t.integer :left
      t.belongs_to :user

      t.timestamps
    end
  end
end
