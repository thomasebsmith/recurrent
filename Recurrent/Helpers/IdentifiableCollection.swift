//
//  IdentifiableCollection.swift
//  Recurrent
//
//  Created by Thomas Smith on 11/18/19.
//  Copyright © 2019 Thomas Smith. All rights reserved.
//

import Foundation

class IdentifiableCollection<Container> where
        Container: RandomAccessCollection,
        Container.Index == Int {

    public var data: Container

    init(_ container: Container) {
        data = container
    }
}

extension IdentifiableCollection: RandomAccessCollection {
    struct IdentifiableElement: Identifiable {
        typealias ID = Index

        let value: Container.Element
        let position: Index

        var id: ID {
            return position
        }
    }

    typealias Element = IdentifiableElement
    typealias Index = Container.Index

    var startIndex: Index {
        return data.startIndex
    }
    var endIndex: Index {
        return data.endIndex
    }

    subscript(position: Index) -> Element {
        return IdentifiableElement(value: data[position], position: position)
    }

    func index(after i: Index) -> Index {
        return data.index(after: i)
    }
    func index(before i: Index) -> Index {
        return data.index(before: i)
    }
}

