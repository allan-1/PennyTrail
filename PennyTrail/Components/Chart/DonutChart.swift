//
//  DonutChart.swift
//  PennyTrail
//
//  Created by Allan on 12/13/24.
//

import SwiftUI
import Charts

struct DonutChart: View {
    var spent: Double
    var totalMax: Double
    var chartData: [Double]
    var colorThemes: [Int]
    
    var body: some View {
        ZStack{
            Chart{
                ForEach(chartData.indices, id: \.self){
                    index in
                    let value = chartData[index]
                    SectorMark(angle: .value("Value", value), innerRadius: .ratio(0.7), angularInset: 0.5).foregroundStyle(Color(hex: colorThemes[index]))
                }
            }.frame(width: 300, height: 300)
            VStack {
                Text("\(spent, specifier: "%.2f")").font(.largeTitle).bold()
                Text("of \(totalMax, specifier: "%.2f") limit").font(.caption).foregroundStyle(Color(.gray))
            }
        }
    }
}

//#Preview {
//    DonutChart()
//}
