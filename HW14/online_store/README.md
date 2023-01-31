# README

# Info
* Ruby version 3.1.3
* Ruby on Rails 7.0.4

#
* создано app online_store по адресу http://127.0.0.1:3000

#для начала нужно сделать такие действия:

```ruby
bundle i
rails db:create
rails db:migrate
rails db:seed
rails s
```

регистрацыя пользывателя.

```ruby
http://127.0.0.1:3000/users/sign_in
```

```ruby
email_default: user@ukr.com
password_default: password
```

вход админа.

```ruby
http://127.0.0.1:3000/admin
```

```ruby
email_default: admin@ukr.com
password_default: password
```

для настройки Sidekiq
нужно установить ```redis```, сайт redis ```https://redis.io/docs/getting-started/```
установка redis под linux ```https://redis.io/docs/getting-started/installation/install-redis-on-linux/```
если ```sidekiq``` будет выдавать ошибку ```Connection refused - connect(2) for 127.0.0.1:6379``` то нада прынудительно вызвать командой в консоли ```redis-server```

```ruby
bundle exec sidekiq -C config/sidekiq.yml
http://127.0.0.1:3000/admin/sidekiq/
```