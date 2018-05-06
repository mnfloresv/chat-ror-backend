# chat-ror-backend

Backend of web chat application that allow users to join rooms and communicate in real time.

This project provides an API server and the websocket server, for the frontend part see: https://gitlab.com/manufloresv/chat-vue-frontend

## Technologies

* Ruby on Rails 5.2
* Action Cable
* RSpec
* Mongoid

## Set up environment

For running a clean clone of the app:

``` bash
# install gems
$ bundle install

# start mongodb server
$ sudo systemctl start mongodb.service

# run tests
$ rspec

# run server
$ rails s
```

## API documentation

To access chat rooms info a REST API is offered.

### List rooms

List all rooms:

``` http
GET /api/rooms HTTP/1.1
Host: chat-ror-backend.herokuapp.com
```

### Create room

Create a new room:

``` http
POST /rooms HTTP/1.1
Host: chat-ror-backend.herokuapp.com
Content-Type: application/json

{
  "name": "Room 4"
}
```

The HTTP response status code can be:

* 201 "Created" if room is stored or
* 422 "Unprocessable Entity" in case of errors with data.

### Get last messages of a room

Get last 20 messages of a specified room:

``` http
GET /api/rooms/5aef3d72ae3e2c0004f78f00/last_messages HTTP/1.1
Host: chat-ror-backend.herokuapp.com
```
