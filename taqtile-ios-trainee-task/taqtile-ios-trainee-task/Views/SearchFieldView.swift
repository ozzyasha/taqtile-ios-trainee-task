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
    @FocusState private var searchTextIsFocused: Bool
    @State private var errorText = ""
    
    var body: some View {
        VStack {
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
                        .focused($searchTextIsFocused)
                        .onSubmit {
                            guard !searchText.isEmpty else {
                                errorText = String(localized: "Search field should not be empty")
                                return
                            }
                            searchTextIsFocused = false
                            imageVM.fetchImages(searchText: searchText)
                        }
                        .onChange(of: searchText) {
                            if !searchText.isEmpty {
                                errorText = ""
                            }
                        }
                    
                    if !searchText.isEmpty {
                        Button {
                            searchText = ""
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundStyle(.gray)
                                .padding(.trailing)
                        }
                    }
                }
                .background(.white)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
                Spacer()
                Button {
                    guard !searchText.isEmpty else {
                        errorText = String(localized: "Search field should not be empty")
                        return
                    }
                    searchTextIsFocused = false
                    imageVM.fetchImages(searchText: searchText)
                } label: {
                    Text("Поиск")
                        .foregroundStyle(.white)
                        .padding()
                }
                .background(.blue)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 15, height: 15)))
            }
            HStack {
                Text(errorText)
                    .foregroundStyle(.red)
                Spacer()
            }
        }
        .padding()
        .background(Color(.systemGray5))
    }
}

#Preview {
    SearchFieldView(searchText: .constant(""), imageVM: ImageViewModel())
}
