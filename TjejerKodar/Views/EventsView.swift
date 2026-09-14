import SwiftUI

/// Tab 1, upcoming events.
///
/// This view is already built, on purpose. Use it as your reference when
/// you build the other two tabs. If you get stuck there, ask Claude to
/// explain how EventsView works.
struct EventsView: View {
    /// Sample data for now. In level 1 you make this list mutable.
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

/// One card for one event.
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
