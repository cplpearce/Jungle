# Jungle

#### A mini e-commerce application built with Rails 4.2 - this mini market offers a ton of cool little features, such as:
* Showcasing various products, defined by categories.
* Smart view rules for rendering out-of-stock goods.
* User management with bcrypt, and a session manager.
* An admin dashboard with the ability to add products, categories, and view a dashboard of your products.
* Admin configurations and stripe API/Keys written to ENV vars with figaro ENV management; and
* user cart management and order viewer for previous checkout and payouts.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Modify `config/application.yaml` for Admin username/password.
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars in `config/application.yaml`
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- A Stripe Account or alternative payment processor

## Screenshots
### Products
![Products](https://raw.githubusercontent.com/cplpearce/Jungle/master/screenshots/Products.png)
### Categories
![Categories](https://raw.githubusercontent.com/cplpearce/Jungle/master/screenshots/CategryView.png)
### User Login
![User Login](https://raw.githubusercontent.com/cplpearce/Jungle/master/screenshots/Login.png)
### Admin Login
![Admin Login](https://raw.githubusercontent.com/cplpearce/Jungle/master/screenshots/AdminLogin.png)
### Admin Edit Products
![Admin Edit Products](https://raw.githubusercontent.com/cplpearce/Jungle/master/screenshots/AdminProducts.png)
### Admin Edit Categories
![Admin Edit Categories](https://raw.githubusercontent.com/cplpearce/Jungle/master/screenshots/AdminLogin.png)
