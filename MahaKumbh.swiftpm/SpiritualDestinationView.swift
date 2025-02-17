import SwiftUI

struct SpiritualDestinationView: View {
    @State private var selectedQuestion: Int? = nil
    let imageCards = ["spritiual1", "spritiual2", "spritiual3"]
    
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
            // Background gradient with predefined colors
            LinearGradient(
                gradient: Gradient(colors: [Color.orange.opacity(0.2), Color.yellow.opacity(0.3)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 20) {
                    // Scrollable image cards
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(imageCards, id: \.self) { imageName in
                                Image(imageName)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 200)
                                    .clipped()
                                    .cornerRadius(15)
                                    .shadow(radius: 5)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Title
                    Text("Spiritual Significance of Mahakumbh")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    // Collapsible questions
                    ForEach(0..<questionsAndAnswers.count, id: \.self) { index in
                        VStack(alignment: .leading, spacing: 10) {
                            Button(action: {
                                withAnimation {
                                    selectedQuestion = (selectedQuestion == index) ? nil : index
                                }
                            }) {
                                HStack {
                                    Text(questionsAndAnswers[index].0)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    Image(systemName: selectedQuestion == index ? "chevron.up" : "chevron.down")
                                        .foregroundColor(.gray)
                                }
                                .padding(.vertical, 10)
                            }
                            
                            // Display the answer if the question is selected
                            if selectedQuestion == index {
                                Text(questionsAndAnswers[index].1)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                    .padding(.bottom, 10)
                            }
                        }
                        .padding(.horizontal)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(10)
                        .padding(.vertical, 5)
                    }
                    
                    Spacer()
                }
                .padding(.top)
            }
            .navigationTitle("Spiritual Significance")
        }
    }
    
    struct SpiritualSourceDetailView_Previews: PreviewProvider {
        static var previews: some View {
            SpiritualDestinationView()
        }
    }
    
}
