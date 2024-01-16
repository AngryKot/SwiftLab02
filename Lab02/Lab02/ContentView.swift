//
//  ContentView.swift
//  Lab02
//
//  Created by Polina Fedulova on 17.10.2023.
//


import SwiftUI

struct ContentView: View {

    @State var sometext: String = "Text"
    @State var backgroundColor: Color = Color.gray
    @State var textBold = true

    var body: some View {
        ZStack {
            Image("myimage")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    VStack {
                        Text("Item1")
                        Text("Item2")
                    }
                    Text(sometext)
                    Image("s1200")
                        .resizable()
                        .frame(width: 30, height: 30)
                    VStack {
                        Button(action: {
                            print("Hello world")
                            self.sometext = "button works"
                        }) {
                            Text("Click me 1");
                        }

                        Button(action: {
                            print("Hi")
                            textBold.toggle() // Переключаем жирный текст
                        }) {
                            Text("Click me 2");
                        }

                        Button(action: {
                            print("Bye")
                            backgroundColor = Color.white
                        }) {
                            Text("Click me 3");
                        }
                    }
                    VStack (spacing: 4) {
                        ForEach(1..<5) { i in
                            Text("Text \(i)")
                                .bold(textBold)
                                .frame(width: 50)
                                .padding(5)
                                .border(Color.yellow, width: 4)
                                .cornerRadius(7)
                                .padding(10)
                                .background(backgroundColor)
                        }
                    }
                }
                VStack {
                    ForEach(0..<8, id: \.self) { row in
                        HStack {
                            ForEach(0..<8, id: \.self) { column in
                                ZStack {
                                    Rectangle()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor((row + column) % 2 == 0 ? .white : .black)
                                    Text(" ")
                                        .foregroundColor(textBold ? .black : .white)
                                        .font(textBold ? .system(size: 20, weight: .bold) : .system(size: 20))
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
