import SwiftUI

/// Tab 3, yours.
///
/// This tab is deliberately empty. Build something that isn't in the
/// instructions: a profile, a map of the events, a countdown, a counter of
/// how many you have attended. Anything at all.
struct IdeaView: View {
    var body: some View {
        VStack(spacing: 0) {
            ScreenHeader("Your idea")

            Spacer()

            EmptyStateView(
                icon: "sparkles",
                title: "This tab is yours",
                message: "Build something that is not in the instructions. This is the one everyone wants to see at the demo."
            )

            Spacer()
        }
        .screenBackground()
    }
}

#Preview {
    IdeaView()
}
