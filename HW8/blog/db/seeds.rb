# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Author.create([{ name: 'Author1' }, { name: 'Author2' }])

Like.create([{ likeable_type: 'Article', likeable: Article.first }, 
             { likeable_type: 'Comment', likeable: Comment.first }])

10.times do
  Tag.create({ title: Faker::ProgrammingLanguage.name })
end

5.times do
  author = Author.create({ name: Faker::ProgrammingLanguage.creator })
  10.times do
    article = Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, author_id: author.id, tag_ids: Tag.pluck(:id).select(&:even?) })
    15.times do
      Comment.create({ body: Faker::Quote.jack_handey, author_id: author.id, article_id: article.id })
    end
  end
end

5.times do
  author = Author.create({ name: Faker::ProgrammingLanguage.creator })
  10.times do
    article = Article.create({ title: Faker::ProgrammingLanguage.name, body:  Faker::Quote.matz, author_id: author.id, tag_ids: Tag.pluck(:id).select(&:odd?) })
    15.times do
      Comment.create({ body: Faker::Quote.jack_handey, author_id: author.id, article_id: article.id })
    end
  end
end
