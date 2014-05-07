require 'spec_helper'

describe Gallery do
  
  before{ @gallery = Gallery.create(name: "My Gallery", description: "Some Awesome Albums") }

  subject { @gallery }

  it{should respond_to(:name)}
  it{should respond_to(:description)}
  it{should respond_to(:preview_pic)}
  it{should respond_to(:event_id)}
  it{should respond_to(:photos)}
  it{should respond_to(:event)}
  it{should be_valid}

  describe "when gallery name is not present" do
  	before{@gallery.name = nil}
	it{should_not be_valid}
  end

  describe "when gallery name is too long" do
  	before{@gallery.name = "qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfg"}
	it{should_not be_valid}
  end

  describe "when gallery name is too short" do
  	before{@gallery.name = "qw"}
	it{should_not be_valid}
  end

end
