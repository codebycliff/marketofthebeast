require 'spec_helper'

describe "LayoutLinks" do

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

  it "should have a Join page at '/join'" do
    get '/join'
    response.should have_selector('title', :content => "Join Now")
  end


end
