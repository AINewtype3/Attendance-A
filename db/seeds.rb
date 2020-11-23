# coding: utf-8

User.create!(name: "管理者",
             email: "admin@email.com",
             department: "総務部",
             employee_number: 1,
             password: "password",
             password_confirmation: "password",
             admin: true)
             
User.create!(name: "上長A",
             email: "boss-a@email.com",
             department: "管理部",
             employee_number: 2,
             password: "password",
             password_confirmation: "password",
             boss: true)

User.create!(name: "上長B",
             email: "boss-b@email.com",
             department: "管理部",
             employee_number: 3,
             password: "password",
             password_confirmation: "password",
             boss: true)

60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  department = ""
  employee_number = n+3
  password = "password"
  User.create!(name: name,
               email: email,
               department: department,
               employee_number: employee_number,
               password: password,
               password_confirmation: password)
end

5.times do |n|
  base_point_number = n+1
  base_point_name = ""
  attendance_type = ""
  BasePoint.create!(base_point_number: base_point_number,
                    base_point_name: base_point_name,
                    attendance_type: attendance_type)
  
end