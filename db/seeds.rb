require 'faker'
puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)
User.create!(email: 'admins@admin.com',password: 'adminadmin')

3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
3.times do
  SubjectItem.create!(
    title: Faker::Lorem.sentence,
    teacher: teachers.sample
  )
end

25.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end
students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

Student.all.each do |student|
  n=0
  rand(6..9).times do
    n+=1
    Payment.create!(
        payment_date: Date.new(2016,n,rand(1..28)),
        amount: 200.00,
        student_id: student.id,
        status: "paid"
    )
  end
end

puts "Seeds: done"
