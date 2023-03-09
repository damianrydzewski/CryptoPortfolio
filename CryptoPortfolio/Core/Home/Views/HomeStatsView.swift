//
//  HomeStatsView.swift
//  CryptoPortfolio
//
//  Created by Damian on 09/03/2023.
//

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var isShowedPortolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.stats) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: isShowedPortolio ? .trailing : .leading)
    }
}

struct HomeStatsView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatsView(isShowedPortolio: .constant(true))
            .environmentObject(dev.homeVM)
    }
}
