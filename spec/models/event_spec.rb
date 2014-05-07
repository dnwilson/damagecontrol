require 'spec_helper'

describe Event do
  before{@event = Event.create(name: "Test Event", 
  							   flyer: File.new(Rails.root + "spec/fixtures/fiyah.jpg"),
  							   description: "Some awesome stuff happening over here.",
  							   date: Date.tomorrow,
  							   venue: "Club Test",
  							   address: "1 Test Drive",
  							   city: "Testville",
  							   state: "TS",
  							   zipcode: "12345")}
  subject { @event }

  it{should respond_to(:name)}
  it{should respond_to(:description)}
  it{should respond_to(:flyer)}
  it{should respond_to(:date)}
  it{should respond_to(:venue)}
  it{should respond_to(:address)}
  it{should respond_to(:city)}
  it{should respond_to(:state)}
  it{should respond_to(:zipcode)}
  it{should respond_to(:gallery)}
  it{should respond_to(:videos)}
  it{should be_valid}

  describe "when name is not present" do
  	before{ @event.name = nil }
  	it{should_not be_valid}
  end

  describe "when name is not too long" do
  	before{ @event.name = "qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfg" }
	  it{should_not be_valid}
  end

  describe "when name is too short" do
  	before{ @event.name = "qw" }
	  it{should_not be_valid}
  end

  describe "when date is not present" do
  	before{ @event.date = nil }
	  it{should_not be_valid}
  end

  describe "when date is in the past" do
  	before{ @event.date = Date.yesterday }
	  it{should_not be_valid}
  end

  describe "when date is invalid" do
  	before{ @event.date = "nil" }
	  it{should_not be_valid}
  end

    describe "when venue is not present" do
  	before{ @event.venue = nil }
  	it{should_not be_valid}
  end

  describe "when venue is not too long" do
  	before{ @event.venue = "qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfg" }
	  it{should_not be_valid}
  end

  describe "when venue is too short" do
  	before{ @event.name = "qw" }
	  it{should_not be_valid}
  end
end
