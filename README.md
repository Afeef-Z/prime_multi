# Prime Tables

An application that takes a numeric input (N) from a user and outputs a multiplication table of (N) prime numbers.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installing


* Ruby version
 3.0.0

 ```
 rvm install 3.0.0
 ```
 
* Clone the repository


```

git clone https://github.com/Afeef-Z/prime_multi.git

cd prime_multi
```

* Install Gems
```
bundle install
```

* Node version
v11.4.0

* Install Node version using NVM
```
nvm install v18.14.0
nvm use v18.14.0
```

* Install packages
```
yarn install
```

* Run app locally on 3000 port

```
bin/dev
```

it will run the app on this url. Visit it and you can play with it
http://localhost:3000/

* How to run the test suite

```
bundle exec rspec
```

### Gems and plugins
- Used rspec along with capybara to add system and unit test coverage 
- Used React to implement frontend screens

### Workflow and functionality

- User will be presented with a form, to enter dimensions(n) for the prime multiplication metric.
- Once submitted, the user will be able to see a paginated gird, along with navigation buttons.

### What you’re pleased with

- It was not a common task, that requires just development skills.
- I had to research on the basic to advanced approaches to generate prime sequences up to n.

### What you would do with it if you had more time

- While researching, at last I found there is an another approach using segmentation while applying sieve of eratosthenes(which I have implemented).
- This helps reduce both space and time complexity, making it more efficient that a direct approach on sieve of eratosthenes.

