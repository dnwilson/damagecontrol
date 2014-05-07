require 'spec_helper'

describe EventsController do

  # Set valid event attributes
  let(:valid_attributes) { { "name" => "Exciting Event", 
                             "description" => "This is a description of the event", 
                             "venue" => "Some Venue",
                             "date" => "12-12-2014",
                             "venue" => "Club Test",
                             "address" => "1 Test Drive",
                             "city" => "Testville",
                             "state" => "TS",
                             "zipcode" => "12345",
                             "flyer" => File.new(Rails.root + "spec/fixtures/fiyah.jpg") } }

  describe "GET index" do
    it "assigns all events as @events" do
      event = Event.create! valid_attributes
      get :index
      assigns(:events).should eq([event])
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
