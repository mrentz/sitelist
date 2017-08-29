class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :site
      t.date :date
      t.text :description
      t.text :url

      t.timestamps
    end
  end
end
