Acebook by Smooth Railing
===================

This project is a Facebook clone created by [Ben Galley](https://github.com/Benjamaker), [Kate Haffenden](https://github.com/naeglinghaff), [Lila Walker](https://github.com/lilawalker) and [Srikaanth Balajhi](https://github.com/srikaanthtb).

The project is Built on Rails 5.1.1

Visit our blog [here](https://medium.com/smooth-railing-blog) to see more about our learning process.

## Getting Started

Ensure you have the following setup on your machine:
- Bundler
- PostgreSQL

Clone this repository. Then install dependencies and migrate the database as follows:

```
$ bundle install
$ rails db:create
$ rails db:migrate
$ rails db:migrate RAILS_ENV=test
```
To run the project, start up the rails server
```
$ rails server
```
Then navigate to localhost:3000 in your browser

## Dependencies

This project relies on the following Rails Gems:

- Devise (for user authentication)

## Running Tests

Travis CI is setup to run tests and linting upon each GitHub commit.

This project is setup with:
- RSpec
- SimpleCov
- Rubocop
- Travis CI

To run the tests:
```
$ bundle exec rspec
$ bundle exec rubocop
```
___

## Deployment

The app is deployed via Heroku. [Click here](https://acebook-smooth-railing.herokuapp.com/) to see it in all it's glory!

If all tests pass, commits on the master branch are automatically deployed to Heroku via Travis
___

## Criteria for Building the Project

#### Domain Model

| Models        | Methods                     | State  |
| ------------- |:-------------              | :-----|
| Users         | sign_up, sign_in, sign_out  | name, email, password |
| Posts     | CRUD                       | message, user_id   |
| Comments     | CRUD                       | comment_text, user_id, post_id   |

#### User Stories

User Authentication
```
As a user
So that I can join in on the fun of Acebook
I need to be able to create an account

As a user
So that I can view posts on Acebook
I need to login to my account

As a user
So that I can be sure my account is secure
I need to be able to logout of my account

As a user
So that I know that I am logged in and ready to use the app
I would like to see a welcome message with my name
```

Posts
```
As a user
So that I can share my thoughts
I would like to be able to post messages on Acebook

As a user
So that I know who shared the post
I would like to see the name of the person who posted the message

As a user
So that I know when the posts were shared
I would like to see the date the message was posted

As a user
So that I can see the most recent posts
I would like to see the messages in reverse chronological order

As a user
So that I can remove posts I've shared
I would like to delete a message I posted

As a user
So that I can update posts I've shared
I would like to edit a message I posted up to 10 minutes after posting it

As a user
So that I can only delete my own posts
I would like to see a helpful error message if I try to delete someone else's messages
```

Comments
```
As a user
So that I can tell others what I think of their posts
I would like to be able to comment on messages

As a user
So that I know who shared the comment
I would like to see the name of the person who commented

As a user
So that I know when the comments were shared
I would like to see the date the comment was posted

As a user
So that I can remove a comment
I would like to be able to delete a comment I made on a post

As a user
So that I can update comments I've shared
I would like to edit a comment I posted up to 10 minutes after posting it

As a user
So that I can only delete my own comments
I would like to see a helpful error message if I try to delete someone else's comments

As a user
So that I can only edit my own comments
I would like to see a helpful error message if I try to edit someone else's comments
```

## Team Work

This project wouldn't have come together without the hard work and dedication of each member of the team. Every day we held stand ups and retros, using Trello boards to detail our progress. After estimating the tickets and dividing the work amongst us, we split off into pairs for the day and tackled the work. If teams got blocked, we would mob together to solve problems so that we could all move forward.

We adhered to a [team charter](https://docs.google.com/document/d/19TB6uZP0riW3iNHsxErw-HEYbkYpR3nPl6kFiE9gGjQ/edit) to guide us through the learning process.

## What's Next

Of course there's never enough time to implement all of your ideas, so here's what we would have done had we had more time:

- Add an image uploader to the posts feature
-
