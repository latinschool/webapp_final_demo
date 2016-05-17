class CreatePostsTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :title
  		t.text 	 :content

  		t.integer :user_id

		t.datetime :created_at
		t.datetime :updated_at
  	end
  end
end
