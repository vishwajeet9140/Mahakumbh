import SwiftUI
struct HomeScreen: View {
    @State private var isAnimating = false
    @State private var titleScale: CGFloat = 0.8
    @State private var titleOpacity = 0.0
    @State private var cardOpacity = 0.0
    
    
    @State private var titleRotation: CGFloat = -10
    @State private var circleScale: CGFloat = 0.8
    
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
                    VStack(spacing: 35) {
                       ZStack {
                            
                            Circle()
                                .fill(Color.orange.opacity(0.15))
                                .frame(width: 200, height: 200)
                                .scaleEffect(circleScale)
                                .offset(x: -100, y: -30)
                            
                            Circle()
                                .fill(Color.yellow.opacity(0.15))
                                .frame(width: 150, height: 150)
                                .scaleEffect(circleScale)
                                .offset(x: 80, y: 20)
                            
                            VStack(spacing: 20) {
                            
                                Image(systemName: "sparkles")
                                    .font(.system(size: 40))
                                    .foregroundColor(.orange)
                                    .opacity(0.8)
                                
                                Text("महाकुंभ")
                                    .font(.system(size: 56, weight: .bold, design: .serif))
                                    .foregroundColor(.black)
                                    .shadow(color: .orange.opacity(0.5), radius: 5)
                                    .rotationEffect(.degrees(Double(titleRotation)))
                                
                                Text("MAHAKUMBH")
                                    .font(.system(size: 32, weight: .medium, design: .serif))
                                    .foregroundColor(.black.opacity(0.8))
                                    .tracking(12)
                                    .shadow(color: .orange.opacity(0.3), radius: 3)
                                
                                Text("Sacred Gathering of Faith")
                                    .font(.system(size: 22, design: .serif))
                                    .foregroundColor(.secondary)
                                    .italic()
                                    .padding(.top, 5)
                            }
                        }
                        .scaleEffect(titleScale)
                        .opacity(titleOpacity)
                        .onAppear {
                            withAnimation(.spring(response: 0.8, dampingFraction: 0.6)) {
                                titleScale = 1
                                titleOpacity = 1
                                circleScale = 1
                                titleRotation = 0
                            }
                        }
                        .padding(.top, 60)
                        
                        
                        VStack(spacing: 25) {
                            NavigationLink(destination: HistoryDestinationView()) {
                                HomeCard(
                                    title: "History of Mahakumbh",
                                    description: "Explore the ancient stories and sacred traditions.",
                                    imageName: "book.circle.fill",
                                    index: 0
                                )
                            }
                            
                            NavigationLink(destination: EventsDestinationView()) {
                                HomeCard(
                                    title: "Sacred Events",
                                    description: "Discover upcoming Mahakumbh celebrations.",
                                    imageName: "calendar.circle.fill",
                                    index: 1
                                )
                            }
                            
                            NavigationLink(destination: SpiritualDestinationView()) {
                                HomeCard(
                                    title: "Divine Journey",
                                    description: "Experience the spiritual essence of Mahakumbh.",
                                    imageName: "flame.circle.fill",
                                    index: 2
                                )
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 30)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }


struct HomeCard: View {
    let title: String
    let description: String
    let imageName: String
    let index: Int
    
    
    @State private var opacity = 0.0
    @State private var offset: CGFloat = 50
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: imageName)
                .font(.system(size: 30))
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
                .shadow(color: .white.opacity(0.3), radius: 5)
            
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                
                    .font(.headline)
                    .foregroundColor(.white)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.9))
                    .lineLimit(2)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.white.opacity(0.7))
                .font(.system(size: 14, weight: .bold))
        }
        
        
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
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
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.15), radius: 15, x: 0, y: 5)
        .opacity(opacity)
        .offset(x: offset)
        
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7).delay(Double(index) * 0.2)) {
                opacity = 1
                
                
                offset = 0
            }
        }
    }
}

