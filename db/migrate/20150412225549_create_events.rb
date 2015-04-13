class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :conference
      t.string :short_code

      t.timestamps null: false
    end
  end
end
