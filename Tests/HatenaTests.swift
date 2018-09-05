//
//  HatenaTests.swift
//  FeedKit iOS Tests
//
//  Created by Tomochika Hara on 2018/09/05.
//

import XCTest
import FeedKit

class HatenaTests: BaseTestCase {
    
    func testHatenaFavoritesRSS() {
        
        // Given
        let URL = fileURL("HatenaFavoritesRSS", type: "xml")
        let parser = FeedParser(URL: URL)
        
        // When
        let feed = parser.parse().rssFeed
        
        // Then
        XCTAssertNotNil(feed)
        
        XCTAssertEqual(feed?.title, "はてなブックマーク - zetta1985のブックマーク - お気に入り")
        XCTAssertEqual(feed?.link, "http://b.hatena.ne.jp/zetta1985/favorite")
        XCTAssertEqual(feed?.description, "お気に入り")
        XCTAssertNil(feed?.language)
        XCTAssertNil(feed?.copyright)
        XCTAssertNil(feed?.managingEditor)
        XCTAssertNil(feed?.webMaster)
        XCTAssertNil(feed?.pubDate)
        XCTAssertNil(feed?.lastBuildDate)
        
        XCTAssertNil(feed?.categories)
        XCTAssertNil(feed?.docs)
        XCTAssertNil(feed?.cloud)
        XCTAssertNil(feed?.rating)
        XCTAssertNil(feed?.ttl)
        XCTAssertNil(feed?.image)
        XCTAssertNil(feed?.skipDays)
        XCTAssertNil(feed?.skipHours)
        XCTAssertNil(feed?.textInput)
    }
    
    func testFeedBookmarks() {
        
        // Given
        let URL = fileURL("HatenaFavoritesRSS", type: "xml")
        let parser = FeedParser(URL: URL)
        
        // When
        let feed = parser.parse().rssFeed
        
        // Then
        XCTAssertNotNil(feed)
        
        XCTAssertNotNil(feed?.items)
        XCTAssertEqual(feed?.items?.count, 25)
        
        XCTAssertEqual(feed?.items?.first?.title, "7,500+ MikroTik Routers Are Forwarding Owners’ Traffic to the Attackers, How is Yours?")
        
        XCTAssertEqual(feed?.items?.first?.link, "https://blog.netlab.360.com/7500-mikrotik-routers-are-forwarding-owners-traffic-to-the-attackers-how-is-yours-en/")
        XCTAssertNil(feed?.items?.first?.author)
        
        XCTAssertNil(feed?.items?.first?.categories)
        
        XCTAssertNil(feed?.items?.first?.comments)
        XCTAssertEqual(feed?.items?.first?.description, "ルータの脆弱性ついてマルウェアしこんで、ユーザが閲覧するウェブページにcoinhive埋め込む話")
        
        XCTAssertNil(feed?.items?.first?.enclosure)
        XCTAssertNil(feed?.items?.first?.guid)
        XCTAssertNil(feed?.items?.first?.pubDate)
        
        XCTAssertNil(feed?.items?.first?.source)
        
        XCTAssertEqual(feed?.items?.first?.dublinCore?.dcCreator, "kazuhooku")
        XCTAssertNotNil(feed?.items?.first?.dublinCore?.dcDate)
        
        //XCTAssertNotNil(feed?.items?.first?.content)
        XCTAssertEqual(feed?.items?.first?.hatena?.bookmarkCount, 2)
    }
}
