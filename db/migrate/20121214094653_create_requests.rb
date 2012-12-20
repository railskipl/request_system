class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :phone_no
      t.string :request_type
      t.text :details_of_request
      t.boolean :permission
      t.string :status

      t.timestamps
    end
  end
end
