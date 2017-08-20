class CreatePoems < ActiveRecord::Migration
  def change
  	create_table :poems do |t|
  		t.integer :user_id
  		t.string :name
  		t.string :body

  		t.timestamps
  	end
  end
end
