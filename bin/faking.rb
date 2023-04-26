# In the Rails console
require 'faker'
fake = Faker::Internet
edu = Faker::Educator
lorem = Faker::Lorem

@roles = ['teacher', 'student']
@projects = ['Final Project', 'Presentation', 'Semester Project']
# Create a new user

users = []
assignments = []
submissions = []
ratings = []

pilot = User.new
pilot.email = 'joseph.97@osu.edu'
pilot.password = 'asdfasdf'
pilot.role = @roles.sample
pilot.save()
users.append(pilot)

for i in 1..((5..15).to_a.sample)
    user = User.new
    user.email = fake.email
    user.password = 'asdfasdf'
    user.role = @roles.sample
    user.save()
    users.append(user)
end

for i in 1..((25..35).to_a.sample)
    a = Assignment.new
    a.title = edu.course_name + ' ' + @projects.sample
    a.body = lorem.paragraph_by_chars(number: Random.rand(100...500), supplemental: false)
    a.user_id = users.sample.id
    a.save()
    assignments.append(a)
end
# p assignments
# p users

for i in 1..((45..65).to_a.sample)
    s = Submission.new
    u = users.sample
    a = assignments.sample

    s.name = u.email.split('@')[0] + '\'s ' + a.title
    s.description = lorem.paragraph_by_chars(number: Random.rand(300...1000), supplemental: false)
    s.user_id = u.id
    s.assignment_id = a.id
    s.save()
    submissions.append(s)
end

for i in 1..((85..125).to_a.sample)
    r = Rating.new
    u = users.sample
    a = assignments.sample
    s = submissions.sample

    r.score = (1..10).to_a.sample
    r.body = lorem.paragraph_by_chars(number: Random.rand(100...350), supplemental: false)
    r.user_id = u.id
    r.submission_id = s.id
    r.save()
    ratings.append(r)
end