//
//  PaginaDePerfilUsuario.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//
import SwiftUI
import PhotosUI
// Modelo básico de perfil

struct PerfilUsuario: View {
   @EnvironmentObject var controlador: ControladorApp
    @EnvironmentObject var themeManager: AppThemeManager
    
   @State private var foto_seleccionada: PhotosPickerItem? = nil
   @State private var foto_a_mostrar: UIImage? = nil
    
   var body: some View {
       VStack(spacing: 20) {
           // Foto de perfil
           PhotosPicker(selection: $foto_seleccionada) {
               Image(uiImage: foto_a_mostrar ?? UIImage(named: "harry_pic") ?? UIImage())
                   .resizable()
                   .aspectRatio(contentMode: .fill)
                   .frame(width: 100, height: 100)
                   .clipShape(Circle())
                   .overlay(Circle().stroke(Color.white, lineWidth: 2))
                   .background(Circle().fill(Color.pink.opacity(0.7)))
           }
           .onChange(of: foto_seleccionada) { _, nuevo_valor in
               Task {
                   if let nuevo_valor,
                      let datos = try? await nuevo_valor.loadTransferable(type: Data.self),
                      let imagen = UIImage(data: datos) {
                       foto_a_mostrar = imagen
                   }
               }
           }
           .padding(.top, 20)
           
           // Info de usuario
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
       .background(themeManager.primaryColor.opacity(0.2))
   }
}
#Preview {
   PerfilUsuario()
        .environmentObject(ControladorApp())
        .environmentObject(AppThemeManager())
}
