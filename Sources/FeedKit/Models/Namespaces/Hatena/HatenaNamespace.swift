//
//  HatenaNamespace.swift
//  FeedKit iOS
//
//  Created by Tomochika Hara on 2018/09/06.
//

import Foundation

public class HatenaNamespace {
 
    public var bookmarkCount: Int?
}

// MARK: - Equatable

extension HatenaNamespace: Equatable {
    
    public static func ==(lhs: HatenaNamespace, rhs: HatenaNamespace) -> Bool {
        return
            lhs.bookmarkCount == rhs.bookmarkCount
    }

}
