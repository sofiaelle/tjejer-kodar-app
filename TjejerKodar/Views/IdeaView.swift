import SwiftUI

/// Tab 3, yours.
///
/// This is one example of what the third tab can be: your own year in the
/// community. A countdown to the next event you are going to, three numbers
/// worth being proud of, and badges you unlock by showing up.
///
/// Nothing here is the right answer. Build something else.
struct IdeaView: View {
    /// The badges, kept in state so they can be unlocked while the app runs.
    @State private var badges = Badge.examples
    /// How many events you have been to. The check in button adds one.
    @State private var eventsAttended = 7
    /// How many people you have invited.
    @State private var invitesSent = 12
    /// The badge you last tapped, the one whose text is shown.
    @State private var selectedBadge: Badge.ID?

    var body: some View {
        VStack(spacing: 0) {
            ScreenHeader("Your year") {
                Avatar(name: "Sofia Ellegren", size: 36)
            }

            ScrollView {
                VStack(spacing: Spacing.l) {
                    nextUpCard
                    statsRow
                    badgesSection
                    checkInButton
                }
                .padding(.horizontal, Spacing.l)
                .padding(.bottom, Spacing.xl)
            }
        }
        .screenBackground()
    }

    // MARK: - The next event

    /// The nearest event you have signed up for.
    private var nextEvent: Event? {
        Event.examples
            .filter { $0.isAttending && $0.date > .now }
            .min { $0.date < $1.date }
    }

    /// Whole days from today until that event.
    private var daysUntilNextEvent: Int {
        guard let nextEvent else { return 0 }
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: .now)
        let eventDay = calendar.startOfDay(for: nextEvent.date)
        let days = calendar.dateComponents([.day], from: today, to: eventDay).day ?? 0
        return max(days, 0)
    }

    /// How full the ring is. It fills up as the event gets closer, counted
    /// over a month, so a month away is empty and today is full.
    private var countdownProgress: Double {
        let window = 30.0
        return 1 - min(Double(daysUntilNextEvent), window) / window
    }

    @ViewBuilder
    private var nextUpCard: some View {
        if let nextEvent {
            Card {
                HStack(spacing: Spacing.l) {
                    CountdownRing(days: daysUntilNextEvent, progress: countdownProgress)

                    VStack(alignment: .leading, spacing: Spacing.xs) {
                        Text("Next up")
                            .font(TextStyle.caption)
                            .foregroundStyle(Palette.inkMuted)

                        Text(nextEvent.title)
                            .font(TextStyle.heading)
                            .foregroundStyle(Palette.ink)

                        Text(nextEvent.place)
                            .font(TextStyle.caption)
                            .foregroundStyle(Palette.inkMuted)

                        Pill(nextEvent.kind.rawValue)
                            .padding(.top, Spacing.xs)
                    }
                }
            }
        } else {
            Card {
                Text("Nothing booked yet. Pick something on the first tab.")
                    .font(TextStyle.caption)
                    .foregroundStyle(Palette.inkMuted)
            }
        }
    }

    // MARK: - The three numbers

    private var earnedCount: Int {
        badges.filter(\.isEarned).count
    }

    private var statsRow: some View {
        HStack(spacing: Spacing.m) {
            StatTile(value: "\(eventsAttended)", label: "Events")
            StatTile(value: "\(invitesSent)", label: "Invites")
            StatTile(value: "\(earnedCount)/\(badges.count)", label: "Badges")
        }
    }

    // MARK: - The badges

    private var badgesSection: some View {
        VStack(alignment: .leading, spacing: Spacing.m) {
            Text("Badges")
                .font(TextStyle.heading)
                .foregroundStyle(Palette.ink)

            LazyVGrid(
                columns: Array(
                    repeating: GridItem(.flexible(), spacing: Spacing.m),
                    count: 3
                ),
                spacing: Spacing.l
            ) {
                ForEach(badges) { badge in
                    BadgeTile(badge: badge, isSelected: selectedBadge == badge.id) {
                        withAnimation(.spring(duration: 0.3)) {
                            selectedBadge = selectedBadge == badge.id ? nil : badge.id
                        }
                    }
                }
            }

            if let badge = badges.first(where: { $0.id == selectedBadge }) {
                Card {
                    HStack(alignment: .top, spacing: Spacing.s) {
                        Image(systemName: badge.isEarned ? "checkmark.seal.fill" : "lock.fill")
                            .foregroundStyle(badge.isEarned ? Palette.success : Palette.inkMuted)

                        Text(badge.detail)
                            .font(TextStyle.caption)
                            .foregroundStyle(Palette.ink)
                    }
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
    }

    // MARK: - Check in

    private var checkInButton: some View {
        Button(allBadgesEarned ? "Every badge earned" : "Check in at an event") {
            checkIn()
        }
        .buttonStyle(.primary)
        .disabled(allBadgesEarned)
        .opacity(allBadgesEarned ? 0.5 : 1)
    }

    private var allBadgesEarned: Bool {
        earnedCount == badges.count
    }

    /// Counts one more event and unlocks the next badge in the row.
    private func checkIn() {
        withAnimation(.spring(duration: 0.45)) {
            eventsAttended += 1

            if let index = badges.firstIndex(where: { !$0.isEarned }) {
                badges[index].isEarned = true
                selectedBadge = badges[index].id
            }
        }
    }
}

// MARK: - The ring

/// A ring that fills up as the event gets closer, with the number of days
/// left in the middle. It draws itself when the tab opens.
private struct CountdownRing: View {
    var days: Int
    var progress: Double

    /// Starts at zero so the ring animates into place on appear.
    @State private var drawn: Double = 0

    var body: some View {
        ZStack {
            Circle()
                .stroke(Palette.border, lineWidth: 8)

            Circle()
                .trim(from: 0, to: drawn)
                .stroke(Palette.accent, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .rotationEffect(.degrees(-90))

            VStack(spacing: 0) {
                Text("\(days)")
                    .font(.system(.title, design: .rounded, weight: .bold))
                    .foregroundStyle(Palette.ink)

                Text(days == 1 ? "day" : "days")
                    .font(.caption)
                    .foregroundStyle(Palette.inkMuted)
            }
        }
        .frame(width: 88, height: 88)
        .onAppear {
            withAnimation(.easeOut(duration: 0.9)) { drawn = progress }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(days) days until the next event")
    }
}

// MARK: - One number

/// One of the three numbers in the row: a big figure and a small label.
private struct StatTile: View {
    var value: String
    var label: String

    var body: some View {
        Card {
            VStack(alignment: .leading, spacing: Spacing.xs) {
                Text(value)
                    .font(.system(.title2, design: .rounded, weight: .bold))
                    .foregroundStyle(Palette.accent)
                    .contentTransition(.numericText())

                Text(label)
                    .font(TextStyle.caption)
                    .foregroundStyle(Palette.inkMuted)
            }
            .lineLimit(1)
            .minimumScaleFactor(0.7)
        }
        .accessibilityElement(children: .combine)
    }
}

// MARK: - One badge

/// A badge in the grid. Earned ones are in colour, locked ones are grey.
private struct BadgeTile: View {
    var badge: Badge
    var isSelected: Bool
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            VStack(spacing: Spacing.s) {
                Image(systemName: badge.icon)
                    .font(.system(size: 22))
                    .foregroundStyle(badge.isEarned ? Palette.accent : Palette.inkMuted)
                    .frame(width: 56, height: 56)
                    .background(badge.isEarned ? Palette.accentSoft : Palette.border.opacity(0.45))
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Palette.accent, lineWidth: isSelected ? 2 : 0)
                    )
                    .scaleEffect(badge.isEarned ? 1 : 0.9)

                Text(badge.title)
                    .font(.caption)
                    .foregroundStyle(badge.isEarned ? Palette.ink : Palette.inkMuted)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, minHeight: 32, alignment: .top)
            }
        }
        .buttonStyle(.plain)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(badge.isEarned ? "\(badge.title), earned" : "\(badge.title), locked")
        .accessibilityHint(badge.detail)
    }
}

#Preview {
    IdeaView()
}
