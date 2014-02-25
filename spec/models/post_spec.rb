require 'spec_helper'

describe Post do
	let(:user){FactoryGirl.create(:user)}
	let(:admin){FactoryGirl.create(:admin)}
	let(:post){FactoryGirl.create(:post)}

	before {@post = admin.posts.build(title: "Test Post", 
		body: "This is a test post")}

	subject{@post}

	it{should respond_to(:title)}
	it{should respond_to(:body)}
	it{should respond_to(:user_id)}
	it{should respond_to(:user)}
	it{should belong_to(:user)}

	it{should be_valid}

	describe "when user_id is not present" do
		before{@post.user_id = nil}
		it{should_not be_valid}
	end

	describe "when title is not present" do
		before{@post.title = nil}
		it{should_not be_valid}
	end

	describe "when body is not present" do
		before{@post.body = nil}
		it{should_not be_valid}
	end
end