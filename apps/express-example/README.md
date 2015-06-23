express-example
===

puffing-billy spike against a simple express app displaying JSONP from a weather API

## Usage

Run cucumber tests as normal by running

```
$ npm test
```

Run cucumber tests with **caching enabled** by running

```
$ npm run billy
```

A new directory `req_cache` will be created in the `e2e` dir with a yml file like the following:

```
# get_api.openweathermap.org_76e9fffe569973b3f53655a5d47db80e3b154168.yml
---
:scope:
:url: http://api.openweathermap.org/data/2.5/weather?id=2656173
:body: ''
:status: 200
:method: get
:headers:
  Server: nginx
  Date: Tue, 23 Jun 2015 02:19:41 GMT
  Content-Type: application/json; charset=utf-8
  Connection: close
  X-Source: back
  Access-Control-Allow-Origin: "*"
  Access-Control-Allow-Credentials: 'true'
  Access-Control-Allow-Methods: GET, POST
:content: |
  jQuery214019742640294134617_1435025981007({"coord":{"lon":-2.36,"lat":51.38},"sys":{"message":0.1962,"country":"GB","sunrise":1435031597,"sunset":1435091407},"weather":[{"id":800,"main":"Clear","description":"Sky is Clear","icon":"01n"}],"base":"stations","main":{"temp":9999.244,"temp_min":282.244,"temp_max":282.244,"pressure":1019.46,"sea_level":1030.27,"grnd_level":1019.46,"humidity":86},"wind":{"speed":3.66,"deg":311},"clouds":{"all":0},"dt":1435025981,"id":2656173,"name":"Bath","cod":200});
```

Any subsequent runs of `npm run billy` will use the above cached response. You can verify this by unplugging from the internet for example.
