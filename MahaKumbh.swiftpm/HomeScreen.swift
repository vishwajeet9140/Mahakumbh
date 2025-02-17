import SwiftUI

struct HomeScreen: View {
    var body: some View {
        
            ZStack {
                // Background color or holy-themed gradient
                LinearGradient(
                    gradient: Gradient(colors: [Color.orange.opacity(0.3), Color.yellow.opacity(0.2)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)

                
                VStack(spacing: 20) {
                    // Header with app name or welcome message
                    
                    
                    // Grid-based layout for key information (history, events, significance)
                    VStack(spacing: 30) {
                        // History Section - clickable
                        NavigationLink(destination: HistoryDestinationView()) {
                            infoCard(title: "History of Mahakumbh", description: "Discover the ancient stories behind the sacred gathering.", imageName: "book") // SF symbol for History
                        }
                        
                        // Upcoming Events Section - clickable
                        NavigationLink(destination: EventsDestinationView()) {
                            infoCard(title: "Upcoming Events", description: "Get details about the upcoming Mahakumbh events.", imageName: "calendar")
                        }
                        
                        // Spiritual Significance Section - clickable
                        NavigationLink(destination: SpiritualDestinationView()) {
                            infoCard(title: "Spiritual Significance", description: "Learn about the spiritual importance of Mahakumbh.", imageName: "leaf") // SF symbol for Spiritual
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
        }
    }


// Helper view for information cards
struct infoCard: View {
    let title: String
    let description: String
    let imageName: String

    var body: some View {
        HStack {
            Image(systemName: imageName) // Replace with custom icon if needed
                .resizable()
                .frame(width: 50, height: 50)
                .padding(.trailing, 10)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            Spacer()
        }
        .padding()
        .background(Color(red: 230/255, green: 81/255, blue: 0/255)) // Deep Orange
        .cornerRadius(15)
        .shadow(radius: 10)
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

