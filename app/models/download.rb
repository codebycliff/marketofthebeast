class Download < ActiveRecord::Base
  belongs_to :artist
  acts_as_commentable
end
