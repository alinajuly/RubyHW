# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Author.create([{ name: 'Author1' }, { name: 'Author2' }])
Article.create([{ title: 'Article1', body: 'text of body', author: Author.first, status: 0 }, 
                { title: 'Article2', body: 'another text of body', author: Author.second, status: 1 }])

Comment.create([{ body: 'First comment', status: 0, author: Author.first, article: Article.first }, 
                { body: 'Second comment', status: 1, author: Author.first, article: Article.second },
                { body: 'Third comment', status: 1, author: Author.second, article: Article.second },
                { body: 'Fourth comment', status: 1, author: Author.last, article: Article.second }])

Like.create([{ likeable_type: 'Article', likeable: Article.first }, 
             { likeable_type: 'Comment', likeable: Comment.first }])

Tag.create([{ title: 'ruby' },
            { title: 'rails' },
            { title: 'rubyonrails'},
            { title: 'programming' }])

ArticleTag.create([{article: Article.first, tag: Tag.find_by(title: 'ruby')}, 
                   {article: Article.second, tag: Tag.find_by(title: 'rails')},
                   {article: Article.second, tag: Tag.find_by(title: 'rubyonrails')},
                   {article: Article.second, tag: Tag.find_by(title: 'programming')}])