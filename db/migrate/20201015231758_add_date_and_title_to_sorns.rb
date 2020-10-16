class AddDateAndTitleToSorns < ActiveRecord::Migration[6.0]
  def change
    add_column :sorns, :publication_date, :string
    add_column :sorns, :title, :string
    add_column :sorns, :text_url, :string
    add_column :sorns, :subagency, :string
  end
end
