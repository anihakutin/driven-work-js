# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DATA = {
  :user_keys =>
    ["name", "email", "password_digest", "admin"],
  :users => [
    ["Max Charles", "#{rand(1000..5000)}@gmail.com" "password", true],
    ["Skai Jackson", "#{rand(1000..5000)}@gmail.com" "password", false],
    ["Kaleo Elam", "#{rand(1000..5000)}@gmail.com" "password", false],
    ["Megan Charpentier", "#{rand(1000..5000)}@gmail.com" "password", false],
    ["Hayden Byerly", "#{rand(1000..5000)}@gmail.com" "password", false],
    ["Tenzing Norgay Trainor", "#{rand(1000..5000)}@gmail.com" "password", false],
    ["Davis Cleveland","#{rand(1000..5000)}@gmail.com" "password", false],
    ["Cole Sand","#{rand(1000..5000)}@gmail.com" "password", true],
    ["Quvenzhané Wallis", "#{rand(1000..5000)}@gmail.com" "password", true]
  ],
  :company_keys =>
    ["name", "description", "year_founded", "user_id", "ceo_id"],
  :companies => [
    ["Tesla", "Eletric Vehicle Startup", "1-05-2007", 1, 1],
    ["InVision App", "Collaborative Design Studio", "1-05-2011", 1, 2],
    ["SpaceX", "Rocket Company", "1-05-2008", 2, 1],
    ["Apple", "Technology Company", "1-05-1976", 3, 3]
  ],
  :ceo_keys =>
    ["name", "year_born", "net_worth"],
  :ceos => [
    ["Elon Musk", "6-28-1971", 18900000000],
    ["Clark Valberg", "6-28-1978", 500000000],
    ["Steve Jobs", "2-24-1955", 19000000000]
  ],
  :problem_keys =>
    ["name", "description", "year_solved", "company_id"],
  :problems => [
    ["Cars That Run On Sustainable Energy", "Create compelling electric vehicles for an affordable price", "2-01-2008", 1],
    ["Get design feedback from non technical people ", "Create a platform which allows creators to get feedback from non-technical people, clients and alike", "1-01-2011", 2]
  ],
  :technology_keys =>
    ["name", "description", "year", "company_id"],
  :technology_breakthroughs => [
    ["Affordable and reliable electric battery", "Created affordable and reliable electric batteries that can be used in cars", "2-01-2008", 1],
    ["Self landing Rockets", "Made rocket travel cheaper by landing them and recycling them fro future flights.", "3-30-2017", 3]
  ]
}

def main
  make_users
  make_ceos
  make_companies
  make_problems
  make_technology_breakthroughs
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_ceos
  DATA[:ceos].each do |ceo|
    new_ceo = Ceo.new
    ceo.each_with_index do |attribute, i|
      new_ceo.send(DATA[:ceo_keys][i]+"=", attribute)
    end
    new_ceo.save
  end
end

def make_companies
  DATA[:companies].each do |company|
    new_company = Company.new
    company.each_with_index do |attribute, i|
      new_company.send(DATA[:company_keys][i]+"=", attribute)
    end
    new_company.save
  end
end

def make_problems
  DATA[:problems].each do |problem|
    new_problem = Problem.new
    problem.each_with_index do |attribute, i|
      new_problem.send(DATA[:problem_keys][i]+"=", attribute)
    end
    new_problem.save
  end
end

def make_technology_breakthroughs
  DATA[:technology_breakthroughs].each do |technology_breakthrough|
    new_technology_breakthrough = TechnologyBreakthrough.new
    technology_breakthrough.each_with_index do |attribute, i|
      new_technology_breakthrough.send(DATA[:technology_keys][i]+"=", attribute)
    end
    new_technology_breakthrough.save
  end
end

main
