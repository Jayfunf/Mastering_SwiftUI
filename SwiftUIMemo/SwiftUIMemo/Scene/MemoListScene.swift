//
//  ContentView.swift
//  SwiftUIMemo
//
//  Created by Minhyun Cho on 2021/09/12.
//

import SwiftUI

struct MemoListScene: View {
    // 뷰가 생성되는 시점에 자동으로 초기화
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var formatter: DateFormatter
    
    @State var showComposer: Bool = false //컴포즈신 제어
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                MemoCell(memo: memo)
            }
            .navigationBarTitle("내 메모")
            .navigationBarItems(trailing: ModalButton(show: $showComposer))// 값 복사 X 바인딩이 저장됨. 뷰 외부를 바꾸고 싶다면 바인딩으로 $으로 해야함.
            .sheet(isPresented: $showComposer, content: {
                ComposeScene(showComposer: self.$showComposer)
            })
        }
    }
}

fileprivate struct ModalButton: View {
    @Binding var show: Bool //값을 저장하지 않고 속성을 바꾸기 위한 속성
    
    var body: some View {
        Button(action: {
            self.show = true
        }, label: {
            Image(systemName: "plus")
        })
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
