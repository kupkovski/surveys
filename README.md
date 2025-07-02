# README

## Overview

This is a simple project that allows users to create and answer yes-or-no surveys.

Users can create new surveys, answer their own surveys, or answer surveys created by others.

> Note: The project does not include authentication, so there is no concept of "User" in the system. Surveys and answers are not scoped to specific users.

On the main page, users can view existing surveys or create a new one. To answer a survey, they can click the link displaying the survey question (the "show" page). From there, they can click the "Answer" link, which opens a form via Turbo Stream to submit a response.

Each survey’s show page displays simple statistics indicating how many answers were "YES" and how many were "NO".

## Technology

This project is built with **Ruby on Rails 7.2+** and **Ruby 3.1.** Data is stored using **SQLite**.

The project uses standard Rails conventions, with minimal use of Turbo and Hotwire Stimulus to add SPA-like behavior, especially on the survey show page, where answer counts and statistics update dynamically.

### Testing
- RSpec is used for unit and request specs.
- Rails fixtures are used for test data.
- SimpleCov is included to track test coverage, which currently stands at 100%.

### How to run
Make sure you have **Ruby** and **Bundler** installed. Then follow these steps:

1. Install dependencies:
```bash
$ bundle install
```
2. Create and migrate the database:
```bash
$ bundle exec rails db:create
$ bundle exec rails db:migrate
```

3. Start the server
```bash
$ bundle exec rails s
```

4. Open your browser and navigate to:
```
http://localhost:3000
```

Any doubts please contact me on:
```
kupkovski@gmail.com
```


Enjoy!
