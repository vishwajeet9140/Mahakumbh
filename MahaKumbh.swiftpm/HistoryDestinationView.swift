import SwiftUI

struct HistoryDestinationView: View {
    @State private var selectedQuestion: Int? = nil
    let imageCards = ["histo4", "histo2", "histo3","h2","h1"]
    
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
            // Background gradient (same as HomeScreen)
            LinearGradient(
                gradient: Gradient(colors: [Color.orange.opacity(0.3), Color.yellow.opacity(0.2)]),
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
                    Text("History of Mahakumbh")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    // Collapsible questions with images
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
                            
                            // Display the answer and image if the question is selected
                            if selectedQuestion == index {
                                Text(questionsAndAnswers[index].1)
                                    .font(.body)
                                    .foregroundColor(.secondary)
                                    .padding(.bottom, 10)
                                
                                // Add image based on the index (ensure you have enough images in your assets)
                                if index < imageCards.count {
                                    Image(imageCards[index])
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 300, height: 200)
                                        .clipped()
                                        .cornerRadius(15)
                                        .shadow(radius: 5)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .background(Color.brown.opacity(0.3)) // Semi-transparent white


                        .cornerRadius(10)
                        .padding(.vertical, 5)
                    }
                    
                    Spacer()
                }
                .padding(.top)
            }
            .navigationTitle("History")
        }
    }
    
    struct HistoryDetailView_Previews: PreviewProvider {
        static var previews: some View {
            HistoryDestinationView()
        }
    }
    
}
