import SwiftUI

struct Event {
    let title: String
    let date: String
    let location: String
    let details: String
}

struct EventsDestinationView: View {
    
    // Array of future Mahakumbh and Kumbh events
    let events: [Event] = [
        Event(title: "Mahakumbh Mela", date: "2025", location: "Prayagraj", details: "The next Mahakumbh will be held in 2025 at Prayagraj, marking the largest spiritual gathering in the world, which takes place every 12 years. Significantly, this Mahakumbh is also special as it is happening 144 years after the previous one, making it a rare and momentous occasion."),
        Event(title: "Kumbh Mela", date: "2027", location: "Haridwar", details: "The next Kumbh will take place in 2027 in Haridwar. It is a major pilgrimage where millions gather to bathe in the Ganges."),
        Event(title: "Ardh Kumbh Mela", date: "2030", location: "Nashik", details: "The Ardh Kumbh Mela happens every 6 years. In 2030, it will be held in Nashik."),
    ]
    
    var body: some View {
        ZStack {
            // Background gradient with predefined colors
            LinearGradient(
                gradient: Gradient(colors: [Color.orange.opacity(0.2), Color.yellow.opacity(0.3)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Upcoming Mahakumbh & Kumbh Events")
                        .font(.title)
                        .padding(.bottom, 10)
                    
                    // Loop through events and display each event with dynamic card size
                    ForEach(events, id: \.title) { event in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(event.title)
                                .font(.headline)
                            Text("Date: \(event.date)")
                                .font(.subheadline)
                            Text("Location: \(event.location)")
                                .font(.subheadline)
                            Text(event.details)
                                .font(.body)
                                .fixedSize(horizontal: false, vertical: true) // Let text expand vertically
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
                .padding()
            }
            .navigationTitle("Events")
        }
    }
    
    struct EventsDetailSourceView_Previews: PreviewProvider {
        static var previews: some View {
            EventsDestinationView()
        }
    }
}

