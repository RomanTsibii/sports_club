# README

This README would normally document whatever steps are necessary to get the
application up and running.

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

rails g controller Pages home

rails g devise:install
rails g devise User
rails db:migrate
rails g devise:views

rails g migration AddColumnsToUser full_name from about:text sex height:integer weight:integer body_weight_index:integer age:integer visible:boolean


rails webpacker:install:vue  # на JavaScript

