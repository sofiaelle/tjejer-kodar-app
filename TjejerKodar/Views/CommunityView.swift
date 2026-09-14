import SwiftUI

/// Flik 2 — communityt.
///
/// Tom med flit. Här bygger du en lista över personer med en
/// "Bjud in"-knapp på varje. Titta i `Member.swift` efter datan,
/// och i `EventsView.swift` efter hur en lista kan se ut.
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
