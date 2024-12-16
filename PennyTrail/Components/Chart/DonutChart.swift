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
    var chartData = [4000, 9600, 2500, 1000]
    var total: Int{
        chartData.reduce(0, +)
    }
    
    var body: some View {
        ZStack{
            Chart{
                ForEach(chartData.indices, id: \.self){
                    index in
                    let value = chartData[index]
                    SectorMark(angle: .value("Value", value), innerRadius: .ratio(0.7), angularInset: 0.5).foregroundStyle(Color(hue: Double(index) / Double(chartData.count), saturation: 0.8, brightness: 0.8))
                }
            }.frame(width: 300, height: 300)
            VStack {
                Text("\(spent)").font(.largeTitle).bold()
                Text("of \(totalMax) limit").font(.caption).foregroundStyle(Color(.gray))
            }
        }
    }
}

//#Preview {
//    DonutChart()
//}
