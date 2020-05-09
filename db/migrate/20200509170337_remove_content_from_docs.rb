class RemoveContentFromDocs < ActiveRecord::Migration[6.0]
  def change
    remove_column :docs, :content
  end
end
