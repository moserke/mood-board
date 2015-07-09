class AddStatusToMoods < ActiveRecord::Migration
  def change
    add_column :moods, :status, :string
  end
end
