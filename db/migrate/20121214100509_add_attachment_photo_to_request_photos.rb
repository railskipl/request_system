class AddAttachmentPhotoToRequestPhotos < ActiveRecord::Migration
  def self.up
    change_table :request_photos do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :request_photos, :photo
  end
end
