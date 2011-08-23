class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :downloads
  acts_as_commentable
end
