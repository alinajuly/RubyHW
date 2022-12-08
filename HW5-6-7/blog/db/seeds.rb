# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

authors = Author.create([{ name: 'Irina Sarapina' }, { name: 'Nataliia Kolesnikova' }])
articles = Article.create([{ title: 'Article1', body: 'text of body' }, 
                          { title: 'Article2', body: 'another text of body' }])
comments = Comment.create([{ body: 'First comment', status: 0, author_id: 1, article: Article.first }, 
                          { body: 'Second comment', status: 1, author_id: 2, article: Article.second }])
tags = Tag.create([{ title: 'First tag title' }, { title: 'Second tag title' }])
likes = Like.create([{ likeable_type: 'Article', likeable_id: Article.first }, 
                    { likeable_type: 'Comment', likeable_id: Comment.first }])
