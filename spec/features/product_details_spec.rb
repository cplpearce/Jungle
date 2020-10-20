require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

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

    9.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        image: open_asset('apparel1.jpg'),
        price: 64.99
      )
    end
  end

  scenario "Users can click on products" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot('test2a-Products-All.png')

    # VERIFY
    click_link('Test Item')
    sleep(1)
    save_screenshot('test2b-Product-Description.png')
    
    page.find('dt', text: 'Quantity')
    page.find('dd', text: '53')
    page.find('dt', text: 'Price')
    page.find('dd', text: '$100.00')
    save_screenshot('test2c-Product-Description-Confirmed.png')
  end

end
