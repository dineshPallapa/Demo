class Deal < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :surveys

  has_attached_file :image, styles: { large: "400x400>",  medium: "300x300>", thumb: "200x200>"},
                            :default_url => "/system/avatars/:style/missing.png",
                            :url  => "/system/:attachment/:id/:style_:filename",
                            :path => ":rails_root/public/system/:attachment/:id/:style_:filename"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end