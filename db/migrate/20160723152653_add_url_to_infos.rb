class AddUrlToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :url, :string
  end
end
