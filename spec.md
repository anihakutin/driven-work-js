Company
  Methods(Done)
	* technology_breakthroughs, Count
  * problems_solved
  * age
  * ceo_name
CEO(Done)
	Methods
  * technology_breakthroughs, Count
  * problems_solved
  * age
  * formatted_net_worth
  * count_of_companies
  * company_names
Problem(Done)
  Methods
	* company_name
  * years_ago_solved
TechnologyBreakthrough(Done)
  Methods
	* company_name
  * years_ago_solved
User
  Methods
  *
Routes(done)
  * sessions
  * companies
    * technologyBreakthrouh/new, :id/edit
    * problems/new, :id/edit
  * users
  * ceos
  * problems
  * technology_breakthroughs
Controllers(done)
  * sessions_controller
  * users_controller
  * companies_controller
  * ceos_controller
  * problems_controller
  * technology_breakthroughs_controller

Omniauth

Items to complete
  * redirect from login page if logged in
  * Allow users to edit their own profile, button etc
  * any logged in user can edit everything but users
  * only admins can delete posts
  * add edit button to all show pages
  * add delete button to all show pages
  * move new company button to top menu bar
  * move user profile to application layout, exclude login page
  * fix company year founded to only require year, fix bug
  * add validations to user model and basic validations to all models
