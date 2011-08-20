require 'spec_helper'

describe Artist do

  describe 'test Relations' do

    before(:each) do
      @user = User.create!(:name => "Example Artist", :email => "example.artist@gmail.com", :password => "example", :password_confirmation => "example")
      @attr = { 
        :user_id => @user.id,
        :name => "Example Artist",
        :bio => (('A'..'Z').to_a.join + ". " + ('A'..'Z').to_a[0..13].join + ". ") * 50,
        :origin => "Example Land, Exampltopia",
        :years_active => "1900 - Current"
      }
    end

    it "it should be associated with a user" do
      @user.should be_valid
      @artist = Artist.new(@attr)
      @artist.should be_valid
      #@artist.user.should be_valid
      #@artist.user.id == @user.id
      #@artist.user == @user
    end

  end

end
