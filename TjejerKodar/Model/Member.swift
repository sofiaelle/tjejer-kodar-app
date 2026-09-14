import Foundation

/// Någon i communityt, som du kan bjuda in till en träff.
struct Member: Identifiable, Hashable, Codable {
    var id = UUID()
    /// Hela namnet. `Avatar` gör initialer av det automatiskt.
    var name: String
    /// Vad personen gör, t.ex. "iOS-utvecklare".
    var role: String
    /// Om du redan har bjudit in hen.
    var isInvited: Bool

    init(id: UUID = UUID(), name: String, role: String, isInvited: Bool = false) {
        self.id = id
        self.name = name
        self.role = role
        self.isInvited = isInvited
    }
}

extension Member {
    /// Exempeldata att bygga gränssnittet med.
    static let examples: [Member] = [
        Member(name: "Alma Ek", role: "iOS-utvecklare", isInvited: true),
        Member(name: "Nour Hassan", role: "Frontend"),
        Member(name: "Vera Lindqvist", role: "Data engineer"),
        Member(name: "Iris Bergström", role: "Pluggar systemvetenskap"),
        Member(name: "Sanna Ohlsson", role: "UX och lite kod"),
        Member(name: "Ebba Nyström", role: "Backend"),
        Member(name: "Leila Karim", role: "Bytte karriär i våras")
    ]
}
