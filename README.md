# Reviews

This is a simple review API made with Ruby On Rails and GraphhQL.

## development env setup

After clonning this repo, run the commands bellow:

* `bundle install`
* `rails db:prepare`

## commom commands

### starting the dev server

* `rails s`

### running specs

* `bundle rspec`

### running rubocop (linter)

* `rubocop -a`

## GraphQL queries

To run the queries below, make sure you have a GraphQL client, like the "Altair GraphQL Client" extension for chrome.

List both Hotel and Restaurants reviews:

```graphql
query {
  reviews {
    ... on HotelReview {
      id
      review
      author
    }

    ... on RestaurantReview {
      id
      review
      author
    }
  }
}
```
