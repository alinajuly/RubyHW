# SHOP

## How to use

* Use git clone to clone repository

`git clone https://github.com/alinajuly/RubyHW.git`

* Install the required gems (Gemfile)
  
`gem install bundler`

`bundle install`

* Attach `config/database.yml` acording `database.yml.example` with changes in database, username and password

* Type in console:
  
`rails db:setup`

`rails s`

## Visit `http://localhost:3000`

## To log in as admin

* visit `http://localhost:3000/admin` and log in as admin:
  
`User: admin@example.com`

`Password: password`

## To upload the images to products as admin please use:

* `shop/public/images`

## To log in as user

* visit `http://localhost:3000` and log in as the default user:

`User: 'user@example.com'`

`Password: password`
