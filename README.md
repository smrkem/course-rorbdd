# Ruby on Rails 5, BDD, Rspec and Capybara | Udemy
This repo is my course project(s) for the udemy course:  
https://www.udemy.com/ruby-rails-5-bdd-rspec-capybara/  

The course itself uses cloud9 IDE, and may not use phantomjs, but here I will be developing using Docker and attempt to follow along, getting everything working using phantomjs inside the container.

:fingers_crossed:  

The course also only focuses on feature specs - so I'm making a couple changes in order to practice "Outside-In" TDD.
- I added `factory_girl_rails` gem and performed required setup
- I'm adding model tests along the way to making feature specs pass

I decided not to bother with views or controller tests, since these are covered fairly well in the FTs (Feature / Functional tests).
