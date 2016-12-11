class AddDealIdToSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :deal_id, :integer
  end
end
