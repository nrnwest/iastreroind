### Asteroid Nasa REST-api Swagger

From <https://api.nasa.gov/>, get data on flying asteroids near Earth over a period of 3-7 days.
Sort - dangerous not dangerous, by speed, planetary distance.
Make your own REST-api and Swagger based on the obtained data.
Use: swagger, phpunit, msyql.
The system can be configured to work with local data files (asteroid.json), or with api.nasa.gov.

## Deployment

```bash
git clone https://github.com/nrnwest/iasteroid.git
```

```bash
make dep
````

**If an error occurs, run the following commands, errors occur due to weak computer:**
1. make build
2. make up
3. make composer
4. make db_add

## Swagger REST api

<http://localhost/api/documentation>

## or just use to view the url

1. <http://localhost>
2. <http://localhost/api/v1/hazardous>
3. <http://localhost/api/v1/fastest?hazardous=false>
4. <http://localhost/api/v1/fastest?hazardous=true>

## Tests

```bash
make test
````

## phpMyAdmin
user root
password root
<http://localhost:4444>
