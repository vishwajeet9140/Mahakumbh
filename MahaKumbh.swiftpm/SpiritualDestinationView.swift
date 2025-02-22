import SwiftUI

struct SpiritualDestinationView: View {
    @State private var selectedQuestion: Int? = nil
       @State private var currentImageIndex = 0
       @State private var isAnimating = false
       @State private var titleOpacity = 0.0
       @State private var cardOpacity = 0.0
       @State private var iconScale = 1.0
       

    
    let imageCards = ["spritiual1", "spritiual2", "spritiual3"]
    // Your questionsAndAnswers array remains the same
    let questionsAndAnswers = [
            ("Why do so many people gather at the Mahakumbh Mela?", "Millions of people attend the Mahakumbh Mela because it is considered the most spiritually significant gathering in Hinduism. According to Hindu mythology, it is believed that the holy rivers, especially the Ganges, have the power to cleanse individuals of their sins, offering them a chance for spiritual purification. The gathering also allows people to receive blessings from saints and gurus, making it an auspicious event for all who participate."),
            ("What makes bathing in the Ganges during Mahakumbh so special?", "Bathing in the Ganges during Mahakumbh is believed to wash away one's sins and purify the soul. This belief is deeply rooted in Hindu mythology, which says that the gods spilled drops of nectar of immortality (Amrit) into the river, making the waters sacred. Bathing at this time, when specific celestial alignments occur, is believed to enhance the spiritual benefits and lead to salvation (moksha)."),
            ("Why is the Mahakumbh Mela held only every 12 years?", "The Mahakumbh Mela is held every 12 years because it follows a specific astrological alignment that is considered highly auspicious in Hinduism. The event takes place when the planets Jupiter, Sun, and Moon align in a way that enhances the spiritual energy of the gathering."),
            ("Is the Mahakumbh Mela just for religious people?", "While the Mahakumbh Mela is deeply rooted in religious and spiritual beliefs, it is not limited to devout practitioners. People from all walks of life, including those seeking cultural, spiritual, or intellectual experiences, attend the Mahakumbh."),
            ("What do people gain from attending Mahakumbh Mela?", "Attending the Mahakumbh Mela is believed to bring spiritual benefits such as the purification of sins, peace of mind, and blessings from saints and holy men."),
            ("Why is Mahakumbh Mela considered so sacred compared to other festivals?", "The Mahakumbh Mela is considered sacred because it is based on an ancient myth about the churning of the ocean (Samudra Manthan) for nectar of immortality."),
            ("Can attending the Mahakumbh Mela change someone’s destiny?", "In Hindu belief, attending the Mahakumbh Mela and taking a dip in the holy rivers can indeed change one’s destiny by purifying the soul and breaking the cycle of rebirth (samsara)."),
            ("Why do so many saints and sadhus come to the Mahakumbh Mela?", "Saints, sadhus, and spiritual gurus gather at the Mahakumbh Mela because it is seen as the most sacred time and place for spiritual practice."),
            ("Is attending Mahakumbh Mela considered a once-in-a-lifetime experience?", "Yes, for many Hindus, attending the Mahakumbh Mela is considered a once-in-a-lifetime spiritual pilgrimage."),
            ("Can non-Hindus attend the Mahakumbh Mela?", "Absolutely, the Mahakumbh Mela is open to everyone, regardless of their religion or background.")
        ]
    
    var body: some View {
            ZStack {
                // Enhanced animated background gradient
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
                        // Enhanced image carousel with TimelineView
                        TimelineView(.animation(minimumInterval: 3)) { timeline in
                            TabView(selection: $currentImageIndex) {
                                ForEach(0..<imageCards.count, id: \.self) { index in
                                    Image(imageCards[index])
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
                                    currentImageIndex = (currentImageIndex + 1) % imageCards.count
                                }
                            }
                        }
                        
                        // Enhanced title section with animations
                        VStack(spacing: 15) {
                            Text("🕉")
                                .font(.system(size: 40))
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
                            
                            Text("Spiritual Journey")
                                .font(.system(size: 38, weight: .bold, design: .serif))
                                .foregroundColor(.brown)
                            
                            Text("Divine Wisdom & Enlightenment")
                                .font(.system(size: 20, design: .serif))
                                .foregroundColor(.secondary)
                                .italic()
                        }
                        .opacity(titleOpacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1)) {
                                titleOpacity = 1
                            }
                        }
                        
                        // Enhanced spiritual cards
                        ForEach(0..<questionsAndAnswers.count, id: \.self) { index in
                            SpiritualCard(
                                question: questionsAndAnswers[index].0,
                                answer: questionsAndAnswers[index].1,
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
                .navigationBarTitle("Sacred Journey", displayMode: .large)
            }
        }
    }


// Enhanced card component for spiritual questions
struct SpiritualCard: View {
    let question: String
    let answer: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button(action: action) {
                HStack {
                    Text(question)
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
                Text(answer)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.bottom, 10)
                    .transition(.opacity.combined(with: .slide))
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

// Preview remains the same

