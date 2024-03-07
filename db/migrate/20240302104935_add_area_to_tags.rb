class AddAreaToTags < ActiveRecord::Migration[6.1]
  def change
    add_column :tags, :area, :string
  end
end
