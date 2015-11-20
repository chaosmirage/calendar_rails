class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string    :title
      t.date      :date
      t.string    :type_repeat
      t.timestamps null: false
    end
  end
end
