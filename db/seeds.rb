# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
courses = [
    {
        code: 'CS01',
        description: 'Course 01',
        semester: 'Fall 2016',
        note: 'Shenime',
    },
    {
        code: 'CS02',
        description: 'Course 02',
        semester: 'Fall 2016',
        note: 'Shenime',
    }
]

roles = [
    {
        code: 'INS',
        description: 'Instructor'
    },
    {
        code: 'STD',
        description: 'Student'
    }
]

users = [
    {
        name: 'Ermal',
        surname: 'Karaboja',
        email: 'ermalkaraboja@gmail.com',
        password: 'Ermal1234!',
        role_id: 1
    },
    {
        name: 'Ernida',
        surname: 'Kraja',
        email: 'ernidakraja@gmail.com',
        password: 'Ernida1234!',
        role_id: 2
    },
    {
        name: 'Zhorzheta',
        surname: 'Sota',
        email: 'zhorzhetasota@gmail.com',
        password: 'Zhorzheta1234!',
        role_id: 2
    }
]

courses.each {|course| Course.create! course}
roles.each {|role| Role.create! role}
users.each {|user| User.create! user}
