require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do

  path '/api/v1/comments/{id}/update_status' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('update_status comment') do
      tags 'Comments'
      consumes 'application/json'

      parameter name: :status, in: :query, schema: {
        type: :string,
        enum: ['unpublished', 'published'],
        default: 'unpublished'
      }, description: 'обновить статус комментария как published или unpublished'

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

  path '/api/v1/comments' do

    get('list comments') do
      tags 'Comments'
      consumes 'application/json'

      parameter name: :status, in: :query, schema: {
        type: :string,
        enum: ['unpublished', 'published'],
        default: 'unpublished'
      }, description: 'возвращает комментарии со статусом published или unpublished'

      parameter name: :last, in: :query, type: :integer, description: 'возвращает комментарии последнего лимита с limit: integer.'

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
      tags 'Comments'
      consumes 'application/json'

      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          status: { type: :string, enum: %w[unpublished published], default: 'unpublished' },
          author_id: { type: :integer },
          article_id: { type: :integer }
        },
        required: [ 'body', 'status', 'author_id', 'article_id' ]}

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

  path '/api/v1/comments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    patch('update comment') do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          status: { type: :string, enum: %w[unpublished published], default: 'unpublished' },
          author_id: { type: :integer },
          article_id: { type: :integer }
        },
        required: [ 'body', 'status', 'author_id', 'article_id' ]}

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

    put('update comment') do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          status: { type: :string, enum: %w[unpublished published], default: 'unpublished' },
          author_id: { type: :integer },
          article_id: { type: :integer }
        },
        required: [ 'body', 'status', 'author_id', 'article_id' ]}

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

    delete('delete comment') do
      tags 'Comments'

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
