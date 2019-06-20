Company
  Methods
	* technology_breakthroughs, Count
  * problems_solved
  * age
  * ceo_name
CEO
	Methods
  * technology_breakthroughs, Count
  * problems_solved
  * age
  * formatted_net_worth
  * count_of_companies
  * company_names
Problem
  Methods
	* company_name
  * years_ago_solved
TechnologyBreakthrough
  Methods
	* company_name
  * years_ago_solved
User
  Methods
  * companies_submitted
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
