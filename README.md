# Ruby on Rails Tutorial sample application

This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](https://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

## Getting started

# Note: The following app is being run on docker

To get started with the app, clone the repo and then install the needed gems with docker:

```
$ docker-compose build
```

Next, migrate the database:

```
$ docker-compose run web rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ docker-compose run web rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ docker-compose up
```

For more information, see the
[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).
