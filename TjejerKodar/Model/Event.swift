import Foundation

/// An event in the calendar: workshop, hackathon, meetup or afterwork.
struct Event: Identifiable, Hashable, Codable {
    /// What kind of event it is. Used for the pill on the card.
    enum Kind: String, Codable, CaseIterable {
        case workshop = "Workshop"
        case hackathon = "Hackaton"
        case meetup = "Meetup"
        case afterwork = "Afterwork"
    }

    var id = UUID()
    /// The title, for example "Koda med AI".
    var title: String
    /// When the event takes place.
    var date: Date
    /// Where it is, for example "Bruce, Stockholm".
    var place: String
    var kind: Kind
    /// Whether you have signed up.
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
    /// Sample data to build the interface with.
    /// Dates are calculated from today, so the list never goes stale.
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

    /// A date this many days from now, at a given hour.
    private static func inDays(_ days: Int, hour: Int) -> Date {
        let calendar = Calendar.current
        let day = calendar.date(byAdding: .day, value: days, to: .now) ?? .now
        return calendar.date(bySettingHour: hour, minute: 0, second: 0, of: day) ?? day
    }
}
