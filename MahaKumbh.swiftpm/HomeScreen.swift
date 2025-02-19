import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {
            // Background gradient remains the same
            LinearGradient(
                gradient: Gradient(colors: [Color.orange.opacity(0.3), Color.yellow.opacity(0.2)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                // Enhanced title section
                VStack(spacing: 8) {
                    Text("महाकुंभ")
                        .font(.system(size: 42, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
                    
                    Text("MAHAKUMBH")
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .foregroundColor(.black.opacity(0.7))
                        .tracking(4) // Letter spacing
                }
                .padding(.top, 50)
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 2)
                
                // Subtitle
                Text("Sacred Gathering of Faith")
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .foregroundColor(.black.opacity(0.6))
                    .italic()
                
                // Grid-based layout for key information
                VStack(spacing: 20) {
                    NavigationLink(destination: HistoryDestinationView()) {
                        infoCard(title: "History of Mahakumbh", description: "Discover the ancient stories behind the sacred gathering.", imageName: "book.fill")
                    }
                    
                    NavigationLink(destination: EventsDestinationView()) {
                        infoCard(title: "Upcoming Events", description: "Get details about the upcoming Mahakumbh events.", imageName: "calendar.circle.fill")
                    }
                    
                    NavigationLink(destination: SpiritualDestinationView()) {
                        infoCard(title: "Spiritual Significance", description: "Learn about the spiritual importance of Mahakumbh.", imageName: "leaf.fill")
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}
// Helper view for information cards
struct infoCard: View {
    let title: String
    let description: String
    let imageName: String
    
    var body: some View {
        HStack(spacing: 16) {
            // Icon with glass effect background
            Image(systemName: imageName)
                .font(.system(size: 24))
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                Text(description)
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.9))
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.white.opacity(0.7))
                .font(.system(size: 14, weight: .semibold))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 230/255, green: 81/255, blue: 0/255),
                    Color(red: 230/255, green: 81/255, blue: 0/255).opacity(0.8)
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}


// Detail views for each section
struct HistoryDetailSourceView: View {
    var body: some View {
        VStack {
            Text("History of Mahakumbh")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Here you'll find detailed history of the Mahakumbh festival, its origins, and significance.")
                .padding()
            Spacer()
        }
        .navigationTitle("History")
        .padding()
    }
}

struct EventsDetailSourceView : View {
    var body: some View {
        VStack {
            Text(" Events")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Find out about all the major events happening during the Mahakumbh.")
                .padding()
            Spacer()
        }
        .navigationTitle("Events")
        .padding()
    }
}

struct SpiritualSourceDetailView: View {
    var body: some View {
        VStack {
            Text("Spiritual Significance")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Learn about the deep spiritual importance of the Mahakumbh.")
                .padding()
            Spacer()
        }
        .navigationTitle("Spiritual Significance")
        .padding()
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

