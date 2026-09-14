import Foundation

/// Something you have earned by showing up: a workshop attended, a friend
/// invited, an app shipped. Shown on the third tab.
struct Badge: Identifiable, Hashable, Codable {
    var id = UUID()
    /// The short name on the badge, for example "First workshop".
    var title: String
    /// An SF Symbol name, for example "sparkles".
    var icon: String
    /// One line about how you earn it. Shown when you tap the badge.
    var detail: String
    /// Whether you have earned it yet. Locked badges are greyed out.
    var isEarned: Bool

    init(
        id: UUID = UUID(),
        title: String,
        icon: String,
        detail: String,
        isEarned: Bool = false
    ) {
        self.id = id
        self.title = title
        self.icon = icon
        self.detail = detail
        self.isEarned = isEarned
    }
}

extension Badge {
    /// Sample data to build the interface with.
    static let examples: [Badge] = [
        Badge(title: "First workshop",
              icon: "figure.wave",
              detail: "You came to your first Tjejer kodar workshop.",
              isEarned: true),
        Badge(title: "Shipped an app",
              icon: "hammer.fill",
              detail: "You built something and ran it on your own phone.",
              isEarned: true),
        Badge(title: "Brought a friend",
              icon: "person.2.fill",
              detail: "Someone you invited showed up.",
              isEarned: true),
        Badge(title: "Night owl",
              icon: "moon.stars.fill",
              detail: "Keep coding after ten in the evening."),
        Badge(title: "Five in a row",
              icon: "flame.fill",
              detail: "Attend five events without missing one."),
        Badge(title: "Taught someone",
              icon: "lightbulb.fill",
              detail: "Help another person past something you were stuck on.")
    ]
}
