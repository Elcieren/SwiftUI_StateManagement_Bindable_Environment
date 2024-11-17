//
//  ContentView.swift
//  SwiftUI_StateManagement
//
//  Created by Eren Elçi on 17.11.2024.
//

import SwiftUI
import SwiftData


@Observable
class DarkTheme {
    var isEnable : Bool = false
}


struct DarkChoiceView : View {
    @Bindable var darkTheme : DarkTheme
    
    var body: some View {
        Toggle(isOn: $darkTheme.isEnable) {
            EmptyView()
        }.fixedSize()
    }
}

struct InformationText : View {
    @Environment(DarkTheme.self) private var darkTheme
    
    var body: some View {
        Text(darkTheme.isEnable ? "Dark Theme Enabled" : "Dark Theme Not Enabled").font(.title).foregroundStyle(darkTheme.isEnable ? .white : .black)
    }
}


struct DarkChoiceToogleView : View {
    @Environment(DarkTheme.self) private var darkTheme
    var body: some View {
        DarkChoiceView(darkTheme: darkTheme)
    }
}



struct ContentView: View {
    @Environment(DarkTheme.self) private var darkTheme
    
    var body: some View {
        VStack {
            DarkChoiceToogleView()
            InformationText()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(darkTheme.isEnable ? .black : .white)
        
    }
}



#Preview {
    ContentView()
        .environment(DarkTheme())
}

