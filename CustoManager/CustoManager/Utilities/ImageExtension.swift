//
//  ImageExtension.swift
//  CustoManager
//
//  Created by Aman Gupta on 27/08/22.
//

import SwiftUI

extension Image {

    static var sort: Image { Image(systemName: "line.3.horizontal.decrease.circle") }
    static var ascending: Image { Image(systemName: "arrowtriangle.up.circle.fill") }
    static var descending: Image { Image(systemName: "arrowtriangle.down.circle.fill") }

    static var profile: Image { Image(systemName: "person.crop.circle") }

    static var add: Image { Image(systemName: "plus") }
    static var edit: Image { Image(systemName: "pencil") }
}
