require 'rails_helper'

RSpec.feature "Visitor adds an item to their cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @category.products.create!(
      name: "Test Item",
      description: Faker::Hipster.sentence(3),
      quantity: 53,
      image: open_asset('apparel1.jpg'),
      price: 100
    )
  end

  scenario "Users can add an item to their cart" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot('test3a-Products-All.png')

    # VERIFY
    click_button('Add').first
    # Find cart text
    expect(page).to have_content(' My Cart (1)')
    # Cart should show added item
    save_screenshot('test3b-Cart-Item-Added.png')
    # Click the cart
    find(:xpath, "//a[@href='/cart']").click
    sleep(1)
    # Prove the cart is working
    save_screenshot('test3c-Cart-With-Item.png')
  end

end
