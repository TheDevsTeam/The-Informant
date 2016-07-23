class AddCategoryIdToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :category_id, :integer
  end
end
