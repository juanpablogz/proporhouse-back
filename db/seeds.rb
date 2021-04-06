if Rails.env.development?
    # AdminUser.create!(email: 'admin@example.com', password: 'password')
    # User.create!(email: 'admin@example.com', password: 'password')
    # country = Country.create(name: 'Colombia')
    # department = Department.create(country_id: country.id, name: 'Antioquia')
    city = City.create(department_id: Department.first.id, name: 'Medellin')
    neighborhood = Neighborhood.create(city_id: city.id, name: 'Robledo')
end
# Setting.create_or_find_by!(key: 'min_version', value: '0.0')
