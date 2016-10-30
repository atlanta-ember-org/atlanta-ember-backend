# Atlanta Ember Backend API

[![CircleCI](https://circleci.com/gh/atlanta-ember-org/atlanta-ember-backend.svg?style=svg)](https://circleci.com/gh/atlanta-ember-org/atlanta-ember-backend)

## Usage
### Basic PR workflow
  - Work on a feature branch
  - Make a PR to the develop branch (the default branch)
    - All feature branches get merged into develop
  - Occasionally the develop branch gets merged into master
  - Only develop gets merged into master
  - Only master branch gets deployed.

## Getting started

Make sure you're running the right Ruby version (2.2.3 || see Gemfile)

Setup your environment with a .env file by moving `/.env.example` to `/.env` and fill in the values.

  - Gonna need Meetup creds, but haven't found a great way to provide private keys :(

Install your gems
```
bundle install
```

Set up Redis

  - Install redis.
    * If you have homebrew it's as simple as `brew install redis`.
  - Starting the redis server is done with foreman a little later on.

Set up database (we're using postgres)

  - Make sure you have a postgres instance running on 5432.
  - We don't have a username or password set for the db (see `/database.yml`), so that should not be a problem.
  - Going to have to set up your db.
    1. `rake db:create`
    1. `rake db:schema:load`

Start the servers

  - We have a procfile specific to the development environment.
  - `foreman start -f Procfile.development`
  - Just leave those processes running :)

Seed the database
```
rake db:seed
```

## Testing
Easy as pie!

First might need to setup the test db.
```
rake db:test:prepare
```

Then just run the tests.

```
rspec
```

## Side Processes
We use Sidekiq to run a worker for the syncing.  Right now it's running every 10 minutes.  Heroku doesn't like that.  It would rather us let the dinos rest 6 hours a day and this process doesn't ¯\_(ツ)_/¯

### Sync tasks
  - `rake meetup_sync:users`


## Deployment
Done on Heroku (https://devcenter.heroku.com/articles/getting-started-with-rails4#deploy-your-application-to-heroku)
