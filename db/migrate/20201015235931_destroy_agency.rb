class DestroyAgency < ActiveRecord::Migration[6.0]
  def change
    drop_table :agencies
  end
end
