# 10x - Privacy Dashboard - Phase 4

[![Known Vulnerabilities](https://snyk.io/test/github/18F/all_sorns/badge.svg)](https://snyk.io/test/github/18F/all_sorns)
[![Maintainability](https://api.codeclimate.com/v1/badges/c24db1125b3c714fbf9d/maintainability)](https://codeclimate.com/github/18F/all_sorns/maintainability)
## All of the SORNs 🎵

### What
[Prototype](https://all-sorns.app.cloud.gov/search)

This repository is for prototyping a service to make all of the federal government's [System Of Record Notices](https://www.gsa.gov/reference/gsa-privacy-program/systems-of-records-privacy-act) more usable for government privacy officer's and the public.

### Why
We are building a dashboard for searching and exploring Privacy Act System of Records Notices (SORNs). This service will give privacy offices and their staff a better way to find SORNs using targeted search, and provides the public with an interface to explore and understand government privacy practices.

To read more about how we got here, see our [Phase 3 work](https://github.com/18F/privacy-tools/blob/master/README.md) and our [Privacy Dashboard built for GSA](https://cg-9341b8ea-025c-4fe2-aa6c-850edbebc499.app.cloud.gov/site/18f/privacy-dashboard/).

### How
This is a Rails app, running on Cloud.gov. It gets SORNs from the Federal Register. It reads those SORNs and separates every section into their own database column.


## Local installation

Ensure that you have postgres running
```
brew install postgresql
brew services start postgresql
```

Use your ruby version manager to switch to the ruby version found in .ruby-version.

Then install the dependencies (and check for bundler)
```
if ! type "$bundler" > /dev/null; then
  gem install bundler
fi
bundle install
yarn install --check-files

bundle exec rails db:setup
bundle exec rails server
```

## Populate SORNS from the Federal register
Run
```
bundle exec rails federal_register:find_sorns
```

After the very first run is complete, to populate the mentioned SORNs, run
```
bundle exec rails all_sorns:update_all_mentioned_sorns
```

### Who
- [ondrae](https://github.com/ondrae)
- [peterrowland](https://github.com/peterrowland)
- [igorkorenfeld](https://github.com/igorkorenfeld)
- [lauraGgit](https://github.com/lauraGgit)