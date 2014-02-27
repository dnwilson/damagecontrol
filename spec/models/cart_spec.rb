require 'spec_helper'

describe Cart do
  let(:user) { FactoryGirl.create(:user) }
  let(:product){FactoryGirl.create(:product)}
  # let(:line_item) { Line_Item.create(product_id: product.id, 
  # 	unit_price: product.price, quantity: 1, cart_id: 1 ) }

  before do
    @cart = Cart.create(purchased_at: Time.now)
  end

  it{should respond_to(:purchased_at)}
  
  it{should be_valid}
end
