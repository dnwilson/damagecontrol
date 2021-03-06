require 'spec_helper'

describe Product do
	let(:product){FactoryGirl.create(:product)}

	before {@product = Product.create(name: product.name, product_category_id: 1,
		description: product.description, price: 30.00, image: File.new(Rails.root + "spec/fixtures/rails.png"))}

	subject{@product}

	it{should respond_to(:image)}
	it{should respond_to(:name)}
	it{should respond_to(:description)}
	it{should respond_to(:product_category_id)}
	it{should respond_to(:price)}
	it{should respond_to(:inventory)}
	it{should respond_to(:product_category)}
	it{should respond_to(:downloadable)}

	it{should be_valid}

	describe "when product name is not present" do
		before{@product.name = nil}
		it{should_not be_valid}
	end

	describe "when product name is not present" do
		before{@product.product_category_id = nil}
		it{should_not be_valid}
	end

	describe "when category_id is not present" do
		before{@product.product_category_id = nil}
		it{should_not be_valid}
	end

	describe "when product description is not present" do
		before{@product.description = nil}
		it{should_not be_valid}
	end

	describe "when product price is not present" do
		before{@product.price = nil}
		it{should_not be_valid}
	end
end