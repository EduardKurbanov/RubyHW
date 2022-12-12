# README

* Ruby version 3.1.2
* Ruby on Rails 7.0.4

* создано app Rails_Api адресу http://127.0.0.1:3000
* взаимодействие с json:

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

просмотер созданых ```Article``` спомошю ```GET``` запроса:

```ruby
http://127.0.0.1:3000/api/v1/articles
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

