//
//  ContainerView.swift
//  MoveList
//
//  Created by Alex Brown on 24/06/2020.
//

import SwiftUI

struct ContainerView: View {
    var body: some View {
        NavigationView {
            SidebarView()
            MoviesView()
        }
    }
}

struct ContainerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContainerView()
                .previewDevice("iPad Pro (11-inch) (2nd generation)")
            ContainerView()
        }
    }
}
