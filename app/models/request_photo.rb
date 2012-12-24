class RequestPhoto < ActiveRecord::Base
  attr_accessible :photo
    has_attached_file :photo ,:styles => { :thumb => "100x100", :large => "550x550"},
                   :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => "public/attachments/request/:id/:style/:basename.:extension",
                    
                    :convert_options => {
                          :thumb => "-compose Copy -gravity center -extent 100x100",
                          :large => "-compose Copy -gravity center -extent 550x550"
                      }
    belongs_to :request
end
