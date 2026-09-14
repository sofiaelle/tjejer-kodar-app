import SwiftUI

/// The app's three tabs. You rarely need to change this file.
/// The work happens inside the three views.
struct RootView: View {
    var body: some View {
        TabView {
            EventsView()
                .tabItem { Label("Upcoming", systemImage: "calendar") }

            CommunityView()
                .tabItem { Label("Community", systemImage: "person.2") }

            IdeaView()
                .tabItem { Label("Your idea", systemImage: "sparkles") }
        }
        .tint(Palette.accent)
    }
}

#Preview {
    RootView()
}
