import SwiftUI

struct WelcomeScreen: View {
    // Your state properties
    @State private var titleOffset: CGFloat = -50
    @State private var buttonScale: CGFloat = 0.1
    @State private var overlayOpacity: Double = 0
    @State private var isAnimating = false
    
    var body: some View {
        NavigationView {
            ZStack {
                // Sacred background with gradient overlay
                Image("mahakumbh")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.black.opacity(0.3),
                                Color.orange.opacity(0.2),
                                Color.black.opacity(0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                
                VStack(spacing: 30) {
                    Spacer()
                    
                    // Title stack with enhanced typography
                    VStack(spacing: 20) {
                        Text("महाक\u{941}\u{902}भ")
                            .font(.system(size: 64, weight: .bold))
                            .foregroundColor(.white)
                            .shadow(color: .orange.opacity(0.8), radius: 15)
                            .offset(y: titleOffset)
                        
                        Text("MAHAKUMBH")
                            .font(.system(size: 28, weight: .medium))
                            .foregroundColor(.white.opacity(0.9))
                            .tracking(12)
                            .shadow(color: .black.opacity(0.5), radius: 8)
                            .offset(y: titleOffset)
                    }
                    .onAppear {
                        withAnimation(.spring(response: 1, dampingFraction: 0.7)) {
                            titleOffset = 0
                        }
                    }
                    
                    // Subtitle with fade-in
                    Text("A Divine Convergence of Faith")
                        .font(.system(size: 20, design: .serif))
                        .foregroundColor(.white.opacity(0.8))
                        .italic()
                        .opacity(overlayOpacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1).delay(0.5)) {
                                overlayOpacity = 1
                            }
                        }
                    
                    Spacer()
                    
                    // Enhanced journey button
                    NavigationLink(destination: HomeScreen()) {
                        HStack(spacing: 15) {
                            Image(systemName: "sparkles")
                                .font(.title2)
                            
                            Text("Begin Sacred Journey")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 35)
                        .padding(.vertical, 18)
                        .background(
                            ZStack {
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(red: 230/255, green: 81/255, blue: 0/255),
                                        Color(red: 230/255, green: 81/255, blue: 0/255).opacity(0.8)
                                    ]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                                
                                // Button glow effect
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                                    .blur(radius: 1)
                            }
                        )
                        .clipShape(Capsule())
                        .shadow(color: .orange.opacity(0.3), radius: 20, x: 0, y: 10)
                        .scaleEffect(buttonScale)
                        .onAppear {
                            withAnimation(.spring(response: 0.8, dampingFraction: 0.6).delay(1)) {
                                buttonScale = 1
                            }
                        }
                    }
                    .padding(.bottom, 60)
                }
            }
        }
    }
}

// End of file
