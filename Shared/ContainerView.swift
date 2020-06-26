//
//  ContainerView.swift
//  MoveList
//
//  Created by Alex Brown on 24/06/2020.
//

import SwiftUI

struct ContainerView: View {
    var action: () -> Void = {
        print("action")
    }
    
    var body: some View {
        NavigationView {
            SidebarView()
//                .navigationBarItems(trailing: Button(action: {
//                    // Default button action
//                }, label: {
//                    Image(systemName: "plus.circle")
//                })
//                .contextMenu(
//                    ContextMenu(menuItems: {
//                        Button("Add Favorite", action: {})
//                        Button("Add to Watch List", action: {})
//                        Button("Add Collection", action: {})
//                    })
//                ))
            MoviesView()
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContainerView()
                .preferredColorScheme(.dark)
                .previewDevice("iPad Pro (11-inch) (2nd generation)")
            ContainerView()
        }
    }
}
