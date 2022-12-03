# API application on Ruby on Rails

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

### To chanfe status of comments

* use PATCH/PUT 
* path /api/v1/comments/1
* change status unpublished: 0, published: 1