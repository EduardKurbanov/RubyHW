# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Tag.create([
  {
    title: 'ruby'
  },
  {
    title: 'ruby2'
  },
  {
    title: 'ruby3'
  },
  {
    title: 'ruby3'
  }
])

Article.create([
    {
      title: 'First article',
      body: 'Some text for article',
      author_id: 1,
      status: 'published',
      tag_ids: [1, 2, 3]

    },
    {
      title: 'Second one',
      body: 'Some more text for article',
      author_id: 2,
      status: 'published',
      tag_ids: [2, 1, 3]
    },
    {
      title: 'One more article',
      body: 'Again, another text for article',
      author_id: 3,
      status: 'unpublished',
      tag_ids: [3, 2, 1]
    },
    {
      title: 'Fourths article',
      body: 'Well, this is also text for article',
      author_id: 1,
      status: 'unpublished',
      tag_ids: [1, 3, 2]
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
   },
   {
    name: 'EDDIE'
  },
 ])

Comment.create([
    {
      body: 'TEST COMMEMT TOM',
      status: "unpublished",
      author_id: 1,
      article_id: 1
    },
    {
      body: 'TEST COMMENT ED',
      status: "published",
      author_id: 2,
      article_id: 2
    },
    {
      body: 'TEST COMMENT JECK',
      status: "unpublished",
      author_id: 3,
      article_id: 3
    },
    {
      body: 'TEST COMMENT EDDIE',
      status: "published",
      author_id: 4,
      article_id: 4
    },
    {
      body: 'TEST COMMENT ED',
      status: "published",
      author_id: 2,
      article_id: 1
    }
  ])