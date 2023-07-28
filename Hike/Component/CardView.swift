//
//  CardView.swift
//  Hike
//
//  Created by Admin on 2023-07-27.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    @State private var imageNumber:Int = 1
    @State private var randomNumber: Int = 1
    @State private var showSettingsScreen = false
    
    // MARK: - Functions
    
    func randomImage(){
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber

        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView() //Card background
            VStack {
                //MARK: - HEADER
                VStack (alignment: .leading){
                    HStack {
                        // Header title
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size:52))
                        .foregroundStyle(.linearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
                        
                        Spacer()
                        
                        //Hiking button
                        Button{
                            // ACTION: Show a sheet
                            showSettingsScreen.toggle()
                        }label:{
                            CustomButtonView()
                                
                        }.sheet(isPresented: $showSettingsScreen) {
                            SettingsView()
                                .presentationDetents([.medium,.large])
                                // to show the user that the sheet is draggable
                        }
                        
                    }
                    
                    //Sub header
                    Text("Fun and enjoyable outdoor activity for friends and family.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }
                .padding(.horizontal,30)
                
                // MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 2), value: imageNumber)
                }
                // MARK: - FOOTER
                
                Button{
                    randomImage()
                }label:{
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x:1, y:2)
                }
                .buttonStyle(GradientButton())

            }//: VSTACK
        }//: CARD
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
