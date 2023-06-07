require 'faker'

@user = User.create(name: 'Admin', email: 'admin@admin.com', password: 'Admin2023')

Group.create(name: 'Health', icon: 'https://static.vecteezy.com/system/resources/previews/000/352/913/original/vector-health-icon.jpg', user: @user)
Group.create(name: 'Entertainment', icon: 'https://www.nzherald.co.nz/resizer/MUlOHbOa-W1dAGNB8wAl6Tt9HRg=/576x613/smart/filters:quality(70)/cloudfront-ap-southeast-2.images.arcpublishing.com/nzme/CJ5DUCH5DG26FKFGRBXZODDS2Q.jpg', user: @user)
Group.create(name: 'Restaurant', icon: 'https://th.bing.com/th/id/R.a8497cfa732c8d90305e617a5817e6a3?rik=WRXs0qc6w49lYQ&pid=ImgRaw&r=0', user: @user)

Group.all.each do |group|
    4.times do
        entity = Entity.create(name: Faker::Company.name,
                                amount: Faker::Number.decimal(l_digits: 3, r_digits: 2),
                                author: @user)
        EntityGroup.create(entity: , group:)
    end
end
