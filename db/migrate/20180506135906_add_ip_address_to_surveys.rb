class AddIpAddressToSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :surveys, :ip_address, :string
  end
end
