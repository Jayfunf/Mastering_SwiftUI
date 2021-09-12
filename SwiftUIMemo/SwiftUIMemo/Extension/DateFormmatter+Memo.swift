//
//  DateFormmatter+Memo.swift
//  SwiftUIMemo
//
//  Created by Minhyun Cho on 2021/09/12.
//

import Foundation


extension DateFormatter {
    static let memoDateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .none
        f.locale = Locale(identifier: "Ko_Kr")
        return f
    } ()
}

extension DateFormatter: ObservableObject {
    
}
