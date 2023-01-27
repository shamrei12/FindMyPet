//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let geoDecoder = try? JSONDecoder().decode(GeoDecoder.self, from: jsonData)
//
//import Foundation
//
//// MARK: - GeoDecoder
//struct GeoDecoder: Codable {
//    let documentation: String
//    let licenses: [License]
//    let rate: Rate
//    let results: [Result]
//    let status: Status
//    let stayInformed: StayInformed
//    let thanks: String
//    let timestamp: Timestamp
//    let totalResults: Int
//
//    enum CodingKeys: String, CodingKey {
//        case documentation, licenses, rate, results, status
//        case stayInformed = "stay_informed"
//        case thanks, timestamp
//        case totalResults = "total_results"
//    }
//}
//
//// MARK: - License
//struct License: Codable {
//    let name: String
//    let url: String
//}
//
//// MARK: - Rate
//struct Rate: Codable {
//    let limit, remaining, reset: Int
//}
//
//// MARK: - Result
//struct Result: Codable {
//    let annotations: Annotations
//    let bounds: Bounds
//    let components: Components
//    let confidence: Int
//    let formatted: String
//    let geometry: Geometry
//}
//
//// MARK: - Annotations
//struct Annotations: Codable {
//    let dms: Dms
//    let mgrs, maidenhead: String
//    let mercator: Mercator
//    let osm: Osm
//    let unM49: UnM49
//    let callingcode: Int
//    let currency: Currency
//    let flag, geohash: String
//    let qibla: Double
//    let roadinfo: Roadinfo
//    let sun: Sun
//    let timezone: Timezone
//    let what3Words: What3Words
//
//    enum CodingKeys: String, CodingKey {
//        case dms = "DMS"
//        case mgrs = "MGRS"
//        case maidenhead = "Maidenhead"
//        case mercator = "Mercator"
//        case osm = "OSM"
//        case unM49 = "UN_M49"
//        case callingcode, currency, flag, geohash, qibla, roadinfo, sun, timezone
//        case what3Words = "what3words"
//    }
//}
//
//// MARK: - Currency
//struct Currency: Codable {
//    let alternateSymbols: [String]
//    let decimalMark: String
//    let disambiguateSymbol, format: String?
//    let htmlEntity, isoCode, isoNumeric, name: String
//    let smallestDenomination: Int
//    let subunit: String
//    let subunitToUnit: Int
//    let symbol: String
//    let symbolFirst: Int
//    let thousandsSeparator: String
//
//    enum CodingKeys: String, CodingKey {
//        case alternateSymbols = "alternate_symbols"
//        case decimalMark = "decimal_mark"
//        case disambiguateSymbol = "disambiguate_symbol"
//        case format
//        case htmlEntity = "html_entity"
//        case isoCode = "iso_code"
//        case isoNumeric = "iso_numeric"
//        case name
//        case smallestDenomination = "smallest_denomination"
//        case subunit
//        case subunitToUnit = "subunit_to_unit"
//        case symbol
//        case symbolFirst = "symbol_first"
//        case thousandsSeparator = "thousands_separator"
//    }
//}
//
//// MARK: - Dms
//struct Dms: Codable {
//    let lat, lng: String
//}
//
//// MARK: - Mercator
//struct Mercator: Codable {
//    let x, y: Double
//}
//
//// MARK: - Osm
//struct Osm: Codable {
//    let editURL: String?
//    let noteURL, url: String
//
//    enum CodingKeys: String, CodingKey {
//        case editURL = "edit_url"
//        case noteURL = "note_url"
//        case url
//    }
//}
//
//// MARK: - Roadinfo
//struct Roadinfo: Codable {
//    let driveOn: String
//    let road: String?
//    let speedIn: String
//
//    enum CodingKeys: String, CodingKey {
//        case driveOn = "drive_on"
//        case road
//        case speedIn = "speed_in"
//    }
//}
//
//// MARK: - Sun
//struct Sun: Codable {
//    let rise, sunSet: Rise
//
//    enum CodingKeys: String, CodingKey {
//        case rise
//        case sunSet = "set"
//    }
//}
//
//// MARK: - Rise
//struct Rise: Codable {
//    let apparent, astronomical, civil, nautical: Int
//}
//
//// MARK: - Timezone
//struct Timezone: Codable {
//    let name: String
//    let nowInDst, offsetSEC: Int
//    let offsetString, shortName: String
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        case nowInDst = "now_in_dst"
//        case offsetSEC = "offset_sec"
//        case offsetString = "offset_string"
//        case shortName = "short_name"
//    }
//}
//
//// MARK: - UnM49
//struct UnM49: Codable {
//    let regions: Regions
//    let statisticalGroupings: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case regions
//        case statisticalGroupings = "statistical_groupings"
//    }
//}
//
//// MARK: - Regions
//struct Regions: Codable {
//    let by, easternEurope, europe: String?
//    let world: String
//    let asia, regionsIN, southernAsia: String?
//
//    enum CodingKeys: String, CodingKey {
//        case by = "BY"
//        case easternEurope = "EASTERN_EUROPE"
//        case europe = "EUROPE"
//        case world = "WORLD"
//        case asia = "ASIA"
//        case regionsIN = "IN"
//        case southernAsia = "SOUTHERN_ASIA"
//    }
//}
//
//// MARK: - What3Words
//struct What3Words: Codable {
//    let words: String
//}
//
//// MARK: - Bounds
//struct Bounds: Codable {
//    let northeast, southwest: Geometry
//}
//
//// MARK: - Geometry
//struct Geometry: Codable {
//    let lat, lng: Double
//}
//
//// MARK: - Components
//struct Components: Codable {
//    let iso31661_Alpha2, iso31661_Alpha3: String
//    let iso31662: [String]?
//    let category, type: String
//    let building, city: String?
//    let continent, country, countryCode: String
//    let county, houseNumber, postcode, road: String?
//    let state: String
//    let library, stateCode: String?
//
//    enum CodingKeys: String, CodingKey {
//        case iso31661_Alpha2 = "ISO_3166-1_alpha-2"
//        case iso31661_Alpha3 = "ISO_3166-1_alpha-3"
//        case iso31662 = "ISO_3166-2"
//        case category = "_category"
//        case type = "_type"
//        case building, city, continent, country
//        case countryCode = "country_code"
//        case county
//        case houseNumber = "house_number"
//        case postcode, road, state, library
//        case stateCode = "state_code"
//    }
//}
//
//// MARK: - Status
//struct Status: Codable {
//    let code: Int
//    let message: String
//}
//
//// MARK: - StayInformed
//struct StayInformed: Codable {
//    let blog, mastodon, twitter: String
//}
//
//// MARK: - Timestamp
//struct Timestamp: Codable {
//    let createdHTTP: String
//    let createdUnix: Int
//
//    enum CodingKeys: String, CodingKey {
//        case createdHTTP = "created_http"
//        case createdUnix = "created_unix"
//    }
//}
