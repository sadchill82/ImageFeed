import UIKit

let dateTimeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    return formatter
}()

func getDateFromString(_ string: String) -> Date? {
    dateTimeFormatter.date(from: string)
}

extension Date {
    static func date(fromString string: String, withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.calendar = .init(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "en-US")
        return dateFormatter.date(from: string)
    }
}

struct PhotoResult: Codable {
    let id: String
    let width: Int
    let height: Int
    let welcomeDescription: String?
    let isLiked: Bool
    let createdAt: String
    let urls: ImageURL
    
    enum CodingKeys: String, CodingKey {
        case id
        case width
        case height
        case createdAt = "created_at"
        case welcomeDescription = "description"
        case isLiked = "liked_by_user"
        case urls
    }
}

extension PhotoResult {
    func convert() -> Photo {
                
        return Photo(
            id: self.id,
            size: CGSize(width: self.width, height: self.height),
            createdAt: getDateFromString(self.createdAt)!,
            welcomeDescription: self.welcomeDescription,
            thumbImageURL: self.urls.thumb,
            largeImageURL: self.urls.full,
            isLiked: self.isLiked
        )
    }
}
