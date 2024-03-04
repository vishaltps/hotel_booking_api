# README

#### Versions

Ruby: 3.3.0

Rails: 7.1.3

#### Setup application

```
bundle install
rails db:create
rails db:migrate
rails db:seed
```

#### run the test cases

```
bundle exec rspec spec/
```

#### Notes:

- I have created lots of file but only written request specs because of time constaint.
- I can do much better if i had more time.
- When user remove the booking, i am updating the status to 'cancelled' instead of removing the record from DB. I think we should show the cancelled bookings of user.
- There is redudant code in the fetch/booking and fetch/hotels. I didn't refactor that code.
- There can be lots of improvement happen in the existing code.

#### TODO:

- [] Use serailizer instead of default response
