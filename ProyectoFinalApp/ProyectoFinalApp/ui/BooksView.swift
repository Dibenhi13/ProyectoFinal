//
//  BooksView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/13/25.
//

import Foundation
import SwiftUI

struct BooksView: View {
    @EnvironmentObject var controlador: ControladorApp
    @EnvironmentObject var themeManager: AppThemeManager
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(controlador.libros) { book in
                        NavigationLink(destination: BookDetailView(book: book)) {
                            HStack(spacing: 16) {
                                AsyncImage(url:URL(string:book.cover ?? "")) {image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }placeholder:{
                                    Color.gray
                                }
                                Text(book.title ?? "Unknown")
                                    .padding(.leading, 10)
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(themeManager.primaryColor.opacity(0.6))
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                    }
                    .padding(.horizontal)
                }
                .padding(.top)

            }
            .background(themeManager.secondaryColor.ignoresSafeArea())
            .navigationTitle("Books")

        }
    }
    
}


#Preview {
    BooksView()
}

