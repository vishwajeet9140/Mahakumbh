import SwiftUI
struct WelcomeScreen: View {
    //@State private var navigateToHome = false

    var body: some View {
        NavigationView {
            ZStack {
                // Background Image (holy theme)
                Image("mahakumbh") // Make sure the image is in the assets folder with the correct name
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                // Content
                VStack {
                    Spacer()
// Button to navigate to the Home Screen
                    NavigationLink(destination: HomeScreen()) {
                        Text("Enter the Sacred Journey")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 230/255, green: 81/255, blue: 0/255)) // Deep Orange
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding(.bottom, 30)
                    }
                }
                .padding()
            }
        }
    }
}

