# SHOP

## How to use

* Use git clone to clone repository

`git clone https://github.com/alinajuly/RubyHW.git`

* Install the required gems (Gemfile)
  
`gem install bundler`

`bundle install`

* Attach `config/database.yml` acording `database copy.yml` with changes in database, username and password

* Type in console:
  
`rails db:create`

`rails db:migrate`

`rails db:seed`

`rails s`

## To log in as admin

* visit `http://localhost:3000/admin` and log in as the default user:
  
`User: admin@example.com`

`Password: password`

## To log in as user

* visit `http://localhost:3000`
