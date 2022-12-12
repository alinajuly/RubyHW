# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Author.create([{ name: 'Irina Sarapina' }, { name: 'Nataliia Kolesnikova' }])
Article.create([{ title: 'Article1', body: 'text of body' }, 
                { title: 'Article2', body: 'another text of body' }])

Comment.create([{ body: 'First comment', status: 0, author: Author.first, article: Article.first }, 
                { body: 'Second comment', status: 1, author: Author.first, article: Article.second },
                { body: 'Third comment', status: 1, author: Author.second, article: Article.second },
                { body: 'Fourth comment', status: 1, author: Author.last, article: Article.second }])

Tag.create([{ title: 'First tag title' }, { title: 'Second tag title' }])
Like.create([{ likeable_type: 'Article', likeable: Article.first }, 
             { likeable_type: 'Comment', likeable: Comment.first }])
