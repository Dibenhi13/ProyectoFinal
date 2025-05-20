//
//  BookDetailView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/13/25.
//

import Foundation
import SwiftUI

struct BookDetailView: View {
    @EnvironmentObject var themeManager : AppThemeManager
    let book: Books
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                AsyncImage(url: URL(string: book.cover ?? "Image didnt load")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 280, height:450)
                        .cornerRadius(20)
                        .clipped()
                } placeholder: {
                    Color.gray.opacity(0.3)
                        .frame(height:280)
                        .cornerRadius(20)
                }
            }
            
            VStack(alignment: .leading, spacing: 12){
                Text(book.title ?? "Unknown")
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                Divider().background(.white.opacity(0.3))
                
                infoRow("Release Date", book.release_date)
                infoRow("Pages", book.pages)
                infoRow("Dedication", book.dedication)
                
                if let summary = book.summary {
                    Divider().background(.white.opacity(0.3))
                    Text("Summary")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(summary)
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.85))
                }
            }
                    .padding()
                    .background(themeManager.primaryColor)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .shadow(radius: 5)
            } .padding(.bottom)
            .background(themeManager.secondaryColor.ignoresSafeArea())
            .navigationTitle("Book Details")
        }
    }
    
func infoRow(_ title: String, _ value: String?) -> some View {
    HStack(alignment: .top) {
        Text(title + ":")
            .foregroundColor(.white)
            .fontWeight(.semibold)
        Spacer()
        Text(value ?? "Unknown")
            .foregroundColor(.white.opacity(0.9))
            .multilineTextAlignment(.trailing)
    }
    .font(.subheadline)
}

