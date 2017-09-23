class ChangeDateFormatToStringInSitesModel < ActiveRecord::Migration[5.0]
  def change
    change_column :sites, :date, :string
  end
end
