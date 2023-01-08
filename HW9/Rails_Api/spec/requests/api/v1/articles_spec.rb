require 'swagger_helper'

RSpec.describe 'api/v1/articles', type: :request do
  let(:author_a) { Author.create(name: 'TOM') }
  let(:article) { Article.create(title: 'test title', body: 'test body', author_id: author_a.id) }
  let(:comment) { Comment.create(body: 'test title comment', article_id: article.id, author_id: author_a.id) }
  let(:tag) { Tag.create(title: 'ruby') }
  let(:id) { article.id }

  path '/api/v1/articles/{id}/update_status' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    patch('update_status article') do
      tags 'Articles'
      consumes 'application/json'

      parameter name: :status, in: :query, schema: {
        type: :string,
        enum: ['unpublished', 'published'],
        default: 'unpublished'
      }, description: 'update article status as published or unpublished'

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

  path '/api/v1/articles' do
    let(:author) { Author.create(name: 'TOM1') }

    get('list articles') do
      tags 'Articles'
      consumes 'application/json'

      parameter name: :status, in: :query, schema: {
        type: :string,
        enum: ['unpublished', 'published'],
        default: 'unpublished'
      }, description: 'returns an article with a status of published or unpublished'
      parameter name: :search_ph, in: :query, type: :string, description: 'Search articles by phrase in title and body.'
      parameter name: :author, in: :query, type: :string, description: 'Search for articles by author.'
      parameter name: :order, in: :query, schema: {
        type: :string,
        enum: ['asc', 'desc'],
      }, description: 'Sort articles by asc and desc'
      parameter name: :search_tag, in: :query, type: :string, description: 'Search articles by tags (separate tags with ",").'

      response(200, 'successful') do
        let(:status) { 'unpublished' }
        let(:search_ph) { 'title' }
        let(:author) { 'TOM' }
        let(:search_tag) { Tag.first }
        let(:order) { 'desc' }

        describe 'queries filters for api/v1/articles' do
          it 'Filter with author' do
            expect(author_a.name).to eq(Author.find_by(name: author).name)
          end

          it 'Filter with tags' do
            article.tags << tag
            expect(article.tags.where(title: 'ruby')).to eq(Article.first.tags)
          end

          it 'Filter with status' do
            expect(article).to eq(Article.find_by(status: status))
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
      
      response(201, 'successful') do
        let(:article) { { title: 'test title', body: 'test body', author_id: author.id, status: 'unpublished' } }

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
    parameter name: 'id', in: :path, type: :integer, description: 'id viewing a specific article'

    get('show article') do
      tags 'Articles'
      consumes 'application/json'

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
        describe 'PATCH api/v1/articles/{id}' do
          it 'check patch article' do
            article.update(body: 'test body')
            expect(Article.find_by(body: 'test body')).to eq(article)
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
      tags 'Articles'
      response(204, 'successful') do
        describe 'DELETE api/v1/articles/{id}' do
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
