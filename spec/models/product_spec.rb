require 'spec_helper'

describe Product do
	let(:product){FactoryGirl.create(:product)}

	before {@product = Product.create(prod_name: product.prod_name, 
		prod_description: product.prod_description, prod_price: 30)}

	subject{@product}

	it{should respond_to(:prod_name)}
	it{should respond_to(:prod_description)}
	it{should respond_to(:prod_price)}
	it{should respond_to(:prod_downloadable)}

	it{should be_valid}

	describe "when product name is not present" do
		before{@product.prod_name = nil}
		it{should_not be_valid}
	end

	describe "when product description is not present" do
		before{@product.prod_description = nil}
		it{should_not be_valid}
	end

	describe "when product price is not present" do
		before{@product.prod_price = nil}
		it{should_not be_valid}
	end
end