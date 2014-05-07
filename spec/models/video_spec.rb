require 'spec_helper'

describe Video do
  before{@video = Video.create(name: "Test Video", 
  							   description: "Some awesome stuff happening over here.",
  							   event_id: 1,
  							   date: Date.yesterday,
  							   url: "http://www.youtube.com/embed/FQJLcIecm6U")}
  subject { @video }

  it{should respond_to(:name)}
  it{should respond_to(:description)}
  it{should respond_to(:url)}
  it{should respond_to(:date)}
  it{should respond_to(:image)}
  it{should respond_to(:event)}
  it{should respond_to(:event_id)}
  it{should be_valid}

  describe "when name is not present" do
  	before{ @video.name = nil }
  	it{should_not be_valid}
  end

  describe "when name is not too long" do
  	before{ @video.name = "qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfg" }
	  it{should_not be_valid}
  end

  describe "when name is too short" do
  	before{ @video.name = "qw" }
	  it{should_not be_valid}
  end

  describe "when date is not present" do
  	before{ @video.date = nil }
	  it{should_not be_valid}
  end

  describe "when date is in the future" do
  	before{ @video.date = Date.tomorrow }
	  it{should_not be_valid}
  end

  describe "when date is invalid" do
  	before{ @video.date = "nil" }
	  it{should_not be_valid}
  end

  describe "when url is not present" do
  	before{ @video.url = nil }
  	it{should_not be_valid}
  end

  describe "when url is invalid" do
  	before{ @video.url = "nil" }
  	it{should_not be_valid}
  end
end
