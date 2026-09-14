import Foundation

/// Someone in the community, who you can invite to an event.
struct Member: Identifiable, Hashable, Codable {
    var id = UUID()
    /// Full name. `Avatar` turns it into initials automatically.
    var name: String
    /// What the person does, for example "iOS developer".
    var role: String
    /// Whether you have already invited them.
    var isInvited: Bool

    init(id: UUID = UUID(), name: String, role: String, isInvited: Bool = false) {
        self.id = id
        self.name = name
        self.role = role
        self.isInvited = isInvited
    }
}

extension Member {
    /// Sample data to build the interface with.
    static let examples: [Member] = [
        Member(name: "Sofia Ellegren", role: "iOS developer", isInvited: true),
        Member(name: "Nour Hassan", role: "Frontend"),
        Member(name: "Vera Lindqvist", role: "Data engineer"),
        Member(name: "Jessica Thompson", role: "Studying computer science"),
        Member(name: "Sanna Ohlsson", role: "UX and some code"),
        Member(name: "Ebba Nyström", role: "Backend"),
        Member(name: "Leila Karim", role: "Changed careers this spring")
    ]
}
