# Tjejer kodar – startprojekt

En SwiftUI-app med tre flikar och ett färdigt designsystem. Här börjar du.

## Kom igång

```bash
open TjejerKodar.xcodeproj     # öppna i Xcode, tryck ⌘R för att köra
claude                         # starta Claude Code i samma mapp
```

## De tre flikarna

| Flik | Läge | Vad du gör |
|---|---|---|
| **Kommande** | Byggd | Lista över träffar. Använd den som facit för de andra två. |
| **Community** | Tom | Bygg en lista över personer med en "Bjud in"-knapp. |
| **Din idé** | Tom | Helt öppen. Bygg vad du vill. |

## Vad som redan finns

| Fil | Vad det är |
|---|---|
| `RootView.swift` | De tre flikarna. Behöver sällan ändras. |
| `Views/EventsView.swift` | Flik 1, färdig. Läs den innan du bygger flik 2. |
| `Model/Event.swift` | `Event` plus `Event.examples` med datum som räknas från idag. |
| `Model/Member.swift` | `Member` plus `Member.examples`. |
| `DesignSystem/Tokens.swift` | Färger, avstånd, hörnradier, textstilar. |
| `DesignSystem/Components.swift` | `Card`, `Pill`, `DateBadge`, `Avatar`, `EmptyStateView`, `ScreenHeader`, knappstilar. |
| `DesignSystem/Gallery.swift` | Visar alla komponenter. Öppna filen och tryck på förhandsvisningen till höger. |
| `CLAUDE.md` | Instruktioner till Claude om projektet. |
| `build.sh` | Bygger appen från terminalen och visar felen. |

Designsystemet finns för att du ska slippa fundera på färger och mått – och för
att appen ska se hyfsad ut även när du bygger fort.

## Bygga från terminalen

```bash
./build.sh
```

## Ångra

Projektet är ett git-repo, så du har alltid en väg tillbaka:

```bash
git restore .                        # kasta alla ändringar sedan senaste commit
git add -A && git commit -m "funkar" # spara en ny återställningspunkt
```
