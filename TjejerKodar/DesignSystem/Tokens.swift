import SwiftUI

// MARK: - Färger

/// Appens färgpalett. Alla färger har både ett ljust och ett mörkt läge,
/// så appen fungerar automatiskt i dark mode.
///
/// Använd `Palette.ink` i stället för `.black`, `Palette.accent` i stället
/// för `.purple`, och så vidare.
enum Palette {
    /// Bakgrunden bakom allt innehåll.
    static let background = Color(light: 0xFBF9FD, dark: 0x121019)
    /// Ytan på kort och paneler som ligger ovanpå bakgrunden.
    static let surface = Color(light: 0xFFFFFF, dark: 0x1F1B28)
    /// Vanlig textfärg.
    static let ink = Color(light: 0x1B1522, dark: 0xF4F0F8)
    /// Dämpad text: bildtexter, hjälptexter, datum.
    static let inkMuted = Color(light: 0x796F87, dark: 0xA79CB5)
    /// Appens signaturfärg. Används på knappar och markeringar.
    static let accent = Color(light: 0x8A2FAF, dark: 0xCB8CEA)
    /// Svag variant av signaturfärgen, för bakgrunder bakom accentfärgad text.
    static let accentSoft = Color(light: 0xF5E8FB, dark: 0x2C1D38)
    /// Tunna linjer och kantlinjer.
    static let border = Color(light: 0xEBE1F1, dark: 0x322A3C)
    /// Bekräftelser: anmäld, inbjuden, klart.
    static let success = Color(light: 0x14755E, dark: 0x5BD6BA)
    /// Svag variant av bekräftelsefärgen.
    static let successSoft = Color(light: 0xE2F4EF, dark: 0x14302A)
}

// MARK: - Mått

/// Avstånd. Använd dessa i stället för egna siffror, så blir mellanrummen
/// konsekventa genom hela appen.
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

/// Hörnradier.
enum Radius {
    static let small: CGFloat = 10
    static let medium: CGFloat = 16
    static let large: CGFloat = 24
}

// MARK: - Typografi

/// Textstilar. Alla skalar med användarens valda textstorlek i iOS.
enum TextStyle {
    /// Stor rubrik, högst upp på en skärm.
    static let title = Font.system(.largeTitle, design: .rounded, weight: .bold)
    /// Rubrik på ett kort eller en sektion.
    static let heading = Font.system(.headline, design: .rounded, weight: .semibold)
    /// Vanlig brödtext.
    static let body = Font.system(.body)
    /// Liten text: datum, hjälptexter, etiketter.
    static let caption = Font.system(.subheadline)
}

// MARK: - Hjälpare

extension Color {
    /// Skapar en färg som byter värde automatiskt i dark mode.
    /// Färgerna skrivs som hex-tal, t.ex. `0xFF8800`.
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
