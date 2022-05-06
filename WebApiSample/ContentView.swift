//
//  ContentView.swift
//  WebApiSample
//
//  Created by 鳴子智 on 2022/05/05.
//

import SwiftUI

struct OkashiItem: Identifiable {
    let id = UUID()
    let name: String
    let link: URL
    let image: UIImage
}

struct ContentView: View {
    
    @ObservedObject var okashiDataList = OkashiData()
    
    @State var inputText = ""
    
    var body: some View {
        VStack{
            TextField("キーワードを入力してください", text: $inputText, onCommit: {
                okashiDataList.searchOkashi(keyword: inputText)
            })
            
            List(okashiDataList.okashiList) { okashi in
                HStack {
                    Text(okashi.name)
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
