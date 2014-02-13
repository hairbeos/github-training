class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string 			:title
			t.string 			:author
			t.datetime 		:releaseDate
			t.string 			:keywords
			t.string 			:coverImage
			
      t.timestamps
    end
  end
end
