class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.string :title
      t.text :description
      t.text :link
      t.text :link1

      t.timestamps
    end
  end
end
