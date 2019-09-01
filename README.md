This project was created and submitted as a solution for the On Pace Simple Currency Conversion App

# TESTING THIS PROJECT

## A. Pre-requisites

### 1. Ruby (Ruby 2.6.0 or higher) 
  - Installation instructions found [here](https://www.ruby-lang.org/en/documentation/installation/).
### 1. Rails (Rails 5 or higher) 
  - Installation instructions found [here](http://installrails.com/).
### 3. Git 
  - Installation instructions found [here](https://www.atlassian.com/git/tutorials/install-git).
### 4. Fixer.io API Key 
  - Get your API Key [here](https://fixer.io/product).

## B. Running the application

### 1. Clone this project
  - $ git clone https://github.com/bjldb/onpace-test-currency-conversions.git
### 2. Move to the project directory and run bundle install to install dependencies
  - $ cd onpace-test-currency-conversions
  - $ bundle install
### 3. Run database migration task
  - $ rake db:migrate
### 4. Run application
  - $ rails s
  - visit localhost:3000 to view the locally runb application
### 5. Run rake task to fetch conversions from fixer.io
  - $ rake fixer_free:get_conversions KEY=<API_KEY>
  - visit localhost:3000 again to view the updated conversion rates
