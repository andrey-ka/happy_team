# README

## Description
Simple 'Happy Team' project management tool (yet another :smile:)

## Setup

### System dependencies
- PG (13+ version) is up and running (see .env.example config for `PORT`)
- PG user with `SUPERUSER` role is created (see .env.example config for `DATABASE_USER`)

### Prerequisites
- Ruby version - `3.1.2`
- Nodejs version - `14.17.6`

### Installation
- `gem install bundler`
- `bin/setup` - installs gems, copies config files, prepares db
- `rails db:seeds` - populates db with the initial data

## Running
- `bin/dev` - runs foreman dev profile
- `rspec` - run tests.
- `rubocop` - style checking; use `-a` flag to auto correct

### Deployment
TBC

## Current list TODO

## Functionality
- [ ] Member: ability to start/finish task

## Performance
- [ ] Admin: Rewrite members dropdown to use free text search
- [ ] DB: add index for the full text search on member name

