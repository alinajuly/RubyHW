require 'swagger_helper'

RSpec.describe 'api/v1/articles', type: :request do
  path '/api/v1/articles' do
    get('list articles') do
      tags 'Article'
      parameter name: :search, in: :query, type: :string, description: 'To search phrase in title or body of Article'    
      parameter name: :status, in: :query, schema: { type: :string, enum: %w[unpublished published] },
                description: 'To filter Article by status: published/unpublished'
      parameter name: :author, in: :query, type: :string, description: 'To search Article by author name'
      parameter name: :tags, in: :query, type: :string, description: 'To search Article by tag name'
      parameter name: :order, in: :query, type: :string, description: 'To sort Articles by title in ascending(asc) or descending(decs) order'
      
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
  end

  path '/api/v1/articles/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'article id'
    get('show article with comments') do
      tags 'Article'      
      response(200, 'successful') do
        let(:id) { '123' }
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
          author_id: { type: :integer },
          status: { type: :string, enum: %w[unpublished published] },
        },
        required: %w[title body status]
      }
      
      response(200, 'successful') do
        let(:id) { '123' }
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
          author_id: { type: :integer },
          status: { type: :string, enum: %w[unpublished published] },
        },
        required: %w[title body status]
      }
      
      response(200, 'successful') do
        let(:id) { '123' }
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
        let(:id) { '123' }
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
end
