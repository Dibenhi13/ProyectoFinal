//
//  BooksView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/13/25.
//

import SwiftUI

struct BooksView: View {
    @State private var books: [Books] = []
    @State private var isLoading = true
    
    var body: some View {
        NavigationView{
            Group{
                if isLoading{
                    ProgressView("Cargando libros...")
                }
                else{
                    List(books) {book in
                        NavigationLink(destination:BookDetailView(book: book)){
                            HStack{
                                AsyncImage(url:URL(string:book.image ?? "")) {image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                }placeholder:{
                                    Color.gray
                                }
                                .frame(width:60, height: 90)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                
                                Text(book.title)
                                    .font(.headline)
                                    .padding(.leading, 10)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Books")
        }
        .onAppear()
    }
}
func fetchBooks() {
       guard let url = URL(string: "https://potterapi-fedeperin.vercel.app/en/books") else { return }
       URLSession.shared.dataTask(with: url) { data, _, error in
           guard let data = data, error == nil else { return }
           do {
               let decoded = try JSONDecoder().decode([Books].self, from: data)
               DispatchQueue.main.async {
                   self.books = decoded
                   self.isLoading = false
               }
           } catch {
               print("Error decoding: \(error)")
           }
       }.resume()
   }
}


#Preview {
    BooksView()
}
