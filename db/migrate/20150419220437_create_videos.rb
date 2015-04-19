class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :image
      t.string :slug
      t.text :description
      t.string :host
      t.string :embed_code

      t.timestamps null: false
    end
  end
end
