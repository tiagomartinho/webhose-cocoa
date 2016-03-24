@testable import Webhose
import Quick
import Nimble

class WebhoseQuerySpec: QuickSpec {

    let aKey = "aKey"
    let aQuery = "aQuery"

    override func spec() {
        describe("the Webhose Query") {
            context("when the query is built") {
                it("has all these words") {
                    let expectedQuery = "(All AND These AND Words)"
                    let builder = WebhoseQueryBuilder { builder in
                        builder.allTerms = ["All", "These", "Words"]
                    }
                    let query = WebhoseQuery(builder: builder)
                    expect("\(query)").to(equal(expectedQuery))
                }
                it("has exact word") {
                    let expectedQuery = "\"ExactWord\""
                    let builder = WebhoseQueryBuilder { builder in
                        builder.exactTerm = "ExactWord"
                    }
                    let query = WebhoseQuery(builder: builder)
                    expect("\(query)").to(equal(expectedQuery))
                }
                it("has one or more words") {
                    let expectedQuery = "(One OR More OR Words)"
                    let builder = WebhoseQueryBuilder { builder in
                        builder.oneOrMoreTerms = ["One", "More", "Words"]
                    }
                    let query = WebhoseQuery(builder: builder)
                    expect("\(query)").to(equal(expectedQuery))
                }
                it("has none") {
                    let expectedQuery = "-None"
                    let builder = WebhoseQueryBuilder { builder in
                        builder.excludeTerm = "None"
                    }
                    let query = WebhoseQuery(builder: builder)
                    expect("\(query)").to(equal(expectedQuery))
                }
                it("has language") {
                    let expectedQuery = "language:(portuguese)"
                    let query = WebhoseQuery()
                    expect("\(query)").to(equal(expectedQuery))
                }
                it("has thread information") {
                    let expectedQuery = "thread.title:(T) thread.section_title:(T) thread.country:P"
                    let query = WebhoseQuery()
                    expect("\(query)").to(equal(expectedQuery))
                }
                it("has site") {
                    let expectedQuery = "site:website101.com"
                    let query = WebhoseQuery()
                    expect("\(query)").to(equal(expectedQuery))
                }
                it("has performance score") {
                    let expectedQuery = "performance_score:>3"
                    let query = WebhoseQuery()
                    expect("\(query)").to(equal(expectedQuery))
                }
            }
        }
    }
}
