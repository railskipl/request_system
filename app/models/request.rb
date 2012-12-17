class Request < ActiveRecord::Base
    attr_accessible :details_of_request, :permission, :phone_no, :request_type, :status,:request_photos_attributes,:user_id,:satisfaction
    has_many :request_photos , :dependent => :destroy
   
    accepts_nested_attributes_for :request_photos, :reject_if => lambda { |a| a[:photo].blank? }, :allow_destroy => true
    belongs_to :user
end
