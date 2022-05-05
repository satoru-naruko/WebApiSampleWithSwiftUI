//
//  ContentView.swift
//  WebApiSample
//
//  Created by 鳴子智 on 2022/05/05.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var okashiDataList = OkashiData()
    
    @State var inputText = ""
    
    var body: some View {
        VStack{
            TextField("キーワードを入力してください", text: $inputText, onCommit: {
                okashiDataList.searchOkashi(keyword: inputText)
            })
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
