#Tea Subscription

##Description

This is a back-end Rails API for a hypothetical tea subscription service. It utilizes RESTful routes and is designed to be consumed by a front-end team. This hypothetical front-end team could use this API to build out functionality for beginning a tea subscription, cancelling a tea subscription, and showing all of a user's subscriptions.

##Technology

Ruby 2.7.4
Rails 7.0.4
PostgreSQL

Gems:
*RSpec-rails (to run test suite, run command bundle exec rspec)
*factory_bot_rails
*faker
*shoulda-matchers
*jsonapi-serializer

##Setup

 ``` 
1. Clone repository to local machine
2. Run command bundle install
3. Run command rails db:{create,migrate,seed}
4. Run command rails s
 ``` 

This README would normally document whatever steps are necessary to get the
application up and running.

##Endpoints

###Show all of a customer's subscriptions

GET `/customer_subscriptions`

```



```

###Create a new customer subscription

POST `/customer_subscriptions`

```



```

###Cancel a customer subscription

PATCH `/customer_subscriptions/#id`

```



```

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
