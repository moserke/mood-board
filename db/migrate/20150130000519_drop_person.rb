class DropPerson < ActiveRecord::Migration
  def change
    drop_table :person if ActiveRecord::Base.connection.table_exists? :person
  end
end
