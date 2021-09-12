//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by Minhyun Cho on 2021/09/12.
//

import SwiftUI

struct MemoCell: View {
    @ObservedObject var memo: Memo // @ObservedObject는 메모 객체가 업데이트 되는 시점마다 뷰가 새롭게 그려짐. 항상 최신 데이터 유지.
    @EnvironmentObject var formatter: DateFormatter
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            
            Text("\(memo.insertDate, formatter: self.formatter)")
                .font(.caption)
                .foregroundColor(Color(UIColor.secondaryLabel))
            
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test"))
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
