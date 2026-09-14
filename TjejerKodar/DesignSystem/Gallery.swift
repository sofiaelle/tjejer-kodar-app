import SwiftUI

/// A gallery of everything in the design system.
///
/// This file is not used by the app. It exists so that you (and Claude) can
/// quickly see which building blocks already exist. Open the file in Xcode
/// and press "Resume" in the preview on the right to see them.
struct Gallery: View {
    @State private var invited = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.xl) {
                section("ScreenHeader") {
                    ScreenHeader("Upcoming") {
                        Image(systemName: "plus.circle.fill")
                    }
                }

                section("Card + DateBadge + Pill") {
                    Card {
                        HStack(alignment: .top, spacing: Spacing.m) {
                            DateBadge(date: .now)
                            VStack(alignment: .leading, spacing: Spacing.xs) {
                                Text("Coding with AI").font(TextStyle.heading)
                                Text("Bruce, Stockholm")
                                    .font(TextStyle.caption)
                                    .foregroundStyle(Palette.inkMuted)
                                HStack(spacing: Spacing.s) {
                                    Pill("Workshop")
                                    Pill("Going", tone: .success)
                                }
                                .padding(.top, Spacing.xs)
                            }
                        }
                    }
                }

                section("Avatar") {
                    HStack(spacing: Spacing.m) {
                        Avatar(name: "Alma Ek")
                        Avatar(name: "Nour Hassan")
                        Avatar(name: "Vera Lindqvist")
                        Avatar(name: "Iris Bergström", size: 32)
                    }
                }

                section("Buttons") {
                    VStack(alignment: .leading, spacing: Spacing.m) {
                        Button("Primär knapp") {}.buttonStyle(.primary)
                        Button("Sekundär knapp") {}.buttonStyle(.secondary)
                        Button(invited ? "Invited" : "Invite") { invited.toggle() }
                            .buttonStyle(.compact(isDone: invited))
                    }
                }

                section("Pill") {
                    HStack { Pill("Workshop"); Pill("Going", tone: .success); Pill("Online", tone: .neutral) }
                }

                section("EmptyStateView") {
                    Card {
                        EmptyStateView(
                            icon: "sparkles",
                            title: "This tab is yours",
                            message: "Build something that is not in the instructions."
                        )
                    }
                }

                section("Colours") {
                    HStack(spacing: Spacing.s) {
                        swatch(Palette.background, "background")
                        swatch(Palette.surface, "surface")
                        swatch(Palette.accent, "accent")
                        swatch(Palette.accentSoft, "accentSoft")
                        swatch(Palette.success, "success")
                    }
                }
            }
            .padding(Spacing.l)
        }
        .screenBackground()
    }

    private func section<Content: View>(
        _ title: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: Spacing.m) {
            Text(title)
                .font(TextStyle.caption.weight(.semibold))
                .foregroundStyle(Palette.inkMuted)
            content()
        }
    }

    private func swatch(_ color: Color, _ name: String) -> some View {
        VStack(spacing: Spacing.xs) {
            RoundedRectangle(cornerRadius: Radius.small)
                .fill(color)
                .frame(height: 44)
                .overlay(
                    RoundedRectangle(cornerRadius: Radius.small)
                        .stroke(Palette.border, lineWidth: 1)
                )
            Text(name).font(.system(size: 9)).foregroundStyle(Palette.inkMuted)
        }
    }
}

#Preview {
    Gallery()
}
