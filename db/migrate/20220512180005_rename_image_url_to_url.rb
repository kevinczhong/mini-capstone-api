class RenameImageUrlToUrl < ActiveRecord::Migration[7.0]
  def change
    rename_column :images, :image_url, :url
  end
end
