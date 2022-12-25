require 'swagger_helper'
require 'rails_helper'

RSpec.describe 'api/v1/comments', type: :request do
  let(:author) { Author.create(name: 'Author name') }
  let(:article) { Article.create(title: 'Title', body: 'Body title', author_id: author.id) }
  let(:comment) { Comment.create(body: 'Body comment', article_id: article.id, author_id: author.id) }
  let(:id) { comment.id }
  let(:limit) { '10' }

  path '/api/v1/comments' do
    get('list comments') do
      tags 'Comment'
      parameter name: :limit, in: :query, type: :integer, description: 'To show last comments'

      response(200, 'successful') do
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

    post('create comment') do
      tags 'Comment'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          author_id: { type: :integer },
          article_id: { type: :integer }
        }, 
        required: %w[body author_id article_id]
      }

      response(201, 'successful') do
        let(:comment) { { body: 'Body comment', article_id: article.id, author_id: author.id } }
        
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

  path '/api/v1/comments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'comment id'
    get('show comment') do
      tags 'Comment'

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

    patch('update comment') do
      tags 'Comment'
      consumes 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          status: { type: :string, enum: %w[unpublished published] },
        },
        required: %w[body status]
      }

      response(200, 'successful') do
        describe 'PATCH api/v1/comments{id}' do
          it 'check putch comment' do
            comment.update(body: 'New text')
            expect(Comment.find_by(body: 'New text')).to eq(comment)
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

    put('update comment') do
      tags 'Comment'
      consumes 'application/json'
      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          status: { type: :string, enum: %w[unpublished published] },
        },
        required: %w[body status]
      }

      response(200, 'successful') do
        describe 'PUT api/v1/comments{id}' do
          it 'check put comment' do
            comment.update(body: 'New text')
            expect(Comment.find_by(body: 'New text')).to eq(comment)
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

    delete('delete comment') do
      tags 'Comment'

      response(200, 'successful') do
        describe 'DELETE api/v1/comments{id}' do
          it 'should returns status response' do
            expect(response.status).to eq(200)
          end
          it 'delete comment' do
            article.destroy
            expect(Comment.count).to eq(0)
          end
        end
        run_test!
      end
    end
  end
end
