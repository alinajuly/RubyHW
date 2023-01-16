require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'api/v1/articles', type: :request do
  let(:author)  { Author.create(name: 'Sasha') }
  let(:article) { Article.create(title: 'Title', body: 'Body title', author_id: author.id) }
  let(:comment) { Comment.create(body: 'comment', author_id: author.id, article_id: article.id) }
  let(:id)      { article.id }

  path '/api/v1/articles' do
    let(:tag)         { Tag.create(title: 'programming') }
    let(:author_name) { Author.create(name: 'Sasha') }
    let(:article)     { Article.create(title: 'Title', body: 'Text of body', author_id: author_name.id) }
    let(:comment)     { Comment.create(body: 'comment', author_id: author.id, article_id: article.id) }

    get('list articles') do
      tags 'Article'
      parameter name: :search_phrase, in: :query, type: :string, description: 'To search phrase in title or body of Article'    
      parameter name: :status, in: :query, schema: { type: :string, enum: %w[unpublished published] },
                description: 'To filter Article by status: published/unpublished'
      parameter name: :author, in: :query, type: :string, description: 'To search Article by author name'
      parameter name: :tags, in: :query, type: :string, description: 'To search Article by tag name'
      parameter name: :order, in: :query, type: :string, description: 'To sort Articles by title in ascending(asc) or descending(decs) order'
      response(200, 'successful') do
        let(:tags)          { article.tags.first }
        let(:search_phrase) { 'Title' }
        let(:author)        { 'Sasha' }
        let(:order)         { 'desc' }
        let(:status)        { 'unpublished' }
        let(:order)         { 'desc' }

        describe 'filters for api/v1/articles' do
          it 'should returns status response' do
            expect(response.status).to eq(200)
          end

          it 'search phrase in title or body of Article' do
            expect(article).to eq(Article.find_by(title: search_phrase))
          end

          it 'search Article by author name' do
            expect(author_name.name).to eq(Author.find_by(name: author).name)
          end

          it 'search Article by tag name' do
            article.tags << tag
            expect(article.tags.where(title: 'programming')).to eq(Article.first.tags)
          end
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create article') do
      tags 'Article'
      consumes 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          author_id: { type: :integer }
        }, 
        required: %w[title body author_id status]
      }
      
      response(201, 'successful') do
        let(:article) { { title: 'Title2', body: 'Text of body2', author_id: author_name.id } }

        it 'should returns status response' do
          expect(response.status).to eq(201)
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/articles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'article id'
    get('show article with comments') do
      tags 'Article'
      
      response(200, 'successful') do
        it 'should returns status response' do
          expect(response.status).to eq(200)
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update article') do
      tags 'Article'
      consumes 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          status: { type: :string, enum: %w[unpublished published] },
        },
        required: %w[title body status]
      }
      
      response(200, 'successful') do
        describe 'PATCH api/v1/articles{id}' do
          it 'should returns status response' do
            expect(response.status).to eq(200)
          end

          it 'check putch article' do
            article.update(body: 'New text')
            expect(Article.find_by(body: 'New text')).to eq(article)
          end
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update article') do
      tags 'Article'
      consumes 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          status: { type: :string, enum: %w[unpublished published] },
        },
        required: %w[title body status]
      }
      
      response(200, 'successful') do
        describe 'PUT api/v1/articles{id}' do
          it 'should returns status response' do
            expect(response.status).to eq(200)
          end

          it 'check put article' do
            article.update(body: 'New text')
            expect(Article.find_by(body: 'New text')).to eq(article)
          end
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete article') do
      tags 'Article'
      
      response(200, 'successful') do
        describe 'DELETE api/v1/articles{id}' do
          it 'should returns status response' do
            expect(response.status).to eq(200)
          end
          
          it 'delete article' do
            article.destroy
            expect(Article.count).to eq(0)
          end
        end
        run_test!
      end
    end
  end
end
