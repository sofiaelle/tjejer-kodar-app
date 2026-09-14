import SwiftUI

/// Flik 3 — din egen.
///
/// Den här fliken är avsiktligt helt tom. Det är här du bygger något
/// som inte står i instruktionerna: en profil, en kodstuga, en karta
/// över träffarna, en räknare över hur många gånger du varit med.
/// Vad som helst.
struct IdeaView: View {
    var body: some View {
        VStack(spacing: 0) {
            ScreenHeader("Din idé")

            Spacer()

            EmptyStateView(
                icon: "sparkles",
                title: "Den här fliken är din",
                message: "Bygg något som inte står i instruktionerna. Det är den här alla vill se på demon."
            )

            Spacer()
        }
        .screenBackground()
    }
}

#Preview {
    IdeaView()
}
