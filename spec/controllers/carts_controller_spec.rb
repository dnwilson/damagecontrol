require 'spec_helper'

describe CartsController do

  describe "GET 'purchase'" do
    it "returns http success" do
      get 'purchase'
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
