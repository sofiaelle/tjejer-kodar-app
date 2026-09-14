import SwiftUI

/// Flik 1 — kommande träffar.
///
/// Den här vyn är redan byggd, och det är med flit: använd den som
/// facit när du bygger de andra två flikarna. Fastnar du där, fråga
/// Claude "förklara hur EventsView fungerar".
struct EventsView: View {
    /// Exempeldata så länge. I nivå 1 gör du listan ändringsbar.
    private let events = Event.examples

    var body: some View {
        VStack(spacing: 0) {
            ScreenHeader("Kommande")

            ScrollView {
                LazyVStack(spacing: Spacing.m) {
                    ForEach(events) { event in
                        EventRow(event: event)
                    }
                }
                .padding(.horizontal, Spacing.l)
                .padding(.bottom, Spacing.xl)
            }
        }
        .screenBackground()
    }
}

/// Ett kort för en träff.
struct EventRow: View {
    var event: Event

    var body: some View {
        Card {
            HStack(alignment: .top, spacing: Spacing.m) {
                DateBadge(date: event.date)

                VStack(alignment: .leading, spacing: Spacing.xs) {
                    Text(event.title)
                        .font(TextStyle.heading)
                        .foregroundStyle(Palette.ink)

                    Text(event.place)
                        .font(TextStyle.caption)
                        .foregroundStyle(Palette.inkMuted)

                    HStack(spacing: Spacing.s) {
                        Pill(event.kind.rawValue)
                        if event.isAttending {
                            Pill("Anmäld", tone: .success)
                        }
                    }
                    .padding(.top, Spacing.xs)
                }
            }
        }
    }
}

#Preview {
    EventsView()
}
