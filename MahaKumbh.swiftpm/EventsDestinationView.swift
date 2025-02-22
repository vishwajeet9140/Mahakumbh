import SwiftUI

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let date: String
    let location: String
    
    let details: String
    
    let imageName: String
}

struct EventsDestinationView: View {
    @State private var selectedEvent: Event? = nil
    @State private var isAnimating = false
    @State private var titleScale: CGFloat = 0.8
    @State private var cardOpacity = 0.0
    
    
    let events: [Event] = [
        Event(title: "Mahakumbh Mela", date: "2025", location: "Prayagraj",
              details: "The 2025 Mahakumbh in Prayagraj is a rare, sacred gathering, held every 12 years, marking 144 years since the last. This grand spiritual congregation attracts millions of devotees from around the world for a divine experience.",
              imageName: "histo4"),
        Event(title: "Kumbh Mela", date: "2027", location: "Haridwar",
              details: "The next Kumbh will take place in 2027 in Haridwar. It is a major pilgrimage where millions gather to bathe in the Ganges. The event holds deep spiritual significance and follows ancient traditions.",
              imageName: "histo2"),
        Event(title: "Ardh Kumbh Mela", date: "2030", location: "Nashik",
              details: "The Ardh Kumbh Mela happens every 6 years. In 2030, it will be held in Nashik. This sacred gathering offers devotees a chance to participate in religious ceremonies and spiritual practices.",
              imageName: "histo3"),
    ]
    
    var body: some View {
        ZStack {
          
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 230/255, green: 81/255, blue: 0/255).opacity(0.3),
                    Color.orange.opacity(0.2),
                    Color.yellow.opacity(0.2)
                ]),
                startPoint: isAnimating ? .topLeading : .bottomTrailing,
                endPoint: isAnimating ? .bottomTrailing : .topLeading
            )
            .edgesIgnoringSafeArea(.all)
            .animation(.easeInOut(duration: 5).repeatForever(autoreverses: true), value: isAnimating)
            .onAppear { isAnimating = true }
            
            ScrollView {
                VStack(spacing: 30) {
                   
                    VStack(spacing: 15) {
                        Image(systemName: "calendar.circle.fill")
                            .font(.system(size: 44))
                            .foregroundColor(.orange)
                            .scaleEffect(titleScale)
                            .onAppear {
                                withAnimation(
                                    .spring(response: 0.8, dampingFraction: 0.6)
                                ) {
                                    titleScale = 1
                                }
                            }
                        
                        Text("Sacred Events")
                            .font(.system(size: 38, weight: .bold, design: .serif))
                            .foregroundColor(.brown)
                        
                        Text("Upcoming Divine Gatherings")
                            .font(.system(size: 20, design: .serif))
                            .foregroundColor(.secondary)
                            .italic()
                    }
                    .padding(.top, 20)
                    
                   
                    ForEach(Array(events.enumerated()), id: \.element.id) { index, event in
                        EventCard(event: event, isSelected: selectedEvent?.id == event.id)
                            .onTapGesture {
                                withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                                    selectedEvent = selectedEvent?.id == event.id ? nil : event
                                }
                            }
                            .opacity(cardOpacity)
                            .onAppear {
                                withAnimation(.easeIn(duration: 0.6).delay(Double(index) * 0.2)) {
                                    cardOpacity = 1
                                }
                            }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle("Sacred Events", displayMode: .large)
    }
}


struct EventCard: View {
    let event: Event
    let isSelected: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Image(event.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
                .cornerRadius(20)
                .overlay(
                    ZStack {
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .black.opacity(0.6)]),
                            startPoint: .center,
                            endPoint: .bottom
                        )
                        
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    }
                )
                .shadow(color: .black.opacity(0.3), radius: 15)
            
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text(event.title)
                        .font(.system(size: 24, weight: .bold, design: .serif))
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    
                    Image(systemName: isSelected ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                        .foregroundColor(.orange)
                        .imageScale(.large)
                        .rotationEffect(.degrees(isSelected ? 0 : 180))
                        .animation(.spring(), value: isSelected)
                }
                
                HStack(spacing: 20) {
                    Label(event.date, systemImage: "calendar")
                        .foregroundColor(.orange)
                    Label(event.location, systemImage: "mappin.circle.fill")
                        .foregroundColor(.orange)
                }
                .font(.subheadline)
                
                if isSelected {
                    Text(event.details)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.top, 8)
                        .transition(.opacity.combined(with: .slide))
                }
                
              
                if !isSelected {
                    Text("Tap to see details")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .italic()
                        .padding(.top, 4)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.brown.opacity(0.2))
                .shadow(color: .orange.opacity(0.2), radius: 15, x: 0, y: 8)
        )
        .scaleEffect(isSelected ? 1.02 : 1.0)
        
        
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isSelected)
    }
}

