- 1 Необхідно написати гем, який створює метод, який приймає контент і зберігає контент, що передається в .html сторінку (всередину body).
- 2 Опціонально метод можна передавати ім'я файла (якщо не передано – index.html).
- 3 Отримуваний файл має бути валідним (https://validator.w3.org/#validate_by_upload).
- 4 Так само, за умовчанням, у переданому контенті метод повинен різати html і js код. Щоб передати код, потрібно передати в метод аргумент bypass_html: true.
- 5 Для гему створити новий репозиторій із довільною назвою (придумайте назву гему).

- 1 створив гем "creates_html_file_test(content=nil, title_arg="my page", arg="index", bypass_html: false)".
- 2 приймае 4 аргументи creates_html_file_test(content=nil, title_arg="my page", arg="index", bypass_html: false)").
- 3 створений файл валідуеця на сайті (https://validator.w3.org/#validate_by_upload).
- 4 зроблено.
- 5 https://github.com/EduardKurbanov/creates_html_file_test
   https://rubygems.org/gems/creates_html_file_test



