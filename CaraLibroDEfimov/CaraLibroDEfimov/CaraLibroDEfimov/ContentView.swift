//
//  ContentView.swift
//  CaraLibroDEfimov
//
//  Created by Denis Efimov on 19/05/22.
//

// En el proceso de revisar las clases y buscar material adicional me encontre
// con SwiftUI. Lo use con fin de agilizar mi flujo de trabajo como grupo de
// 1 sola persona. En caso esto no sea aceptable, favor de indicarlo
// y dejare de usarlo

import SwiftUI
import UIKit


struct ContentView: View {
    @State private var usuario = ""
    @State private var password = ""
    @State private var errorUsuario = 0
    @State private var errorPassword = 0
    @State private var mostrandoLogin = false
    
    var body: some View {
        NavigationView{
            ZStack {
                Color.green
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack {
                    Text("ingrese sus datos")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Usuario", text: $usuario)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.green, width: CGFloat(errorUsuario))
                
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(.green, width: CGFloat(errorPassword))
                    
                    Button("Login"){
                        
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("Has ingresado @\(usuario)"), isActive: $mostrandoLogin){
                        EmptyView()
                    }
                    Button("Registrarse"){
                        autenticarUsuario(usuario: usuario, password: password)
                    }
                    .foregroundColor(.black)
                    .frame(width: 300, height: 50)
                    .background(Color.cyan)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("ingrese sus datos"), isActive: $mostrandoLogin){
                        EmptyView()
                    }
                    Button("Recuperar Password"){
                        
                    }
                    .foregroundColor(.cyan)
                    .frame(width: 300, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: Text("ingrese e-mail"), isActive: $mostrandoLogin){
                        EmptyView()
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
    func autenticarUsuario(usuario: String, password: String){
        if usuario.lowercased() == "DEfimov"{
            errorUsuario = 0
            if password.lowercased() == "12345"{
                errorPassword = 0
                mostrandoLogin = true
            } else {
                errorPassword = 2
            }
        } else {
            errorUsuario = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
