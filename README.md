# Tea Subscription

## Description

This is a back-end Rails API for a hypothetical tea subscription service. It utilizes RESTful routes and is designed to be consumed by a front-end team. This hypothetical front-end team could use this API to build out functionality for beginning a tea subscription, cancelling a tea subscription, and showing all of a user's subscriptions.

## Technology

Ruby 2.7.4
Rails 7.0.4
PostgreSQL

Gems:
*RSpec-rails (to run test suite, run command bundle exec rspec)
*factory_bot_rails
*faker
*shoulda-matchers
*jsonapi-serializer

## Setup

 ``` 
1. Clone repository to local machine
2. Run command bundle install
3. Run command rails db:{create,migrate,seed}
4. Run command rails s
 ``` 

## Schema

![tea_schema](https://user-images.githubusercontent.com/106977961/212401300-c2e56d59-d358-4899-a0e9-f3842a71b6eb.PNG)


## Endpoints

### Show all of a customer's subscriptions

GET `/customer_subscriptions`

```
{
customer_id: 1
}


```

#### Example Response

```
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "title": "Holiday",
                "price": 22.1,
                "frequency": "weekly"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "summer",
                "price": 10.1,
                "frequency": "biweekly"
            }
        }
    ]
}


```

### Create a new customer subscription

POST `/customer_subscriptions`

```
{
customer_id: 1,
subscription_id: 3
}



```

#### Example Response

```
{
    "data": {
        "id": "3",
        "type": "customer_subscription",
        "attributes": {
            "customer_id": 1,
            "subscription_id": 3,
            "status": "active"
        }
    }
}


```

### Cancel a customer subscription

PATCH `/customer_subscriptions/#id`

```
#id 1

{
status: "cancelled"
}


```

#### Example Response

```
{
    "data": {
        "id": "2",
        "type": "customer_subscription",
        "attributes": {
            "customer_id": 1,
            "subscription_id": 2,
            "status": "cancelled"
        }
    }
}


```

