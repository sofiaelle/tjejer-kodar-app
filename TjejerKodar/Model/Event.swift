import Foundation

/// En träff i kalendern: workshop, hackaton, meetup eller afterwork.
struct Event: Identifiable, Hashable, Codable {
    /// Vad för sorts träff det är. Används för etiketten på kortet.
    enum Kind: String, Codable, CaseIterable {
        case workshop = "Workshop"
        case hackathon = "Hackaton"
        case meetup = "Meetup"
        case afterwork = "Afterwork"
    }

    var id = UUID()
    /// Rubriken, t.ex. "Koda med AI".
    var title: String
    /// När träffen är.
    var date: Date
    /// Var den är, t.ex. "Bruce, Stockholm".
    var place: String
    var kind: Kind
    /// Om du har anmält dig.
    var isAttending: Bool

    init(
        id: UUID = UUID(),
        title: String,
        date: Date,
        place: String,
        kind: Kind,
        isAttending: Bool = false
    ) {
        self.id = id
        self.title = title
        self.date = date
        self.place = place
        self.kind = kind
        self.isAttending = isAttending
    }
}

extension Event {
    /// Exempeldata att bygga gränssnittet med.
    /// Datumen räknas ut från idag, så listan blir aldrig gammal.
    static let examples: [Event] = [
        Event(title: "Koda med AI",
              date: inDays(3, hour: 17),
              place: "Bruce, Stockholm",
              kind: .workshop,
              isAttending: true),
        Event(title: "Hackaton: bygg vidare på appen",
              date: inDays(11, hour: 9),
              place: "Epicenter, Stockholm",
              kind: .hackathon),
        Event(title: "Från junior till senior",
              date: inDays(18, hour: 18),
              place: "Digitalt",
              kind: .meetup),
        Event(title: "Afterwork och kodsnack",
              date: inDays(25, hour: 17),
              place: "Urban Deli, Sveavägen",
              kind: .afterwork),
        Event(title: "Introduktion till SwiftUI",
              date: inDays(39, hour: 17),
              place: "Bruce, Stockholm",
              kind: .workshop)
    ]

    /// Ett datum så här många dagar fram i tiden, vid en viss timme.
    private static func inDays(_ days: Int, hour: Int) -> Date {
        let calendar = Calendar.current
        let day = calendar.date(byAdding: .day, value: days, to: .now) ?? .now
        return calendar.date(bySettingHour: hour, minute: 0, second: 0, of: day) ?? day
    }
}
