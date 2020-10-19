require 'rails_helper'

RSpec.describe Product, type: :model do

  # Test validations
  # Use .valid? as opposed to save to speed up i/o tests
  describe 'Validate products' do
    before(:each) do
      @category = Category.new name: 'Leftorium'
      @product = Product.new(name: 'Left Handed Spatula', price: 29, quantity: 10, category: @category)
    end

    it 'validates with all fields filled' do
      @product.save!
      expect(@product).to be_persisted
    end

    it 'should not save without a name' do
      @product.name = nil
      @product.valid?
      expect(@product).to_not be_valid
    end

    it 'should not save without a price' do
      @product.price_cents = nil
      @product.valid?
      expect(@product).to_not be_valid
    end

    it 'should not save without a quantity' do
      @product.quantity = nil
      @product.valid?
      expect(@product).to_not be_valid
    end

    it 'should not save without a category' do
      @product.category = nil
      @product.valid?
      expect(@product).to_not be_valid
    end
  end
end
