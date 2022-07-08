class CreateBlogDbs < ActiveRecord::Migration[7.0]
  def change
    create_table :blog_dbs do |t|
      t.string :name
      t.string :article

      t.timestamps
    end
  end
end
