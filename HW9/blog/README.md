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

### To change status of comments

* use PATCH/PUT 
* path /api/v1/comments/1
* change status unpublished: 0, published: 1

### To show last 10 comments of Article

* use GET
* path /api/v1/articles/1

### To find phrase in title or body of Article

* use GET
* path /api/v1/articles?search_phrase=text of body
* params: search_phrase

### To filter Article by status unpublished: 0, published: 1

* use GET
* path /api/v1/articles?status
* params: status
  
### To filter Article by author name

* use GET
* path /api/v1/articles?author
* params: author

### To filter Article by tag name 

* use GET
* path /api/v1/articles
* use params key `tags` and value tag `title`

### To sort Articles by title in ascending(asc) or descending(decs) order

* use GET
* for ascending /api/v1/articles?order=asc
* for descending /api/v1/articles?order=desc
