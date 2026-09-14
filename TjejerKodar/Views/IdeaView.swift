import SwiftUI

/// Tab 3, yours.
///
/// This tab is deliberately empty. Build something that isn't in the
/// instructions: a profile, a map of the events, a countdown, a counter of
/// how many you have attended. Anything at all.
struct IdeaView: View {
    var body: some View {
        VStack(spacing: 0) {
            ScreenHeader("Din idé")

            Spacer()

            EmptyStateView(
                icon: "sparkles",
                title: "Den här fliken är din",
                message: "Bygg något som inte står i instruktionerna. Det är den här alla vill se på demon."
            )

            Spacer()
        }
        .screenBackground()
    }
}

#Preview {
    IdeaView()
}
