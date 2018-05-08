class Post < ApplicationRecord
  resourcify
  include Authority::Abilities

  belongs_to :user
  # , optional: true




end
