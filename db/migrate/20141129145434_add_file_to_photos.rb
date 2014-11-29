class AddFileToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :file, :string
  end
end
