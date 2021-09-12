//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by Minhyun Cho on 2021/09/12.
//

import SwiftUI

class Memo: Identifiable, ObservableObject {
    let id: UUID // Identifiable이 요구함. 메모를 구분
    @Published var content: String // @Published를 사용하면 이 값이 변할 때 마다 바인딩 되어있는 UI가 자동으로 업데이트
    let insertDate: Date //메모 생성 날짜 저장
    
    init(id: UUID = UUID(), content: String, insertDate: Date = Date()) {
        self.id = id
        self.content = content
        self.insertDate = insertDate
    }
}

extension Memo: Equatable {
    static func == (lhs: Memo, rhs: Memo) -> Bool {
        return lhs.id == rhs.id
    }
}
