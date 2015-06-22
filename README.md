bubble
===

## The Problem

End-to-end tests are slow and can fail due to sporadic networking issues. It's possible to unit test client-side JavaScript, by using tools like jsdom or cheerio to load window globals, but that entails:

0. you structure your app in a unit-testable way
0. potentially lots of boilerplate/setup test code
0. writing implementation-specific tests that mock out every API call

which isn't always feasible with a legacy application.

## Proposed Solution

Use Capybara (or watir-webdriver?) & puffing-billy to record all HTTP interactions in a E2E test run and replay the cached responses in order to test the client-side javascript in isolation.

## Related Links

0. [Test remote javascript APIs with Capybara and puffing-billy](http://www.oesmith.co.uk/2012/10/18/test-remote-javascript-apis-with-capybara.html)
0. [Sepia](https://github.com/linkedin/sepia#motivation) which basically does the opposite of this project. Also [this presentation](http://www.oscon.com/oscon2014/public/schedule/detail/34612) on it.
