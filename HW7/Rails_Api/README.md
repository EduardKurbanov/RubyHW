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

# работа с api
создание ```Author``` спомошю ```POST``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/authors?author[name]=Tom
```
просмотер созданых ```Authors``` спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/authors
```
создание ```Article```  спомошю ```POST``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/articles?article[title]=test&article[body]=test&article[author_id]=:author_id&article[status]=published
```

добавить ```Tag``` к ```Article``` спомошю ```GET``` запроса:
```
http://127.0.0.1:3000/api/v1/articles/:id/tag_add?tag=iot
```

просмотер созданых ```Article``` спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/articles
```

просмотер ```Article``` статуса спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/arricles?status=published или unpublished
```

просмотер конкрет созданого ```Article``` спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/articles/:id
```

обновить ```Article``` спомошю ```PATCH``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/articles/:id?article[title]=test1&article[body]=test1&article[author_id]=:author_id&article[status]=published
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


обновить ```Comment``` спомошю ```PATCH``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/comments/:id?comment[body]=test_body&comment[status]=published&comment[author_id]=:author_id&comment[article_id]=:article_id
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





