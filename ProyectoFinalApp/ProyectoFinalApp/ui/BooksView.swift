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
    
    var body: some View {
        NavigationView{
            Group{
                List(controlador.libros) {book in
                    NavigationLink(destination:BookDetailView(book: book)){
                        HStack{
                            AsyncImage(url:URL(string:book.cover ?? "")) {image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
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
}



#Preview {
    BooksView()
}
