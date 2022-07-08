//
//  PieChart.swift
//  spender
//
//  Created by sano on 7/8/22.
//

import SwiftUI
import Charts

struct PieChart: UIViewRepresentable {
    let entries: [PieChartDataEntry]
    
    func makeUIView(context: Context) -> PieChartView {
        return PieChartView()
    }
    
    func updateUIView(_ uiView: PieChartView, context: Context) {
        let dataSet = PieChartDataSet(entries: entries)
        
        dataSet.colors = []
        
        for _ in entries {
            dataSet.colors.append(UIColor(
                red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: .random(in: 0...1),
                alpha: 1
            ))
        }
        
        dataSet.iconsOffset = CGPoint(x: 0, y: -50)
        dataSet.label = ""
        
        uiView.data = PieChartData(dataSets: [dataSet])
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart(entries: [])
    }
}
