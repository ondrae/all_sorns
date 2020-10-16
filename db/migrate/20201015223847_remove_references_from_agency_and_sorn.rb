class RemoveReferencesFromAgencyAndSorn < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :sorns, :agencies
    remove_column :sorns, :agency_id, null: false
  end
end
