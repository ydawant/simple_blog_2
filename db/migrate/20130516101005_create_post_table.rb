class CreatePostTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :null => false
      t.string :author, :default => false
      t.string :body, :null => false
      t.references :user
      t.timestamps
    end
  end
end
