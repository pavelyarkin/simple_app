require 'spec_helper'

describe "LayoutLinks" do
	
	it "should be a homepage at '/'" do
		get '/'
		response.should have_selector('title', :content => "Home")
	end


	it "should be an about page at '/about'" do
		get '/about'
		response.should have_selector('title', :content => "About")
	end

	it "should be a contact page at '/contact'" do
		get '/contact'
		response.should have_selector('title', :content => "Contact")
	end

	it "should be a help page at '/help'" do
		get '/help'
		response.should have_selector('title', :content=>"Help")
	end



	it "should be a signup page at '/signup'" do
		get '/signup'
		response.should have_selector('title', :content=>"Sign up")
	end

 	it "should have the right links on the layout" do
    	visit root_path
   	 click_link "About"
   	 response.should have_selector('title', :content => "About")
   	 click_link "Help"
  	  response.should have_selector('title', :content => "Help")
   	 click_link "Contact"
  	 response.should have_selector('title', :content=> "Contact")
   	 click_link "Home"
  	  response.should have_selector('title', :content=> "Home")
  	  click_link "Sign up now!"
  	  response.should have_selector('title', :content=> "Sign up")
 	end
end




 # describe "GET /layout_links" do
  #  it "works! (now write some real specs)" do
   #   # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    #  get layout_links_index_path
     # response.status.should be(200)
    #end
  #end

