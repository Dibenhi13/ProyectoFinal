//
//  PaginaDePerfilUsuario.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import SwiftUI
import PhotosUI

struct PerfilUsuario: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    @State var foto_seleccionada: PhotosPickerItem? = nil
    @State var foto_a_mostrar: UIImage? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            // Foto
            PhotosPicker(selection: $foto_seleccionada){
                Image(uiImage: foto_a_mostrar ?? UIImage(resource: .harryPic))
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 100, height: 100)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                //.foregroundColor(.white)
                    .background(Circle().fill(Color.pink.opacity(0.7)))
            }
            .onChange(of: foto_seleccionada){valor_anterior, valor_nuevo in
                Task{
                    if let foto_seleccionada, let datos = try? await foto_seleccionada.loadTransferable(type: Data.self){
                        if let imagen = UIImage(data: datos){
                            foto_a_mostrar = imagen
                        }
                    }
                }
            }
            .padding(.top, 20)
            
            // Info
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(radius: 5)
                .frame(width: 300, height: 150)
                .overlay(
                    VStack(spacing: 10) {
                        Text(controlador.perfil_a_mostrar?.username ?? "Usuario")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        Text(controlador.perfil_a_mostrar?.name ?? "Nombre completo")
                            .font(.headline)
                            .foregroundColor(.gray)
                        Text(controlador.perfil_a_mostrar?.email ?? "correo@ejemplo.com")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                )
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.pink.opacity(0.2))
        .onDisappear {
            print("Adios, solo sale este mensaje cuando destruimos la vista")
        }
    }
 }
    
 #Preview {
    PerfilUsuario()
        .environment(ControladorAplicacion())
 }
