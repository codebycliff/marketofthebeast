# == Schema Information
#
# Table name: shows
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  when        :datetime
#  where       :string(255)
#  cost        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  who         :string(255)
#

class Show < ActiveRecord::Base
  acts_as_commentable
end
