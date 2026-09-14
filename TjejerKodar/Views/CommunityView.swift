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
                title: "This is where you build the community tab",
                message: "A list of people, and a button to invite them."
            )

            Spacer()
        }
        .screenBackground()
    }
}

#Preview {
    CommunityView()
}
