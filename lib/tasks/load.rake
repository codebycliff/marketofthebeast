
namespace :db do

  namespace :populate do

    desc "Fill database with sample data"
    task :extras => :environment do
      User.create!(:name => "Example User",
                   :email => "example@railstutorial.org",
                   :password => "foobar",
                   :password_confirmation => "foobar")
      99.times do |n|
        name = Faker::Name.name
        email = "example-#{n+1}@railstutorial.org"
        password = "password"
        User.create!(:name => name, :email => email, :password => password, :password_confirmation => password)
      end

    end

    desc "Load default values in database"
    task :defaults => :environment do 
      admin_users = [
        User.create!(
          :name => "Cliff Braton",
          :email => "cliff.braton@gmail.com",
          :password => "cliff.braton", 
          :password_confirmation => "cliff.braton"
        ),
        User.create!(
          :name => "Danny Wolf",
          :email => "dannywolf@gmail.com",
          :password => "dannywolf",
          :password_confirmation => "dannywolf"
        )
      ]
      admin_users.each do |a|
        a.toggle!(:admin)
      end
      users = [
        User.create!(:name => "Wrestling with Wolves", :email => "wrestlingwithwolves@gmail.com", :password => "wrestlingwithwolves", :password_confirmation => "wrestlingwithwolves"),
        User.create!(:name => "Diamonds for Eyes", :email => "diamondsforeyes@gmail.com", :password => "diamondsforeyes", :password_confirmation => "diamondsforeyes"),
        User.create!(:name => "Doubting Daniel and the Deliverance" , :email => "doubtingdaniel@gmail.com", :password => "doubtingdaniel", :password_confirmation => "doubtingdaniel")
      ]
      info = ["2009 - current", "2010 - current", "2011 - current"]
      link_info = {
        "Facebook" => "http://facebook.com/",
        "Twitter" => "http://twitter.com/",
        "Reverb Nation" => "http://reverbnation.com/"
      }
      fake_bio = 'lorem ipsum dolor sit amet, consectetur adipiscing elit. ut non aliquam risus. nunc porta viverra ornare. vivamus vitae elit nulla. phasellus fringilla nisl eget urna pharetra accumsan. vivamus tristique eros et neque posuere scelerisque. curabitur venenatis rhoncus semper. pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. suspendisse potenti. etiam vulputate tempus diam ut blandit. maecenas dapibus urna ac nunc sollicitudin dapibus. proin ut tellus libero, a euismod mi.  donec consectetur, urna ut ultrices elementum, orci magna convallis arcu, vitae rutrum leo dui non sem. suspendisse potenti. quisque bibendum elementum malesuada. praesent et ligula quam. mauris hendrerit sagittis mi, non auctor nisi auctor quis. curabitur ac vestibulum nisi. morbi in magna nulla, vel ultricies sapien. suspendisse eu lorem vel eros tempus condimentum. etiam porta malesuada tortor ac vestibulum. etiam orci nulla, varius eget dignissim et, ultrices vel metus. mauris vel ligula sed turpis vulputate euismod. quisque tempor aliquet molestie. maecenas congue mauris et nisl vestibulum faucibus. suspendisse vestibulum sem vel erat fringilla id lobortis urna viverra. quisque fermentum gravida egestas. quisque luctus orci et eros consequat egestas.'
      idx = 0
      users.each do |user|
        Artist.create!(:user_id => user.id, :name => user.name, :origin => "Des Moines, Iowa", :years_active => info[idx], :bio => fake_bio)
        link_info.each { |lbl,url| Link.create!(:user_id => user.id, :label => lbl, :href => url + user.name.downcase.gsub(/ /, '')) }
        idx = idx + 1
      end

      Show.create!(:title => "Market of the Beast Presents...", :description => "", :who => "Cleos Apartment, [5], [3], Mother Culture, The New Bodies and [4]", :where => "Vaudeville Mews", :when => DateTime.strptime("2011/02/11 19:30:00", "%Y/%m/%d %H:%M:%S"), :cost => "$10")
      Show.create!(:title => "The War I Survived", :description => "", :who => "The War I Survived, [3]", :where => "Vaudeville Mews", :when => DateTime.strptime("2011/07/16 21:00:00", "%Y/%m/%d %H:%M:%S"), :cost => "$7")
      Show.create!(:title => "Pictures of Then", 
                   :description => "Hailing from Minneapolis, MN, PICTURES OF THEN is a collision of contradictions that teeters between past and present without staking claim in either. Their hauntingly familiar sound is defined by indulging rebellion, escaping from the shackles of familiarity, tasting freedom for the first time, seizing second chances, unleashing repressed anger, and the inevitable yearning to return to the age of innocence. On the heels of their latest release 'And The Wicked Sea', the band has garnered national recognition with relentless touring, and heaps of press - including featured accolades from the likes of USA Today's Popcandy, Paste Magazine, and Billboard Magazine. Onstage their energy is electric, catapulting from stingingly wistful tunes to full-throttle psychedelic abandon. Their organic and captivating live performance has earned them coveted slots at CMJ (NYC), SXSW (Austin,TX), Summerfest (Milwaukee, WI) and the Billboard Magazine Music Conference (Chicago, IL). The band continues to to tour in support of their current release with plans to release their next album 2011-12.", 
                   :who => 'Pictures of Then, Mystic Dynasty, [4], Vag of Courage, Radiant Heart',
                   :when => DateTime.strptime("2011/08/20 20:00:00", "%Y/%m/%d %H:%M:%S"),
                   :where => "Vaudeville Mews",
                   :cost => "$5")
      
    end

  end

  desc "Reset database, run migrations, and populate with information"
  task :redo => :environment do
    Rake::Task['db:reset'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:test:prepare'].invoke
    Rake::Task['db:populate:defaults'].invoke
    Rake::Task['db:populate.extras'].invoke
  end

end
