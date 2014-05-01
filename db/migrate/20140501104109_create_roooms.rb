class CreateRoooms < ActiveRecord::Migration
  def change
    create_table :roooms do |t|

      t.timestamps
    end
  end
end
