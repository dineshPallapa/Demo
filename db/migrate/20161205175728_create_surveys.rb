class CreateSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :surveys do |t|
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
