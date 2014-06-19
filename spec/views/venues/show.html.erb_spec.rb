require 'rails_helper'

RSpec.describe "venues/show", :type => :view do
  before(:each) do
    @venue = assign(:venue, Venue.create!(
      :name => "Name",
      :address => "Address",
      :address2 => "Address2",
      :city => "City",
      :state => "State",
      :country => "Country",
      :zipcode => "Zipcode"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Address2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Zipcode/)
  end
end
