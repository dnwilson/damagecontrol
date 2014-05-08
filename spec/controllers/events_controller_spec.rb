require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

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


  before do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET index" do
    it "assigns all events as @events" do
      event = Event.create! valid_attributes
      get :index
      assigns(:events).should eq([event])
    end
  end

  describe "GET show" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :show, {:id => event.to_param}
      assigns(:event).should eq(event)
    end
  end

  describe "GET edit" do
    it "assigns the requested event as @event" do
      event = Event.create! valid_attributes
      get :edit, {:id => event.to_param}
      assigns(:event).should eq(event)
    end
  end

end
