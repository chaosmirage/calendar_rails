class AddIndexDateToEvents < ActiveRecord::Migration
  def change
    add_index :events, :date
  end
end
