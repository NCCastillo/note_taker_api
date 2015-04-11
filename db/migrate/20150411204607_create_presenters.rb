class CreatePresenters < ActiveRecord::Migration
  def change
    create_table :presenters do |t|
      t.string :slug
      t.string :first_name
      t.string :last_name
      t.string :twitter

      t.timestamps null: false
    end
  end
end
