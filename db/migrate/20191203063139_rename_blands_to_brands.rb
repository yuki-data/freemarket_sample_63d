class RenameBlandsToBrands < ActiveRecord::Migration[5.2]
  def change
    rename_table :blands, :brands
  end
end
