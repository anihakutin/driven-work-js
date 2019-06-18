Rails Project Checklist of Requirements

A summary of the application
I’m building an app called “DrivenWork” which will list and organize companies by the problems they solve.
Example: “Tesla, Electric Cars, Solving Sustainable Energy. CEO: Elon Musk, year founded, major breakthroughs ”
User can add/edit company, select or add: CEO, Problem, TechnologyBreakthrough

What will your models and associations be and why? You will need a has_many and belongs_to relationship as well as a many to many relationship.

Company(name, description, year_founded, user_id, ceo_id)
  	* Has_many Problems
  	* Has_many TechnologyBreakthroughs
  	* Belongs_to User
    * Belongs to CEO
CEO(name, age, net_worth)
  	* has_many Companies
  	* Has_many TechnologyBreakthroughs through Companies
  	* Has_many Problems through Companies
Problem(name, description, year_solved, company_id)
  	* Belongs_to Company
TechnologyBreakthrough(name, description, year, company_id)
    * Belongs_to Company
User(name, password, admin?)
    * Has_many companies

How will you implement a user submittable attribute on the join table of the many to many relationship?
    * User can add or select: CEO, Problem, TechnologyBreakthrough

What it is an ActiveRecord scope method and what is your implementation plan?
    * An AR scope method allows you to add methods to objects which encapsulate queries and access multiple different models(scopes).
    Example: Companies.with_solved_problems (Query: companies where problem.solved = true)

What validations will you have for your models?
		* USER
    * Unique user id
		* Min pass length
		* The rest:
		* Standard field presence

How will you implement an authentication system?
    * OMNIAUTH

What 3rd party login service will you use?
    * Github

With the way your models are setup what nested routes will you use to meet the requirement?
    * companies/technologyBreakthrouh/new, :id/edit
