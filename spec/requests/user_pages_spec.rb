require 'spec_helper'

describe "UserPages" do   #1
  
  subject { page }
  
  describe "signup page" do  #2
    before { visit signup_path }
    
    it { should have_selector('h1',    text: 'Sign up') }
    it { should have_selector('title', text: full_title('Sign up')) }
  end #2
  
  describe "profile page" do #3
    #code to make a user variable
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    
    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end #3
  
  describe "signup" do #4
    
    before { visit signup_path }
    
    describe "with invalid information" do #5
      it "should not create a user" do #6
        expect { click_button "Sign up" }.not_to change(User, :count)
      end  #6
    end  #5
    
    describe "with valid information" do #7
      before do  #8
        fill_in "Name",           with: "Example User"
        fill_in "Email",          with: "user@example.com"
        fill_in "Password",       with: "foobar"
        fill_in "Confirmation",   with: "foobar"
      end #8

      
      it "should create a user" do #9
        expect { click_button "Sign up" }.to change(User, :count).by(1)
      end  #9
      
      describe "after saving the user" do  #11
        before { click_button "Sign up" }
        let(:user) { User.find_by_email('user@example.com') }
        
        it { should have_selector('title', text: user.name) }
        it { should have_selector('div.flash.success', text: "Welcome") }
        
      end  #11
      
    end #7
    
    describe "error messages" do  #10
      before { click_button "Sign up" }
      
      let(:error) { 'errors prohibited this user from being saved' }
      
      it { should have_selector('title', text: 'Sign up') }
      it { should have_content(error) }
    end  #10
  end  #4
end  #1
