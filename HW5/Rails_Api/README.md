# README

* Ruby version 3.1.2

* создано app Rails_Api который возвряшает json по адресу http://127.0.0.1:3000
* взаимодействие с json:
- create:(POST) http://127.0.0.1:3000/api/v1/articles/?article[title]=test1&article[body]=test2
- show:(GET) http://127.0.0.1:3000/api/v1/articles/1
- update:(PUT) http://127.0.0.1:3000/api/v1/articles/1?article[title]=test1&article[body]=test2
- delete: не возможно использовать на прямую, только через postman comand: (DELETE) удаляется через id.



