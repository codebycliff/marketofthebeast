# == Schema Information
#
# Table name: artists
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  name         :string(255)
#  bio          :text(255)
#  origin       :string(255)
#  years_active :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Artist < ActiveRecord::Base
  belongs_to :user
  has_many :downloads
  acts_as_commentable
end
