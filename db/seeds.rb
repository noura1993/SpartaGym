require('pry')
require_relative('../models/member')
require_relative('../models/sparta_class')

member1 = Member.new({ 
    'title' => 'Mr',
    'first_name' => 'Robert',
    'surname' => 'Sterling',
    'mobile' => '07894466287',
    'email' => 'robert_sterling@gmail.com',
    'status' => 'Active',
    'membership' => 'Premium' 
})
member1.save()

member2 = Member.new({ 
    'title' => 'Mrs',
    'first_name' => 'Emily',
    'surname' => 'Phillips',
    'mobile' => '07345298115',
    'email' => 'emily_123@gmail.com',
    'status' => 'Deactivated', 
    'membership' => 'Standard'
})
member2.save()

member3 = Member.new({ 
    'title' => 'Ms',
    'first_name' => 'Joselin',
    'surname' => 'Anderson',
    'mobile' => '07987852654',
    'email' => 'joselin_54@gmail.com',
    'status' => 'Active', 
    'membership' => 'Standard' 
})
member3.save()


sparta_class1 = SpartaClass.new({ 
    'class_name' => 'Yoga',
    'capacity' => '10',
    'trainer_name' => 'Lily',
    'room' => 'E40',
    'day' => 'Monday',
    'time' => '07:00',
    'status' => 'Active' 
})
sparta_class1.save()

sparta_class2 = SpartaClass.new({ 
    'class_name' => 'Zomba',
    'capacity' => '20',
    'trainer_name' => 'Nancy',
    'room' => 'X30',
    'day' => 'Wednesday',
    'time' => '18:00', 
    'status' => 'Deactivated'
})
sparta_class2.save()

sparta_class3 = SpartaClass.new({ 
    'class_name' => 'HIIT',
    'capacity' => '15',
    'trainer_name' => 'Tom',
    'room' => 'Z20',
    'day' => 'Friday',
    'time' => '08:00', 
    'status' => 'Active' 
})
sparta_class3.save()


binding.pry

nil
