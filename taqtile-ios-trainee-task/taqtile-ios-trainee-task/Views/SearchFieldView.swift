//
//  SearchFieldView.swift
//  taqtile-ios-trainee-task
//
//  Created by Наталья Мазур on 26.07.24.
//

import SwiftUI

struct SearchFieldView: View {
    @Binding var searchText: String
    @ObservedObject var imageVM: ImageViewModel
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                    .foregroundStyle(.gray)
                TextField("Поиск", text: $searchText)
                    .padding()
                    .environment(\.colorScheme, .light)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
            Spacer()
            Button {
                imageVM.fetchImages(searchText: searchText)
            } label: {
                Text("Поиск")
                    .foregroundStyle(.white)
                    .padding()
            }
            .background(.blue)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
        }
        .padding()
        .background(Color(.systemGray5))
    }
}

#Preview {
    SearchFieldView(searchText: .constant(""), imageVM: ImageViewModel())
}
