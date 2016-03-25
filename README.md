# webhose-cocoa
A simple way to access the webhose.io API from your iOS application

## API Key

To make use of the webhose.io API, you need to obtain a token that would be
used on every request. To obtain an API key, create an account at
https://webhose.io/auth/signup, and then go into
https://webhose.io/dashboard to see your token.

## Use the API

To get started, you need to import the library, and set your access token.
(Replace YOUR_API_KEY with your actual API key).

```swift
let client = WebhoseClient(key: "YOUR_API_KEY")
```

Now you can make a request and inspect the results:

```swift
client.search("foobar") { response in
  print(response.totalResults)
  print(response.posts.count)
}
```

If there are more than one page of results, use the `getMore()` method to
fetch the next page.

```swift
client.search("foobar") { response in
  client.more(response) { anotherResponse in
    print(anotherResponse)
  }
}
```

## Full documentation

### WebhoseClient class

* WebhoseClient(key)

  * key - your API key

* search(query)

  * query - the search query, either as a search string, or as a Query object

### WebhoseQuery class

WebhoseQuery objects correspond to the advanced search options that appear on https://webhose.io/use

WebhoseQuery objects have the following members:

* ``allTerms`` - a list of strings, all of which must appear in the results
* ``oneOrMoreTerms`` - a list of strings, some of which must appear in the results
* ``exactTerm`` - a phrase that must appear verbatim in the results
* ``excludeTerm`` - terms that should not appear in the results
* ``language`` - one or more of language names, in lowercase english
* ``site`` - one or more of site names, top level only (i.e., yahoo.com and not news.yahoo.com)
* ``title`` - terms that must appear in the title

### WebhoseResponse class

Response objects have the following members:

* ``totalResults`` - the total number of posts which match this search
* ``moreResultsAvailable`` - the number of posts not included in this response
* ``posts`` - a list os Post objects
* ``next`` - a URL for the next results page for this search
* ``requestsLeft`` - the number of requests still available 

### WebhosePost and WebhoseThread classes

WebhosePost and WebhoseThread object contain the actual data returned from the
API. Consult https://webhose.io/documentation to find out about their structure.
