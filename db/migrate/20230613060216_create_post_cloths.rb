class CreatePostCloths < ActiveRecord::Migration[6.1]
  def change
    create_table :post_cloths do |t|
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
