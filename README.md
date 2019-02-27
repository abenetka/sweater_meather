# README
## Description

Sweater Weather was a 5-day, final solo-project of Module 3 at Turing School of Software and Design. We were asked to build a weather API that outputs JSON objects, byt utilizing several APIs to provide up-to-date and interesting weather information. This application is built with Ruby on Rails and utilizes the following APIs: DarkSky API, Google GeoCode API, Giphy API, and Flickr API.

#### [**_View Sweater Weather API in Production_**](https://sweather-weather.herokuapp.com//)


## Getting Started

To run Sweater Weather on your local machine, navigate to the directory in which you would like the project to be located, then execute the following commands:

```
$ git clone git@github.com:abenetka/sweater_weather.git
$ cd sweater_weather
$ bundle
$ rails g rspec:install
$ rails db:create
$ rails db:migrate
$ bundle exec figaro install
```
#### Setup your environment variables:

##### Sign Up on the following API's:
* [Dark Sky](https://darksky.net/dev)
* [Google Maps Geocode](https://developers.google.com/maps/documentation/javascript/get-api-key)
* [Flickr](https://www.flickr.com/services/api/)
* [Giphy](https://developers.giphy.com/)


Add the following code snippet to your `config/application.yml` file. Make sure to insert the key/secret without the alligator clips ( < > ).
```

darksky_api_secret: <insert>
google_maps_api_key: <insert>
giphy_api_key: <insert>
flickr_api_key: <insert>

```

## Running Tests

To run the test suite, run `rspec`.


## Tools
* Dark Sky API
* Google Geocode API
* Flickr API
* Giphy API
* Ruby on Rails
* RSpec
* Figaro
* Faraday
* Shoulda-Matchers
* FactoryBot
* Pry
* SimpleCov
* PostgresSQL


## Rubric/Project Description
http://backend.turing.io/module3/projects/sweater_weather

## Authors
* [Ali Benetka](https://github.com/abenetka)

## Acknowledgments

* [Sal Espinosa](https://github.com/s-espinosa)
* [Mike Dao](https://github.com/mikedao)
