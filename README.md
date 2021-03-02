# Reviews

This is a simple review API made with Ruby On Rails and GraphQL.

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

`POST: http://127.0.0.1:3000/graphql`

Add an hotel review:

```graphql
mutation {
  addHotelReview(input: { id: 1, review: "Loved this hotel!", author: "Lucas D'Avila" }) {
    hotelReview {
      id
      review
      author
    }
  }
}
```

Add restaurant review, by using mutations:

```graphql
mutation {
  addRestaurantReview(input: { id: "18547395-3c71-4f4c-b62b-3f1382c66c82", review: 5, author: "Lucas D'Avila" }) {
    restaurantReview {
      id
      review
      author
    }
  }
}
```

Fetch both Hotel and Restaurants reviews:

```graphql
query {
  reviews {
    ... on HotelReview {
      __typename
      id
      review
      author
    }

    ... on RestaurantReview {
      __typename
      id
      review
      author
    }
  }
}
```
