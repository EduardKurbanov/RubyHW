require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do
  let(:author) { Author.create(name: 'ED') }
  let(:article) { Article.create(title: 'test title', body: 'test body', author_id: author.id) }
  let(:comment) { Comment.create(body: 'test comment body', article_id: article.id, author_id: author.id) }
  let(:id) { comment.id }

  path '/api/v1/comments/{id}/update_status' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    patch('update_status comment') do
      tags 'Comments'
      consumes 'application/json'

      parameter name: :status, in: :query, schema: {
        type: :string,
        enum: ['unpublished', 'published'],
        default: 'unpublished'
      }, description: 'update comment status as published or unpublished'

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

  path '/api/v1/comments' do

    get('list comments') do
      tags 'Comments'
      consumes 'application/json'

      parameter name: :status, in: :query, schema: {
        type: :string,
        enum: ['unpublished', 'published'],
        default: 'unpublished'
      }, description: 'returns comments with a status of published or unpublished'

      parameter name: :last, in: :query, type: :integer, description: 'returns the comments of the last limit with limit: integer.'

      response(200, 'successful') do
        let(:last) { '4' }

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

      response(201, 'successful') do
        let(:comment) { { body: 'test comment body', status: 'unpublished',author_id: author.id, article_id: article.id } }

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
        describe 'PATCH api/v1/comments/{id}' do
          it 'check patch comment' do
            comment.update(body: 'test body')
            expect(Comment.find_by(body: 'test body')).to eq(comment)
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
      tags 'Comments'

      response(204, 'successful') do
        describe 'DELETE api/v1/comments/{id}' do
          it 'delete comment' do
            comment.destroy
            expect(Comment.count).to eq(0)
          end
        end
        run_test!
      end
    end
  end
end
