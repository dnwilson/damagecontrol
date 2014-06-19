json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :address, :address2, :city, :state, :country, :zipcode
  json.url venue_url(venue, format: :json)
end
