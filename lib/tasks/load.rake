desc "Echo RAILS_ENV"

require "#{Rails.root}/config/environment"

task :load do 
  sh %{ bundle exec rake db:reset }
  User.create!(:name => "cliff braton", :email => "cliff.braton@gmail.com", :password => "cliff.braton", :password_confirmation => "cliff.braton")
  User.create!(:name => "Danny Wolf", :email => "dannywolf@gmail.com", :password => "dannywolf", :password_confirmation => "dannywolf")
  users = [
    User.create!(:name => "Wrestling with Wolves", :email => "wrestlingwithwolves@gmail.com", :password => "wrestlingwithwolves", :password_confirmation => "wrestlingwithwolves"),
    User.create!(:name => "Diamonds for Eyes", :email => "diamondsforeyes@gmail.com", :password => "diamondsforeyes", :password_confirmation => "diamondsforeyes"),
    User.create!(:name => "Doubting Daniel and the Deliverance" , :email => "doubtingdaniel@gmail.com", :password => "doubtingdaniel", :password_confirmation => "doubtingdaniel")
  ]
  info = ["2009 - current", "2010 - current", "2011 - current"]
  fake_bio = 'lorem ipsum dolor sit amet, consectetur adipiscing elit. ut non aliquam risus. nunc porta viverra ornare. vivamus vitae elit nulla. phasellus fringilla nisl eget urna pharetra accumsan. vivamus tristique eros et neque posuere scelerisque. curabitur venenatis rhoncus semper. pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. suspendisse potenti. etiam vulputate tempus diam ut blandit. maecenas dapibus urna ac nunc sollicitudin dapibus. proin ut tellus libero, a euismod mi.  donec consectetur, urna ut ultrices elementum, orci magna convallis arcu, vitae rutrum leo dui non sem. suspendisse potenti. quisque bibendum elementum malesuada. praesent et ligula quam. mauris hendrerit sagittis mi, non auctor nisi auctor quis. curabitur ac vestibulum nisi. morbi in magna nulla, vel ultricies sapien. suspendisse eu lorem vel eros tempus condimentum. etiam porta malesuada tortor ac vestibulum. etiam orci nulla, varius eget dignissim et, ultrices vel metus. mauris vel ligula sed turpis vulputate euismod. quisque tempor aliquet molestie. maecenas congue mauris et nisl vestibulum faucibus. suspendisse vestibulum sem vel erat fringilla id lobortis urna viverra. quisque fermentum gravida egestas. quisque luctus orci et eros consequat egestas.'
  idx = 0
  users.each do |user|
    Artist.create!(:user_id => user.id, :name => user.name, :origin => "Des Moines, Iowa", :years_active => info[idx], :bio => fake_bio)
    idx = idx + 1
  end
  sh %{ echo Created users and artists }
end
