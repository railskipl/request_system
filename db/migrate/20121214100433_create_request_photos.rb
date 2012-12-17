class CreateRequestPhotos < ActiveRecord::Migration
  def change
    create_table :request_photos do |t|
      t.integer :request_id
      t.timestamps
    end
  end
end
