import SwiftUI

/// Tab 2, the community.
///
/// Empty on purpose. Here you build a list of people with an invite button
/// on each row. The data lives in `Member.swift`, and `EventsView.swift`
/// shows you what a list can look like.
struct CommunityView: View {
    var body: some View {
        VStack(spacing: 0) {
            ScreenHeader("Community")

            Spacer()

            EmptyStateView(
                icon: "person.2",
                title: "Här bygger du community-fliken",
                message: "En lista med personer, och en knapp för att bjuda in dem."
            )

            Spacer()
        }
        .screenBackground()
    }
}

#Preview {
    CommunityView()
}
