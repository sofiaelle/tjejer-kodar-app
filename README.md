# Tjejer kodar, starter project

A SwiftUI app with three tabs and a ready made design system. This is where
you begin.

## Getting started

```bash
open TjejerKodar.xcodeproj     # open in Xcode, press ⌘R to run
claude                         # start Claude Code in the same folder
```

## The three tabs

| Tab | State | What you do |
|---|---|---|
| **Upcoming** | Built | List of events. Use it as your reference for the other two. |
| **Community** | Empty | Build a list of people with an invite button. |
| **Your idea** | Empty | Wide open. Build whatever you like. |

## What is already here

| File | What it is |
|---|---|
| `RootView.swift` | The three tabs. Rarely needs changing. |
| `Views/EventsView.swift` | Tab 1, finished. Read it before you build tab 2. |
| `Model/Event.swift` | `Event` plus `Event.examples`, with dates calculated from today. |
| `Model/Member.swift` | `Member` plus `Member.examples`. |
| `DesignSystem/Tokens.swift` | Colours, spacing, corner radii, text styles. |
| `DesignSystem/Components.swift` | `Card`, `Pill`, `DateBadge`, `Avatar`, `EmptyStateView`, `ScreenHeader`, button styles. |
| `DesignSystem/Gallery.swift` | Shows every component. Open the file and press the preview on the right. |
| `CLAUDE.md` | Instructions to Claude about this project. |
| `build.sh` | Builds the app from the terminal and shows the errors. |

The design system exists so you do not have to think about colours and
measurements, and so the app looks decent even when you build fast.

## Building from the terminal

```bash
./build.sh
```

## Undo

The project is a git repo, so you always have a way back:

```bash
git restore .                        # discard all changes since the last commit
git add -A && git commit -m "works"  # save a new restore point
```
