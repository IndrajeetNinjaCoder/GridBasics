//
//  ContentView.swift
//  GridBasics
//
//  Created by test on 31/01/25.
//

import SwiftUI

struct ContentView: View {
    
//    let colorArray: [Color] = [.red, .blue, .green, .yellow, .orange, .purple, .pink, .black, .mint, .gray, .brown, .cyan, .accentColor, .primary, .secondary, .indigo
//    ]
    
    
    // It will automatically display the required number of cells in each row
    let column1: [GridItem] = [GridItem(.adaptive(minimum: 100))]
    //minimum: 100 -> here 100 referse to the points
    /*
     Point :- Point is a independent unit of measurement of display size
     Pixel :- Pixel is dependend unit of measurement of display, different display can have different number of pixels
        like -> a high resolution display contains more mixels
     
     */
    
    // It will display all the cells in each row by adjusting the width of each cell
    let column2: [GridItem] = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    // It will not adjust the size of cell less then minimum or more then maximum
    // In this case it will overflow cells
    
    let column3: [GridItem] = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100))
                 ]
    
    // Flow layout :- SwiftUI don't have inbuilt Flow Layout and to achieve it, SwiftUI LazyVGrid is used as Flow Layout
    
    var body: some View {
        ScrollView {
            
            
            Text("Adaptive Grid")
                .font(.title)
            LazyVGrid(columns: column1, spacing: 10) {
                ForEach(0...10, id: \.self){ index in
                    MyColorView()
                    
                }
            }
            .padding()
            
            
            Text("Normal Grid")
                .font(.title)
            LazyVGrid(columns: column2, spacing: 10) {
                ForEach(0...10, id: \.self){ index in
                    MyColorView()
                }
            }
            .padding()
            
            /*
            Text("Flexible Grid")
                .font(.title)
            LazyVGrid(columns: column3, spacing: 10) {
                ForEach(0...10, id: \.self){ index in
                    MyColorView()
                    
                }
            }
            .padding()
             */
            
        }
    }
    
    func MyColorView() -> some View {
//        color
//            .frame(height: 100)
//            .cornerRadius(10)
//            .shadow(color: .black.opacity(0.5), radius: 3, x: 5, y: 5)
        
        AsyncImage(url: URL(string:  "https://picsum.photos/100")) { response in
            
            switch response {
            case.success(let image):
                image
                    .resizable()
//                    .scaledToFit()
                    .frame(height: 100)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 5, x: 5, y: 5)
                
            default:
                Text("Loading...")
                    .frame(height: 100)
            }
            
            
        }
        
    }
    
}

#Preview {
    ContentView()
}
