//
//  CommunityCellView.swift
//  GB_VK_SwiftUI
//
//  Created by Vitaliy Talalay on 26.01.2022.
//

import SwiftUI

struct CommunityCellView: View {

// MARK: - Properties
    
    let name: String = "Earn your first million"
    let avatarName: String = "group3"

// MARK: - Body
    
    var body: some View {
        HStack {
            
            AvatarImage {
                Image(avatarName)
            }
            
            Text("\(name)")
                .font(.title2)
            
            Spacer()
        }
//        .border(Color.gray)
    }
}

//MARK: - View Modifiers


// MARK: - Previews

struct CommunityCellView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityCellView()
    }
}

