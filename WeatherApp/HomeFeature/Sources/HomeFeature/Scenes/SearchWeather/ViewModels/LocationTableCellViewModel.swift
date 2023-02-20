import Foundation
import CoreModels
import CommonResources

public struct LocationCellViewModel {
    let nameText: String
    let countryText: String
    
    public init(_ location: Location) {
        self.nameText = location.name
        self.countryText = "\(L10n.country): \(location.country)"
    }
}
