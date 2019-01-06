ITCROWD API
==============================================

Environment
----------------------------------------------

- Ruby version: `2.4.2`
- Rails version: `5.2.2`
- Ruby version manager: `rvm`
- Local URL: http://localhost:3000
- Heroku app URL: https://itcrowdapi.herokuapp.com

API Docs
----------------------------------------------
- https://itcrowdapi.herokuapp.com/apipie
- http://localhost:3000/apipie

json format:
- https://itcrowdapi.herokuapp.com/apipie.json
- http://localhost:3000/apipie.json

Configuration
----------------------------------------------

- `bundle install`
- `rails db:create`
- `rails db:migrate`
- `rails db:seed`

Usage
----------------------------------------------

Example:

1. `bundle exec rails server`

2. Get session tokens by postman
```
https://itcrowdapi.herokuapp.com/api/v1/auth/sign_in
or
http://localhost:3000/api/v1/auth/sign_in
json body :
{
  "email": "user@example.com",
  "password": "asdqwe123"
}
```

3. Copy Access-Token, Client and Uid

4. Create Movie with tokens
```
https://itcrowdapi.herokuapp.com/api/v1/movies
or
http://localhost:3000/api/v1/movies

header: {
  access_token: access_token
  client: client
  uid: uid  
}

body : {
  "title" : "the title",
  "release_year": 0000
}

```

5. Create People with tokens
```
https://itcrowdapi.herokuapp.com/api/v1/people
or
http://localhost:3000/api/v1/people

header: {
  access_token: access_token
  client: client
  uid: uid  
}

body : {
  "last_name" : "last_name",
  "first_name": "first_name",
  "aliases":"aliases"
}

```
6 Assign Person to the movie with tokens
```
https://itcrowdapi.herokuapp.com/api/v1/people/1/people_movies
or
http://localhost:3000/api/v1/people/1/people_movies

header: {
  access_token: access_token
  client: client
  uid: uid  
}

body : {
  "movie_id": 1,
  "role": "producer"
}

role types: [ :actor_actress, :director, :producer ]

```
Lamontanaro Francisco Javier, lamontanarofrancisco@gmail.com
