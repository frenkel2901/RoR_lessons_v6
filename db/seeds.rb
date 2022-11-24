# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#send("bin/rails db:seed:replant".to_sym)

Result.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
User.destroy_all
Category.destroy_all

categories = Category.create!([{ title: 'Ruby' }, { title: 'HTML' }, { title: 'SQL' }])

users = User.create!([{ name: 'Anna' }, { name: 'Josef' }, { name: 'John' }])

tests = Test.create!(
  [
    { title: 'HTML Basics', level: 0, category: categories[1], author: users[0] },
    { title: 'Ruby Basics', level: 0, category: categories[0], author: users[1] },
    { title: 'HTML Medium', level: 1, category: categories[1], author: users[0] },
    { title: 'Ruby Advanced', level: 2, category: categories[0], author: users[1] },
    { title: 'SQL Advanced', level: 2, category: categories[2], author: users[2] }
  ]
)

questions = Question.create!(
  [
    { body: 'Which element supports all spaces in text?', test: tests[0] },
    { body: 'What is the <br> element used for?', test: tests[2] },
    { body: 'What is the difference between puts and print?', test: tests[1] },
    { body: 'short form x = x / 3', test: tests[3] },
    { body: 'What are relational databases?', test: tests[4] }
  ]
)

answers = Answer.create!(
  [
    { body: '<pre>', correct: true, question: questions[0] },
    { body: '<br>', correct: false, question: questions[0] },
    { body: 'To wrap lines', correct: false, question: questions[1] },
    { body: 'To create empty space', correct: false, question: questions[1] },
    { body: 'puts without line break', correct: false, question: questions[2] },
    { body: 'puts with a line break', correct: false, question: questions[2] },
    { body: 'x/3', correct: false, question: questions[3] },
    { body: 'x /= 3', correct: false, question: questions[3] },
    { body: 'Any database', correct: false, question: questions[4] },
    { body: 'A database in which information is stored in the form of two-dimensional tables linked together', correct: false, question: questions[4] }  
  ]
)

results = Result.create!(
  [
    { user: users[0], test: tests[0] },
    { user: users[0], test: tests[3] },
    { user: users[1], test: tests[2] },
    { user: users[1], test: tests[3] },
    { user: users[2], test: tests[4] }
  ]
)
