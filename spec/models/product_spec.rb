require 'rails_helper'

RSpec.describe Product, :type => :model do
  
  describe 'Validations' do
  
    before(:all) do
      @cat = Category.create(name: "test category")
    end

    it "Should validate a fully defined product" do
      @p = Product.create(price: 10, name: "cool", quantity: 10, category: @cat)
      @p.save
      expect(@p).to be_valid
    end


    it "Should validate presence of name" do
      @p = Product.create(price: 10, name: nil, quantity: 10, category: @cat)
      @p.save
      # expect(@p).to be_invalid
      expect(@p.errors.full_messages).to include "Name can't be blank"
      # @p = Product.create(name: "sbdfsdf", price: 10, quantity: 10, category: @cat)
      # expect(@p).to be_valid
    end
    
    it "Should validate presence of price" do
      @p = Product.create(name: "bleh", price: nil, quantity: 10, category: @cat)
      @p.save
      expect(@p.errors.full_messages).to include "Price can't be blank"
      
      # @p = Product.create(price: 10, name: "bleh", quantity: 10, category: @cat)
      # expect(@p).to be_valid
    end
    
    it "Should validate presence of quantity" do
    @p = Product.create(name: "bleh", quantity: nil, price: 10, category: @cat)
    @p.save
    expect(@p.errors.full_messages).to include "Quantity can't be blank"
    
    # @p = Product.create(price: 10, name: "bleh", quantity: 10, category: @cat)
    # expect(@p).to be_valid
    end
    
    it "Should validate presence of category" do
    @p = Product.create(name: "bleh", price: 10, category: nil, quantity: 10)
    @p.save
    expect(@p.errors.full_messages).to include "Category can't be blank"
    
    # @p = Product.create(price: 10, name: "bleh", quantity: 10, category: @cat)
    # expect(@p).to be_valid
    end

  end    

end
