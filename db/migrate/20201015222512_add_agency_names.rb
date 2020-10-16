class AddAgencyNames < ActiveRecord::Migration[6.0]
  def change
    add_column :sorns, :agency_names, :string
  end
end
