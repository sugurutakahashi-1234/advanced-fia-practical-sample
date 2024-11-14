//
//  Created by sugurutakahashi on 2024/02/15
//  Copyright sugurutakahashi. All rights reserved.
//

import DomainLayer
import Foundation
import LicenseList

public final class LibraryLicenseDriver: LibraryLicenseDriverProtocol {
    public init() {
        OSLogDriver.initLog()
    }

    deinit {
        OSLogDriver.deinitLog()
    }

    public var licenseList: [DomainLayer.License] {
        LicenseList.Library.libraries.map { License(from: $0) }.filter { !$0.text.isEmpty }
    }
}

extension DomainLayer.License {
    init(from licensesListLibrary: LicenseList.Library) {
        self.init(id: licensesListLibrary.id.uuidString, name: licensesListLibrary.name, text: licensesListLibrary.licenseBody)
    }
}
