import SwiftUI

struct HistoryDestinationView: View {
    @State private var selectedQuestion: Int? = nil
    @State private var Currentimage = 0
    
    @State private var isAnimating = false
    @State private var TitleOpacity = 0.0
    
    @State private var cardOpacity = 0.0
    @State private var iconScale = 1.0
    
    
    let imagecards = ["histo4", "histo2", "histo1", "histo3",   "h2",  "h1"]
    
    
    let questionsAndAnswers = [
            ("The Ancient Origins", "The Mahakumbh Mela traces its origins back to the Samudra Manthan, the churning of the ocean in search of Amrit (nectar of immortality). During this event, nectar drops fell on four sacred locations on Earth: Prayagraj, Haridwar, Nashik, and Ujjain. Bathing at these sites during Kumbh Mela is believed to cleanse sins and lead to spiritual liberation."),
            ("Early Historical References", "Hindu scriptures mention ritual bathing near rivers. Early references appear in the Rigveda, and later texts like the Mahabharata and Puranas, which elaborate on the tradition of bathing during auspicious times, marking the early roots of the Kumbh Mela."),
            ("Evolution in Medieval Times", "During the medieval period, the Kumbh Mela grew in prominence, with rulers providing patronage. Akharas (sects of monks) became integral to the event, solidifying the Mela as a grand spiritual gathering."),
            ("The Modern-Day Kumbh Mela", "Today, the Kumbh Mela is one of the largest religious gatherings in the world, attracting millions. Recognized by UNESCO, the Kumbh has become a global event that celebrates faith, spirituality, and culture."),
            ("Key Milestones Through Time", "From its roots in ancient pilgrimages during the reign of King Harshavardhana, institutionalized by Adi Shankaracharya in the 8th century, to its modern evolution post-Independence with government support and global participation, the Kumbh Mela has a rich timeline of growth."),
            ("Kumbh in Different Eras", "Ancient Era: Informal gatherings for bathing and prayer. Medieval Era: Organized with the rise of sects and Akharas. Modern Era: A global religious event with technology and tourism contributing to its scale.")
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
                VStack(spacing: 25) {
                    
                    TimelineView(.animation(minimumInterval: 3)) { timeline in
                        TabView(selection: $Currentimage) {
                            ForEach(0..<imagecards.count, id: \.self) { index in
                                Image(imagecards[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 250)
                                    .clipped()
                                
                                    .cornerRadius(20)
                                    .overlay(
                                        LinearGradient(
                                            gradient: Gradient(colors: [.clear, .black.opacity(0.5)]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    )
                                    .shadow(color: .black.opacity(0.3), radius: 15)
                                    .tag(index)
                            }
                        }
                        .frame(height: 250)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        .onChange(of: timeline.date) { _ in
                            withAnimation {
                                Currentimage = (Currentimage + 1) % imagecards.count
                            }
                        }
                    }
                
                    VStack(spacing: 15) {
                                            Image(systemName: "book.circle.fill")
                                                .font(.system(size: 44))
                                                .foregroundColor(.orange)
                                                .scaleEffect(iconScale)
                        
                                                .onAppear {
                                                    withAnimation(
                                                        .easeInOut(duration: 1)
                                                        .repeatForever(autoreverses: true)
                                                    ) {
                                                        iconScale = 1.2
                                                    }
                                                }
                        
                                        Text("Sacred History")
                                                .font(.system(size: 38, weight: .bold, design: .serif))
                                                .foregroundColor(.brown)
                                            
                                            Text("Through the Ages")
                                                .font(.system(size: 20, design: .serif))
                                                .foregroundColor(.secondary)
                                                .italic()
                                        }
                    
                                        .opacity(TitleOpacity)
                                        .onAppear {
                                            withAnimation(.easeIn(duration: 1)) {
                                                TitleOpacity = 1
                                            }
                                        }

                    
                 
                    ForEach(0..<questionsAndAnswers.count, id: \.self) { index in
                        Historycard(
                            title: questionsAndAnswers[index].0,
                            content: questionsAndAnswers[index].1,
                            isSelected: selectedQuestion == index
                            
                        ) {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                                selectedQuestion = selectedQuestion == index ? nil : index
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
                .padding(.top)
                
            }
            
            
            .navigationBarTitle("Sacred History", displayMode: .large)
        }
    }
}



