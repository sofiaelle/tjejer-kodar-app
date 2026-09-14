import SwiftUI

// MARK: - Colours

/// The app's colour palette. Every colour has both a light and a dark value,
/// so the app handles dark mode automatically.
///
/// Use `Palette.ink` instead of `.black`, `Palette.accent` instead of
/// `.purple`, and so on.
enum Palette {
    /// The background behind all content.
    static let background = Color(light: 0xFBF9FD, dark: 0x121019)
    /// The surface of cards and panels sitting on top of the background.
    static let surface = Color(light: 0xFFFFFF, dark: 0x1F1B28)
    /// Regular text colour.
    static let ink = Color(light: 0x1B1522, dark: 0xF4F0F8)
    /// Muted text: captions, help text, dates.
    static let inkMuted = Color(light: 0x796F87, dark: 0xA79CB5)
    /// The app's signature colour. Used on buttons and highlights.
    static let accent = Color(light: 0x8A2FAF, dark: 0xCB8CEA)
    /// A soft variant of the signature colour, for backgrounds behind
    /// accent coloured text.
    static let accentSoft = Color(light: 0xF5E8FB, dark: 0x2C1D38)
    /// Thin lines and borders.
    static let border = Color(light: 0xEBE1F1, dark: 0x322A3C)
    /// Confirmations: signed up, invited, done.
    static let success = Color(light: 0x14755E, dark: 0x5BD6BA)
    /// A soft variant of the confirmation colour.
    static let successSoft = Color(light: 0xE2F4EF, dark: 0x14302A)
}

// MARK: - Measurements

/// Spacing values. Use these instead of your own numbers, so the gaps stay
/// consistent throughout the app.
enum Spacing {
    /// 4 pt
    static let xs: CGFloat = 4
    /// 8 pt
    static let s: CGFloat = 8
    /// 12 pt
    static let m: CGFloat = 12
    /// 16 pt
    static let l: CGFloat = 16
    /// 24 pt
    static let xl: CGFloat = 24
    /// 32 pt
    static let xxl: CGFloat = 32
}

/// Corner radii.
enum Radius {
    static let small: CGFloat = 10
    static let medium: CGFloat = 16
    static let large: CGFloat = 24
}

// MARK: - Typography

/// Text styles. All of them scale with the text size the user has chosen
/// in iOS.
enum TextStyle {
    /// Large heading, at the top of a screen.
    static let title = Font.system(.largeTitle, design: .rounded, weight: .bold)
    /// Heading on a card or a section.
    static let heading = Font.system(.headline, design: .rounded, weight: .semibold)
    /// Regular body text.
    static let body = Font.system(.body)
    /// Small text: dates, help text, labels.
    static let caption = Font.system(.subheadline)
}

// MARK: - Helpers

extension Color {
    /// Creates a colour that switches value automatically in dark mode.
    /// The colours are written as hex numbers, for example `0xFF8800`.
    init(light: UInt32, dark: UInt32) {
        self.init(uiColor: UIColor { traits in
            UIColor(hex: traits.userInterfaceStyle == .dark ? dark : light)
        })
    }
}

private extension UIColor {
    convenience init(hex: UInt32) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255,
            green: CGFloat((hex >> 8) & 0xFF) / 255,
            blue: CGFloat(hex & 0xFF) / 255,
            alpha: 1
        )
    }
}
