require 'rails_helper'

RSpec.describe "venues/index", :type => :view do
  before(:each) do
    assign(:venues, [
      Venue.create!(
        :name => "Name",
        :address => "Address",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :country => "Country",
        :zipcode => "Zipcode"
      ),
      Venue.create!(
        :name => "Name",
        :address => "Address",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :country => "Country",
        :zipcode => "Zipcode"
      )
    ])
  end

  it "renders a list of venues" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Address2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Zipcode".to_s, :count => 2
  end
end
