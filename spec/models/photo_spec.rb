require 'spec_helper'

describe Photo do
  let(:gallery) { Gallery.create(name: "My Album", description: "Some Awesome Photos" ) }

  before{ @photo = gallery.photos.create(image: File.new(Rails.root + "spec/fixtures/rails.png")) }

  subject { @photo }

  it{should respond_to(:name)}
  it{should respond_to(:gallery)}
  it{should respond_to(:image)}
  it{should respond_to(:gallery_id)}

  it{should be_valid }

  describe "when photo name is not present" do
  	before{@photo.name = nil}
	it{should_not be_valid}
  end

  describe "when gallery_id is not present" do
  	before{@photo.gallery_id = nil}
	it{should_not be_valid}
  end

  describe "when photo image is not present" do
  	before{@photo.image = nil }
	it{should_not be_valid}
  end
end
