# == Schema Information
#
# Table name: links
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  label      :string(255)
#  href       :text
#  created_at :datetime
#  updated_at :datetime
#

class Link < ActiveRecord::Base
end
