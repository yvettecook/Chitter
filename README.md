## Chitter (definitely not Twitter)
### Makers Academy Week 4 Challenge

A lightweight (i.e. basic) Twitter clone that will allow users to post messages to a public stream, and make the API available as a JSON object

Find it at: [serene-sea-5950.herokuapp.com/](http://serene-sea-5950.herokuapp.com/)

![screenshot](/public/images/screenshot.png?raw=true)


### Spec
---------------

#### Phase 1: Week 4

Features:
* Users can sign up to the service
* Users can log in
* Users can log out
* Users can post peeps to the central stream
* Central stream displays peeps in chronological order

Outline:
* Users sign up with email, password, name and username
* Username and email are unique
* Peeps show the name of the maker and their user handle
* You don't have to be logged in to see the peeps
* You can only send a peep if you are logged in

End of phase 1 is [this commit](https://github.com/yvettecook/Chitter/commit/9b86fc8e1faa8853062542e074e17229eacd4c44)

#### Phase 2: Week 6 Frontman

One of the biggest complaints from users (i.e. me) about the phase 1 deployment was that the front end doesn't *feel right*. So the priorities for the weekend is:

- [x] Skin the application (mainly css and html), recreating Twitter's somewhat prettier interface
- [x] Make the whole front end work with Javascript and HandlebarsJS
- [x] Ensure that we only serve one html from the server that will imitate the application

It would also be kind of cool for people to be able to steal all my peeps to embed in their own website. So I will also:

- [x] Create a JSON API on the server and make the front end talk to that api


### Tools
----------------

Production:
* Sinatra
* Sinatra-partial
* RackFlash3

Database:
* PostgreSQL
* DataMapper
* DM Postgres-adapter
* bcrypt
* JSON
* Database Cleaner

Testing:
* Cucumber
* Cucumber-Sinatra
* Capybara
* Capybara-Webkit
* RSpec
* Shotgun


### Installation
------------------

```` $ bundle install````



### To Do
------------------

See ToDo.md

### Learnings
------------------

Phase 1:

* Feature tests should not be touching the database - this was slowing down my tests, and is unnecessary. Try to ensure elements are as loosely coupled as possible

* Security issue when identifying author of a peep using 'hidden' HMTL form field. Corrected by using `params.merge`
