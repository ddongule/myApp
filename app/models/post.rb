class Post < ApplicationRecord
  resourcify
  include Authority::Abilities

  mount_uploader :image, ImageUploader
   # Tells rails to use this uploader for this model.
   validates :title, presence: true
   # Make sure the title is present.



  belongs_to :user
  has_many :comments, :dependent => :destroy
  # , optional: true

end
