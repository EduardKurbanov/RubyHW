# README

# Info
* Ruby version 3.1.2
* Ruby on Rails 7.0.4

#
* создано app Rails_Api который возвряшает json по адресу http://127.0.0.1:3000
* взаимодействие с json:

#для начала нужно сделать такие действия:

```ruby
rails db:create
rails db:migrate
rails db:seed
rails s
```
# работа с api-doc

```ruby
http://127.0.0.1:3000/api-docs/index.html
```

# Rswag и Rspec

```ruby
сгенерировал rswag yaml и запустил swagger-тесты `rails rswag`
откройте swagger api-docs http://localhost:3000/api-docs/index.html
запустить тест с помощью Rspec `rspec spec/requests/api/v1/*_spec.rb`
```

# работа с api
создание ```Author``` спомошю ```POST``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/authors?author[name]=Tom
```
просмотер созданых ```Authors``` спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/authors
```
удалить ```Author``` спомошю ```DELETE``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/authors/:id
```

создание ```Article```  спомошю ```POST``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/articles?article[title]=test&article[body]=test&article[author_id]=:author_id&article[status]=published&article[all_tags]=ruby,iot,rails
```

просмотер созданых ```Article``` спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/articles
```

просмотер ```Article``` статуса спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/arricles?status=published или unpublished
```
просмотер ```Article``` порядок поубыванию и возростанию спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/arricles?order=asc/desc
```

просмотер ```Article``` поиск автора по имени спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/arricles?author=tom
```

просмотер ```Article``` поиск по ключевым именам (поиск производицав в таких полях как ```title, body``` ) спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/arricles?search_ph=one
```

просмотер ```Article``` поиск по ключевым именам (поиск производицав в таких полях как ```tag``` ) спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/arricles?search_tag=iot или несколько ?search_tag=iot&ruby
```

просмотер ```Article``` листать страницы ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/arricles?page=1
```

просмотер конкрет созданого ```Article``` спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/articles/:id
```

обновить ```Article``` спомошю ```PATCH``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/articles/:id?article[title]=test1&article[body]=test1&article[author_id]=:author_id&article[status]=published
```

обновить ```Article```старуса спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/articles/:id/update_status?status=published или unpublished
```

удалить ```Article``` спомошю ```DELETE``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/articles/:id
```

создание ```Comment``` к ```Article```  спомошю ```POST``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/comments?comment[body]=test_body&comment[status]=published&comment[author_id]=:author_id&comment[article_id]=:article_id
```

просмотер созданых ```Comment``` спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/comments
```

просмотер ```Comment``` статуса спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/comments?status=published или unpublished
```

просмотер ```Comment``` c лимитом коментариев спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/comments?last=1
```

обновить ```Comment``` спомошю ```PATCH``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/comments/:id?comment[body]=test_body&comment[status]=published&comment[author_id]=:author_id&comment[article_id]=:article_id
```

обновить ```Comment``` спомошю ```PATCH``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/comments/:id/update_status?status=published или unpublished
```

удалить ```Comment``` спомошю ```DELETE``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/comments/:id
```

создание ```Like``` к ```Comment``` спомошю ```POST``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/comments/:comment_id/likes?like[author_id]=:author_id
```

удаление ```Like``` к ```Comment``` спомошю ```DELETE``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/comments/:comment_id/likes/:id
```

создание ```Like``` к ```Article``` спомошю ```POST``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/articles/:article_id/likes?like[author_id]=:author_id
```

удаление ```Like``` к ```Article``` спомошю ```DELETE``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/articles/:article_id/likes/:id
```

создание ```Tag``` спомошю ```POST``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/tags?tag[title]=ruby
```

просмотер ```Tag``` спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/tags
```

просмотер созданых ```Tag``` спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/tags/:id
```

обновить ```Tag``` спомошю ```PATCH``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/tags/:id
```

удалить ```Tag``` спомошю ```DELETE``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/tags/:id
```





