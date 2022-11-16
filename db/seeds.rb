# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#send("bin/rails db:seed:replant".to_sym)

=begin
Category.destroy_all
User.destroy_all
Test.destroy_all
Question.destroy_all
Answer.destroy_all
Result.destroy_all

SQLite3::ConstraintException: FOREIGN KEY constraint failed
=end

categories = Category.create!([{ title: 'Ruby' }, { title: 'HTML' }, { title: 'SQL' }])

users = User.create!([{ name: 'Anna' }, { name: 'Josef' }, { name: 'John' }])

tests = Test.create!(
  [
    { title: 'HTML Basics', level: 0, category_id: categories[1].id, author_id: users[0].id },
    { title: 'Ruby Basics', level: 0, category_id: categories[0].id, author_id: users[1].id },
    { title: 'HTML Medium', level: 1, category_id: categories[1].id, author_id: users[0].id },
    { title: 'Ruby Advanced', level: 2, category_id: categories[0].id, author_id: users[1].id },
    { title: 'SQL Advanced', level: 2, category_id: categories[2].id, author_id: users[2].id }
  ]
)

questions = Question.create!(
  [
    { body: 'Which element supports all spaces in text?', test_id: tests[0].id },
    { body: 'What is the <br> element used for?', test_id: tests[2].id },
    { body: 'What is the difference between puts and print?', test_id: tests[1].id },
    { body: 'short form x = x / 3', test_id: tests[3].id },
    { body: 'What are relational databases?', test_id: tests[4].id }
  ]
)

answers = Answer.create!(
  [
    { body: '<pre>', correct: true, question_id: questions[0].id },
    { body: '<br>', correct: false, question_id: questions[0].id },
    { body: 'To wrap lines', correct: false, question_id: questions[1].id },
    { body: 'To create empty space', correct: false, question_id: questions[1].id },
    { body: 'puts without line break', correct: false, question_id: questions[2].id },
    { body: 'puts with a line break', correct: false, question_id: questions[2].id },
    { body: 'x/3', correct: false, question_id: questions[3].id },
    { body: 'x /= 3', correct: false, question_id: questions[3].id },
    { body: 'Any database', correct: false, question_id: questions[4].id },
    { body: 'A database in which information is stored in the form of two-dimensional tables linked together', correct: false, question_id: questions[4].id }    
  ]
)

results = Result.create!(
  [
    { user_id: users[0].id, test_id: tests[0].id },
    { user_id: users[0].id, test_id: tests[3].id },
    { user_id: users[1].id, test_id: tests[2].id },
    { user_id: users[1].id, test_id: tests[3].id },
    { user_id: users[2].id, test_id: tests[4].id }
  ]
)
