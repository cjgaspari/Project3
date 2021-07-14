//
//  ContentView.swift
//  Project3
//
//  Created by CJ Gaspari on 7/14/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            //Image(systemName: "\(row*4 + col).circle")
            //Text("R\(row) C\(col)")
            HStack {
                Image(systemName: "\(row*4 + col).circle")
                Text("R\(row) C\(col)")
            }
        }
    }
}


struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    
    //defines a closure that accepts two ints, and returns Content
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
                ForEach(0..<rows, id: \.self) { row in
                    HStack {
                        ForEach(0..<self.columns, id: \.self) { column in
                            self.content(row, column)
                        }
                    }
                }
            }
    }
    
    //View builder allows us to send several views and have it form an implicit stack for us
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping(Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
