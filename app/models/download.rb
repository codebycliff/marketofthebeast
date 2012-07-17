# == Schema Information
#
# Table name: downloads
#
#  id         :integer         not null, primary key
#  artist_id  :integer
#  title      :string(255)
#  filename   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  filetype   :string(255)
#

class Download < ActiveRecord::Base
  belongs_to :artist
  acts_as_commentable
end
