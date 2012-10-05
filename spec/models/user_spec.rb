# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe User do

  before(:each) do
  	@attr={:name=>"example user", :email=> "example@email.com"}
  end

  it "should create a new instance given valid attributes" do
  	User.create!(@attr)
  end
  it "should reqire name" do
  no_name_user= User.new(@attr.merge(:name=>""))
  no_name_user.should_not be_valid
	end

	it "should reqire an email" do
  no_email_user= User.new(@attr.merge(:email=>""))
  no_email_user.should_not be_valid
	end

	it "should reject too long names" do
		long_name="a"*51
		long_name_user=User.new(@attr.merge(:name=>long_name))
		 long_name_user.should_not be_valid
	end


	it "should ACCEPT valid email" do
		addresses=%w[user@email.com THE_USER@lsd.co.uk snaays.goodman@namd.snails]
		addresses.each do |address|
			valid_email_user =User.new(@attr.merge(:email=>address))
			valid_email_user.should be_valid
		end
	end


	it "should not ACCEPT invalid email" do
		addresses=%w[user@email,com THE_USER_dslsd.co.uk snaays.goodman@namd.]
		addresses.each do |address|
			invalid_email_user =User.new(@attr.merge(:email=>address))
			invalid_email_user.should_not be_valid
		end
	end

	it "should not accept duplicate email" do 
		User.create!(@attr)
		user_with_duplicate_email=User.new(@attr)
		user_with_duplicate_email.should_not be_valid
	end

	it "duplicated upcase email shoud not be valid " do 
		upcased_email=@attr[:email].upcase
		User.create!(@attr.merge(:email=>upcased_email))
		user_with_duplicate_email=User.new(@attr)
		user_with_duplicate_email.should_not be_valid
	end
end


