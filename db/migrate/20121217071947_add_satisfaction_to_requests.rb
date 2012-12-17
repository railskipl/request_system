class AddSatisfactionToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :satisfaction, :string
  end
end
