//
//  SettingsView.swift
//  Hike
//
//  Created by Admin on 2023-07-28.
//

import SwiftUI

struct SettingsView: View {
    // MARK: PROPERTIES
    private let alternateAppIcons:[String] = ["AppIcon-MagnifyingGlass","AppIcon-Map","AppIcon-Campfire", "AppIcon-Mushroom","AppIcon-Backpack", "AppIcon-Camera"]
    var body: some View {
        List{
            Section{
                HStack{
                    Spacer()
                    // MARK: SECTION: HEADER
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight:.black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editors' Choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight:.black))
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top,8)
                
                VStack(spacing:10){
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks amazing in photos but is even better once you are there. The hike that you hope to do again someday. \nFind the best day hikes in the app")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! IT;s time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom,20)
                .frame(maxWidth:.infinity)
            }
            .listRowSeparator(.hidden)
            
            //MARK: SECTION: ICONS
            Section(
                header:Text("ALTERNATE ICONS")
            ){
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:13){
                        ForEach(alternateAppIcons.indices, id:\.self){
                            item in
                            Button{
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){
                                    error in
                                    if error != nil{
                                        print("Failed request to update icon")
                                    }
                                    else{
                                        print("Icon change successful")
                                    }
                                }
            
                            }label:{
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(20)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
                .padding(.top,12)
                
                Text("Choose your favorite app icon from the options above")
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 10)
            }
            .listRowSeparator(.hidden)
            
            // MARK: SECTION: ABOUT
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyright @ All rights reserved")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ){

                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS,iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Shriman.V", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo, rowLinkLabel: "Credo Academy", rowLinkDestination: "https://credo.academy")
            }
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
