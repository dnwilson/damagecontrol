require 'spec_helper'

describe Post do
	let(:user){FactoryGirl.create(:user)}
	let(:admin){FactoryGirl.create(:admin)}
	let(:post){FactoryGirl.create(:post)}

	before {@post = admin.posts.build(post_title: "Test Post", 
		post_content: "This is a test post")}

	subject{@post}

	it{should respond_to(:post_title)}
	it{should respond_to(:post_content)}
	it{should respond_to(:user_id)}
	it{should respond_to(:user)}
	it{should belong_to(:user)}

	it{should be_valid}

	describe "when user_id is not present" do
		before{@post.user_id = nil}
		it{should_not be_valid}
	end

	describe "when post_title is not present" do
		before{@post.post_title = nil}
		it{should_not be_valid}
	end

	describe "when post_content is not present" do
		before{@post.post_content = nil}
		it{should_not be_valid}
	end
end