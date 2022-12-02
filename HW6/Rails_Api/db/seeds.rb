# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Article.create([
    {
      title: 'First article',
      body: 'Some text for article',
      author_id: 1
    },
    {
      title: 'Second one',
      body: 'Some more text for article',
      author_id: 2
    },
    {
      title: 'One more article',
      body: 'Again, another text for article',
      author_id: 3
    },
    {
      title: 'Fourths article',
      body: 'Well, this is also text for article',
      author_id: 1
    }
  ])

Author.create([
   {
     name: 'TOM'
   },
   {
     name: 'ED'
   },
   {
     name: 'JECK'
   }
 ])

Comment.create([
    {
      body: 'TEST COMMEMT TOM',
      status: "unpublished",
      author_id: 1,
      article_id: 1
    },
    {
      body: 'TEST COMMENT TOM',
      status: "published",
      author_id: 1,
      article_id: 1
    },
    {
      body: 'TEST COMMENT ED',
      status: "unpublished",
      author_id: 2,
      article_id: 1
    },
    {
      body: 'TEST COMMENT JECK',
      status: "published",
      author_id: 3,
      article_id: 1
    },
    {
      body: 'TEST COMMENT ED',
      status: "published",
      author_id: 2,
      article_id: 1
    }
  ])