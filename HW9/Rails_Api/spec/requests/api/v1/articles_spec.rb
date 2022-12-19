require 'swagger_helper'

RSpec.describe 'api/v1/articles', type: :request do

  path '/api/v1/articles/{id}/update_status' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('update_status article') do
      tags 'Articles'
      consumes 'application/json'

      parameter name: :status, in: :query, schema: {
        type: :string,
        enum: ['unpublished', 'published'],
        default: 'unpublished'

      }, description: 'обновить статус статьи как published или unpublished'

      response(200, 'successful') do

#        let(:id) { Article.create(title: 'foo', boby: 'bar', status: 'published').id }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response(404, :not_found) do
        let!(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/articles' do

    get('list articles') do
      tags 'Articles'
      consumes 'application/json'

      parameter name: :status, in: :query, schema: {
        type: :string,
        enum: ['unpublished', 'published'],
        default: 'unpublished'
      }, description: 'возвращает статью со статусом published или unpublished'
      parameter name: :search_ph, in: :query, type: :string, description: 'Поиск статей по фразе в заголовке и теле.'
      parameter name: :author, in: :query, type: :string, description: 'Поиск статей по автору.'
      parameter name: :order, in: :query, schema: {
        type: :string,
        enum: ['asc', 'desc'],
      }, description: 'Сортировать статьи по asc и desc'
      parameter name: :search_tag, in: :query, type: :string, description: 'Искать статьи по тегам (разделять теги ",").'

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
      tags 'Articles'
      consumes 'application/json'

      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          author_id: { type: :integer },
          status: { type: :string, enum: %w[unpublished published], default: 'unpublished' }
        },
        required: [ 'title', 'body', 'author_id', 'status' ]}
      

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
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('show article') do
      tags 'Articles'
      consumes 'application/json'

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
      tags 'Articles'
      consumes 'application/json'

      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          author_id: { type: :integer },
          status: { type: :string, enum: %w[unpublished published], default: 'unpublished' },
        },
        required: [ 'title', 'body', 'author_id', 'status' ]}
      
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
      tags 'Articles'
      consumes 'application/json'

      parameter name: :article, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          body: { type: :string },
          author_id: { type: :integer },
          status: { type: :string, enum: %w[unpublished published], default: 'unpublished' },
        },
        required: [ 'title', 'body', 'author_id', 'status' ]}

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
      tags 'Articles'
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

      response(404, :not_found) do
        let!(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
