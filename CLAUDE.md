# Tjejer kodar

En iOS-app för communityt Tjejer kodar, byggd i SwiftUI under en workshop om
att koda med AI. Appen har tre flikar: kommande träffar, community, och en
tredje flik som deltagaren själv bestämmer innehållet i.

Personen du hjälper är kanske helt ny på Swift – förklara vad du gör på
svenska, kort och utan jargong.

## Bygg alltid innan du säger att du är klar

```bash
./build.sh
```

Skriptet skriver ut kompileringsfelen. **Kör det efter varje ändring** och
fortsätt laga tills det står `** BUILD SUCCEEDED **`. Säg aldrig att något är
klart utan att ha kört det.

## Använd designsystemet – hitta inte på egna färger och mått

Allt som rör utseende finns i `TjejerKodar/DesignSystem/`. Läs `Tokens.swift`
och `Components.swift` innan du bygger något nytt gränssnitt.

- Färger: `Palette.background`, `.surface`, `.ink`, `.inkMuted`, `.accent`,
  `.accentSoft`, `.border`, `.success`, `.successSoft`
- Avstånd: `Spacing.xs` … `Spacing.xxl` – **aldrig** hårdkodade siffror
- Hörn: `Radius.small` / `.medium` / `.large`
- Text: `TextStyle.title` / `.heading` / `.body` / `.caption`
- Komponenter: `Card`, `Pill`, `DateBadge`, `Avatar`, `EmptyStateView`,
  `ScreenHeader`, knappstilarna `.primary` / `.secondary` / `.compact(isDone:)`,
  och `.screenBackground()`

Alltså `.foregroundStyle(Palette.ink)`, inte `.foregroundStyle(.black)`.
Och `.padding(Spacing.l)`, inte `.padding(16)`.

`Gallery.swift` visar alla komponenter. Den ingår inte i appen – ändra den bara
om du lägger till en ny komponent, och lägg då till den i galleriet också.

## Så här är koden organiserad

```
TjejerKodar/
├── TjejerKodarApp.swift       ← appens startpunkt
├── RootView.swift             ← de tre flikarna
├── Views/
│   ├── EventsView.swift       ← flik 1, redan byggd
│   ├── CommunityView.swift    ← flik 2, tom med flit
│   └── IdeaView.swift         ← flik 3, deltagarens egen
├── Model/
│   ├── Event.swift            ← träffar + exempeldata
│   └── Member.swift           ← personer + exempeldata
└── DesignSystem/              ← färger, mått, komponenter
```

`EventsView.swift` är byggd som referens. När deltagaren ska bygga
community-fliken: peka på den och visa hur samma mönster kan återanvändas.

Nya skärmar läggs i `Views/`. Nya datatyper i `Model/`.

Projektet använder en synkroniserad mapp, så nya `.swift`-filer kommer med i
bygget automatiskt. Du behöver **inte** redigera `project.pbxproj` – gör det
inte, det går sönder lätt.

## Hur du ska jobba

- **Ett steg i taget.** Gör en sak, bygg, berätta vad du gjorde. Vänta på nästa
  instruktion. Bygg inte tre flikar på en gång.
- **Läs innan du skriver.** Öppna filerna du ska ändra i först.
- **Gör bara det du blev ombedd.** Ingen extra "medan jag var här ändå"-kod,
  inga nya beroenden, inga bibliotek utifrån.
- **Rör inte flikar deltagaren inte bett om.** Håller vi på med community-fliken
  ska `EventsView` vara orörd.
- **Fråga när något är otydligt** i stället för att gissa.
- Om du är osäker på ett SwiftUI-API: säg det, gissa inte fram ett som inte finns.

## Teknik

- SwiftUI, inget UIKit (utom det som redan finns i `Tokens.swift`)
- iOS 18 och uppåt
- `@Observable` för delad state, `@State` för lokal
- Bara Apples egna ramverk – inga tredjepartsbibliotek
- Svenska i all text som användaren ser
