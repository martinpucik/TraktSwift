//
//  SearchType.swift
//  TraktSwift
//
//  Created by Martin Púčik on 05/05/2020.
//

import Foundation

public enum SearchType: String, Decodable {
    case movie, show, episode, person, list
}
