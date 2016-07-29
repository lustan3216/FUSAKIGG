class AddZipCountryDistrictToOrder < ActiveRecord::Migration
  def change
    add_column :orders,:district,:string
    add_column :orders,:county,:string
  end
end
