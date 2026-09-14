import SwiftUI

/// Appens tre flikar. Den här filen behöver du sällan ändra i —
/// det är inne i de tre vyerna arbetet sker.
struct RootView: View {
    var body: some View {
        TabView {
            EventsView()
                .tabItem { Label("Kommande", systemImage: "calendar") }

            CommunityView()
                .tabItem { Label("Community", systemImage: "person.2") }

            IdeaView()
                .tabItem { Label("Din idé", systemImage: "sparkles") }
        }
        .tint(Palette.accent)
    }
}

#Preview {
    RootView()
}
