require 'spec_helper'

describe "LayoutLinks" do

  describe "when not signed in" do

     it "should have a subscribe link" do
        visit root_path
        response.should have_selector("a", :href => new_user_path)
     end

     it "should have a signin link" do
        visit root_path
        response.should have_selector("a", :href => login_path)
      end

  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      visit login_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => logout_path, :content => "Logout")
    end

    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user), :content => "Profile")
    end

  end


  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact")
  end

  it "should have a About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About")
  end

  it "should have a Legal page at '/legal'" do
    get '/legal'
    response.should have_selector('title', :content => "Legal")
  end

  it "should have a Join page at '/subscribe'" do
    get '/subscribe'
    response.should have_selector('title', :content => "Subscribe Now")
  end


end
