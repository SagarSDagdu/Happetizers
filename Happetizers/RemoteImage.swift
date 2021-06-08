//
//  RemoteImage.swift
//  Happetizers
//
//  Created by Sagar Dagdu on 08/06/21.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image?
    
    func loadImage(from urlString: String) {
        NetworkManager.shared.getImage(from: urlString) { [weak self] uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self?.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerImageView: View {
    @StateObject var imageLoader = ImageLoader()
    
    @State var remoteImage: RemoteImage?
    @State var url: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image).onAppear() {
            imageLoader.loadImage(from: url)
        }
    }
}
