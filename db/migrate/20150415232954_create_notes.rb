class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :body
      t.datetime :note_taken_at
      t.references :user

      t.timestamps null: false
    end
  end
end
