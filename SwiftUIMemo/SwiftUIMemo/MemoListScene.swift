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
    
    var body: some View {
        NavigationView {
            List(store.list) { memo in
                MemoCell(memo: memo)
            }
            .navigationBarTitle("내 메모")
        }
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
