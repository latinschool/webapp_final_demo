class CreatePosttagsTable < ActiveRecord::Migration
  def change
  	create_table :posttags do |t|
  	  	t.integer :post_id
  	  	t.integer :tag_id
  	  	
		t.datetime :created_at
		t.datetime :updated_at
  	end
  end
end
