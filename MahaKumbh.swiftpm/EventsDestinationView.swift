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
        Event(title: "Mahakumbh Mela", date: "2025", location: "Prayagraj", details: "The 2025 Mahakumbh in Prayagraj is a rare spiritual gathering, occurring every 12 years,with this one marking 144 years since the last."),
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
                    
                    // Loop through events and display each event with uniform card size
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
                                .lineLimit(3) // Limit details to 3 lines for uniformity
                                .truncationMode(.tail) // Show "..." if text is truncated
                        }
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 150) // Uniform card size
                        .background(Color.brown.opacity(0.3))
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    }
                }
                .padding()
            }
            .navigationTitle("Events")
        }
    }
}

struct EventsDetailSourceView_Previews: PreviewProvider {
    static var previews: some View {
        EventsDestinationView()
    }
}

