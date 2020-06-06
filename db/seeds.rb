require('pry')
require_relative('../models/member')


member1 = Member.new({ 
    'title' => 'Mr',
    'first_name' => 'Robert',
    'surname' => 'Sterling',
    'mobile' => '07894466287',
    'email' => 'robert_sterling@gmail.com',
    'status' => 'active',
    'membership' => 'premium' 
})
member1.save()

member2 = Member.new({ 
    'title' => 'Mrs',
    'first_name' => 'Emily',
    'surname' => 'Phillips',
    'mobile' => '07345298115',
    'email' => 'emily_123@gmail.com',
    'status' => 'deactivated', 
    'membership' => 'standard'
})
member2.save()

member3 = Member.new({ 
    'title' => 'Ms',
    'first_name' => 'Joselin',
    'surname' => 'Anderson',
    'mobile' => '07987852654',
    'email' => 'joselin_54@gmail.com',
    'status' => 'active', 
    'membership' => 'standard' 
})
member3.save()

binding.pry

nil
