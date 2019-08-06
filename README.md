# README

A project with simple REST API.

* Ruby version used
2.6.3

* Rails version used
6.0.0.rc2

* System dependencies:
PostgreSQL, ImageMagic

# Installation

Create .env file from sample by filling database connection parameters.

Update dependencies:
% bundle install

Create, migrate and prefill (several countries plus several genres) database:
% rake db:create
% rake db:migrate
% rake db:seed

Run application:
rails server
