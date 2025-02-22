import SwiftUI

struct Historycard: View {
    let title: String
    let content: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button(action: action) {
                HStack {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    Spacer()
                    Image(systemName: isSelected ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                        .foregroundColor(.orange)
                        .imageScale(.large)
                }
                .padding(.vertical, 10)
            }
            
            if isSelected {
                Text(content)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)
                    .transition(.opacity.combined(with: .scale))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.brown.opacity(0.2))
                .shadow(color: .orange.opacity(0.2), radius: 10, x: 0, y: 5)
        )
        .scaleEffect(isSelected ? 1.02 : 1.0)
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}


