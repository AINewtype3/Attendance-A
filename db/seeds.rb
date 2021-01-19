# coding: utf-8

User.create!(name: "管理者",
             email: "admin@email.com",
             affiliation: "総務部",
             employee_number: 1,
             uid: 1,
             basic_work_time: "8:00",
             designated_work_start_time: "9:00",
             designated_work_end_time: "18:00",
             password: "password",
             password_confirmation: "password",
             superior: false,
             admin: true)
             


5.times do |n|
  base_point_number = n+1
  base_point_name = ""
  attendance_type = ""
  BasePoint.create!(base_point_number: base_point_number,
                    base_point_name: base_point_name,
                    attendance_type: attendance_type)
  
end