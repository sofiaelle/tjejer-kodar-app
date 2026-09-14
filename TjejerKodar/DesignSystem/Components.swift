import SwiftUI

// MARK: - Card

/// A card with its own surface, rounded corners and a thin border.
/// Put whatever you like inside.
///
/// ```swift
/// Card {
///     Text("Intro till SwiftUI")
/// }
/// ```
struct Card<Content: View>: View {
    @ViewBuilder var content: Content

    var body: some View {
        content
            .padding(Spacing.l)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Palette.surface)
            .clipShape(RoundedRectangle(cornerRadius: Radius.medium))
            .overlay(
                RoundedRectangle(cornerRadius: Radius.medium)
                    .stroke(Palette.border, lineWidth: 1)
            )
    }
}

// MARK: - Buttons

/// The app's main button, filled with the accent colour.
///
/// ```swift
/// Button("Anmäl dig") { }
///     .buttonStyle(.primary)
/// ```
struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundStyle(.white)
            .padding(.vertical, Spacing.m)
            .padding(.horizontal, Spacing.xl)
            .frame(maxWidth: .infinity)
            .background(Palette.accent)
            .clipShape(RoundedRectangle(cornerRadius: Radius.small))
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

/// A quieter button, for less important choices.
struct SecondaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundStyle(Palette.accent)
            .padding(.vertical, Spacing.m)
            .padding(.horizontal, Spacing.xl)
            .background(Palette.accentSoft)
            .clipShape(RoundedRectangle(cornerRadius: Radius.small))
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

/// A small button that fits inside a card, for example "Invite".
/// Changes appearance once something is already done.
///
/// ```swift
/// Button("Invite") { }
///     .buttonStyle(.compact(isDone: member.isInvited))
/// ```
struct CompactButtonStyle: ButtonStyle {
    var isDone: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.subheadline.weight(.semibold))
            .foregroundStyle(isDone ? Palette.success : Palette.accent)
            .padding(.vertical, Spacing.s)
            .padding(.horizontal, Spacing.m)
            .background(isDone ? Palette.successSoft : Palette.accentSoft)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: PrimaryButtonStyle { PrimaryButtonStyle() }
}

extension ButtonStyle where Self == SecondaryButtonStyle {
    static var secondary: SecondaryButtonStyle { SecondaryButtonStyle() }
}

extension ButtonStyle where Self == CompactButtonStyle {
    static func compact(isDone: Bool = false) -> CompactButtonStyle {
        CompactButtonStyle(isDone: isDone)
    }
}

// MARK: - Label

/// A small rounded label, for example for what kind of event something is.
///
/// ```swift
/// Pill("Workshop")
/// Pill("Going", tone: .success)
/// ```
struct Pill: View {
    enum Tone { case accent, success, neutral }

    var text: String
    var tone: Tone

    init(_ text: String, tone: Tone = .accent) {
        self.text = text
        self.tone = tone
    }

    var body: some View {
        Text(text)
            .font(.caption.weight(.medium))
            .foregroundStyle(foreground)
            .padding(.vertical, Spacing.xs)
            .padding(.horizontal, Spacing.s)
            .background(background)
            .clipShape(Capsule())
    }

    private var foreground: Color {
        switch tone {
        case .accent: Palette.accent
        case .success: Palette.success
        case .neutral: Palette.inkMuted
        }
    }

    private var background: Color {
        switch tone {
        case .accent: Palette.accentSoft
        case .success: Palette.successSoft
        case .neutral: Palette.border.opacity(0.45)
        }
    }
}

// MARK: - Date

/// Shows a date as a compact block, day above month.
///
/// ```swift
/// DateBadge(date: event.date)
/// ```
struct DateBadge: View {
    var date: Date

    var body: some View {
        VStack(spacing: 0) {
            Text(date, format: .dateTime.day())
                .font(.title3.weight(.bold))
            Text(date, format: .dateTime.month(.abbreviated))
                .font(.caption2.weight(.medium))
                .textCase(.uppercase)
        }
        .foregroundStyle(Palette.accent)
        .frame(width: 46, height: 46)
        .background(Palette.accentSoft)
        .clipShape(RoundedRectangle(cornerRadius: Radius.small))
        .accessibilityLabel(Text(date, format: .dateTime.day().month(.wide)))
    }
}

// MARK: - Person

/// A round badge with the initials of a name.
/// The colour is picked automatically from the name, so the same person
/// always gets the same colour.
///
/// ```swift
/// Avatar(name: "Alma Ek")
/// ```
struct Avatar: View {
    var name: String
    var size: CGFloat = 44

    var body: some View {
        Text(initials)
            .font(.system(size: size * 0.38, weight: .semibold, design: .rounded))
            .foregroundStyle(.white)
            .frame(width: size, height: size)
            .background(color)
            .clipShape(Circle())
            .accessibilityHidden(true)
    }

    private var initials: String {
        let parts = name.split(separator: " ").prefix(2)
        return parts.compactMap { $0.first }.map(String.init).joined().uppercased()
    }

    private var color: Color {
        let hues: [Double] = [0.78, 0.92, 0.05, 0.55, 0.42, 0.68]
        let index = abs(name.hashValue) % hues.count
        return Color(hue: hues[index], saturation: 0.52, brightness: 0.68)
    }
}

// MARK: - Empty state

/// Shown when there is no content yet.
///
/// ```swift
/// EmptyStateView(
///     icon: "person.2",
///     title: "No friends yet",
///     message: "This is where the community tab goes."
/// )
/// ```
struct EmptyStateView: View {
    var icon: String
    var title: String
    var message: String

    var body: some View {
        VStack(spacing: Spacing.m) {
            Image(systemName: icon)
                .font(.system(size: 44))
                .foregroundStyle(Palette.accent)
            Text(title)
                .font(TextStyle.heading)
                .foregroundStyle(Palette.ink)
            Text(message)
                .font(TextStyle.caption)
                .foregroundStyle(Palette.inkMuted)
                .multilineTextAlignment(.center)
        }
        .padding(Spacing.xl)
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Screen header

/// The heading at the top of a screen, with room for a button on the right.
///
/// ```swift
/// ScreenHeader("Upcoming") {
///     Button { } label: { Image(systemName: "plus") }
/// }
/// ```
struct ScreenHeader<Trailing: View>: View {
    var title: String
    @ViewBuilder var trailing: Trailing

    init(_ title: String, @ViewBuilder trailing: () -> Trailing) {
        self.title = title
        self.trailing = trailing()
    }

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(title)
                .font(TextStyle.title)
                .foregroundStyle(Palette.ink)
            Spacer()
            trailing
                .font(.title2)
                .foregroundStyle(Palette.accent)
        }
        .padding(.horizontal, Spacing.l)
        .padding(.top, Spacing.s)
        .padding(.bottom, Spacing.m)
    }
}

extension ScreenHeader where Trailing == EmptyView {
    init(_ title: String) {
        self.init(title) { EmptyView() }
    }
}

// MARK: - Screen background

/// Puts the app's background colour behind a whole screen.
///
/// ```swift
/// VStack { ... }
///     .screenBackground()
/// ```
extension View {
    func screenBackground() -> some View {
        self.background(Palette.background.ignoresSafeArea())
    }
}
