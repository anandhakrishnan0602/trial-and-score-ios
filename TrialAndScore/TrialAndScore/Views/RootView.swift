//
//  RootView.swift
//  TrialAndScore
//
//  Created by Anandhakrishnan on 05/09/26.
//
import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            TrialListView()
                .tabItem {
                    Label("Trials", systemImage: "list.bullet")
                }

            MASCCInputView()
                .tabItem {
                    Label("Risk Score", systemImage: "heart.text.square")
                }
        }
    }
}
