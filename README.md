# webhose-cocoa
A simple way to access the webhose.io API from your iOS/tvOS/OSX/watchOS application

## Requirements

- iOS 8.0+ / Mac OS X 10.9+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 7.3+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate Webhose into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
platform :ios, '8.0' #or :tvos, '9.0' #or :osx, '10.9' #or :watchos, '2.0'
use_frameworks!

pod 'Webhose', :git => 'https://github.com/tiagomartinho/webhose-cocoa'
```

Then, run the following command:

```bash
$ pod install
```

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

If there are more than one page of results, use the `more()` method to
fetch the next page.

```swift
client.search("foobar") { response in
  client.more(response) { anotherResponse in
    print(anotherResponse)
  }
}
```

Instead of receiving the results in a closure you can adopt the WebhoseClientDelegate protocol, and receive the updates with the callback didEndSearchWithResponse.

```swift
import UIKit

class ViewController: UIViewController, WebhoseClientDelegate {

override func viewDidLoad() {
    super.viewDidLoad()

    let client = WebhoseClient(key: "YOUR_API_KEY")
    client.delegate = self
    client.search("foobar")
}

func didEndSearchWithResponse(response: WebhoseResponse) {

}
```

You can use the query builder to build advanced queries.

```swift
let builder = WebhoseQueryBuilder { builder in
    builder.allTerms = ["All", "These", "Words"]
    builder.exactTerm = "ExactWord"
    builder.oneOrMoreTerms = ["One", "More", "Words"]
    builder.excludeTerm = "None"
    builder.language = "portuguese"
    builder.site = "website.com"
    builder.performanceScore = 3
}

let query = WebhoseQuery(builder: builder)

client.search(query) { response in
  print(response)
}
```

## Full documentation

### Webhose Tests

For detail use of how to use the SDK read the tests WebhoseReponseSpec, WebhosePostSpec, WebhoseThreadSpec and WebhoseQuerySpec.

### Client class

* WebhoseClient(key)

  * key - your API key

* search(query)

  * query - the search query, either as a search string, or as a Query object

### Query class

WebhoseQuery objects correspond to the advanced search options that appear on https://webhose.io/use

WebhoseQuery objects have the following members:

* ``allTerms`` - a list of strings, all of which must appear in the results
* ``oneOrMoreTerms`` - a list of strings, some of which must appear in the results
* ``exactTerm`` - a phrase that must appear verbatim in the results
* ``excludeTerm`` - terms that should not appear in the results
* ``language`` - one or more of language names, in lowercase english
* ``site`` - one or more of site names, top level only (i.e., yahoo.com and not news.yahoo.com)
* ``title`` - terms that must appear in the title

### Response class

Response objects have the following members:

* ``totalResults`` - the total number of posts which match this search
* ``moreResultsAvailable`` - the number of posts not included in this response
* ``posts`` - a list os Post objects
* ``next`` - a URL for the next results page for this search
* ``requestsLeft`` - the number of requests still available

### Post and Thread classes

WebhosePost and WebhoseThread object contain the actual data returned from the
API. Consult https://webhose.io/documentation to find out about their structure.
