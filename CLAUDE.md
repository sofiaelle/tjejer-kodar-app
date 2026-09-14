# Tjejer kodar

An iOS app for the Tjejer kodar community, built in SwiftUI during a workshop
about coding with AI. The app has three tabs: upcoming events, community, and
a third tab whose contents the participant decides.

The person you are helping may be completely new to Swift. Explain what you
are doing briefly and without jargon.

Write everything in English: code comments, and all text the user sees in
the app.

## Always build before you say you are done

```bash
./build.sh
```

The script prints the compiler errors. **Run it after every change** and keep
fixing until it says `** BUILD SUCCEEDED **`. Never say something is finished
without having run it.

## Use the design system, do not invent colours and measurements

Everything visual lives in `TjejerKodar/DesignSystem/`. Read `Tokens.swift`
and `Components.swift` before you build any new interface.

- Colours: `Palette.background`, `.surface`, `.ink`, `.inkMuted`, `.accent`,
  `.accentSoft`, `.border`, `.success`, `.successSoft`
- Spacing: `Spacing.xs` through `Spacing.xxl`, **never** hardcoded numbers
- Corners: `Radius.small` / `.medium` / `.large`
- Text: `TextStyle.title` / `.heading` / `.body` / `.caption`
- Components: `Card`, `Pill`, `DateBadge`, `Avatar`, `EmptyStateView`,
  `ScreenHeader`, the button styles `.primary` / `.secondary` /
  `.compact(isDone:)`, and `.screenBackground()`

So `.foregroundStyle(Palette.ink)`, not `.foregroundStyle(.black)`.
And `.padding(Spacing.l)`, not `.padding(16)`.

`Gallery.swift` shows every component. It is not part of the app. Only change
it if you add a new component, and then add that component to the gallery too.

## How the code is organised

```
TjejerKodar/
├── TjejerKodarApp.swift       app entry point
├── RootView.swift             the three tabs
├── Views/
│   ├── EventsView.swift       tab 1, already built
│   ├── CommunityView.swift    tab 2, empty on purpose
│   └── IdeaView.swift         tab 3, the participant's own
├── Model/
│   ├── Event.swift            events plus sample data
│   └── Member.swift           people plus sample data
└── DesignSystem/              colours, measurements, components
```

`EventsView.swift` is built as a reference. When the participant builds the
community tab, point at it and show how the same pattern can be reused.

New screens go in `Views/`. New data types in `Model/`.

The project uses a synchronised folder, so new `.swift` files are picked up by
the build automatically. You do **not** need to edit `project.pbxproj`. Do not
do it, it breaks easily.

## How to work

- **One step at a time.** Do one thing, build, say what you did. Wait for the
  next instruction. Do not build three tabs at once.
- **Read before you write.** Open the files you are about to change first.
- **Only do what you were asked.** No extra "while I was in here anyway" code,
  no new dependencies, no outside libraries.
- **Do not touch tabs the participant did not ask about.** If you are working
  on the community tab, `EventsView` stays untouched.
- **Ask when something is unclear** instead of guessing.
- If you are unsure about a SwiftUI API, say so. Do not invent one that does
  not exist.

## Technical

- SwiftUI, no UIKit, apart from what already exists in `Tokens.swift`
- iOS 18 and up
- `@Observable` for shared state, `@State` for local state
- Apple frameworks only, no third party libraries
- English for all text the user sees
