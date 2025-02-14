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
        Event(title: "Mahakumbh Mela", date: "2025", location: "Prayagraj", details: "The next Mahakumbh will be held in 2025 at Prayagraj. It is the largest spiritual gathering, held every 12 years."),
        Event(title: "Kumbh Mela", date: "2027", location: "Haridwar", details: "The next Kumbh will take place in 2027 in Haridwar. It is a major pilgrimage where millions gather to bathe in the Ganges."),
        Event(title: "Ardh Kumbh Mela", date: "2030", location: "Nashik", details: "The Ardh Kumbh Mela happens every 6 years. In 2030, it will be held in Nashik."),
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Upcoming Mahakumbh & Kumbh Events")
                    .font(.title)
                    .padding(.bottom, 10)
                
                // Loop through events and display each event
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
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
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

