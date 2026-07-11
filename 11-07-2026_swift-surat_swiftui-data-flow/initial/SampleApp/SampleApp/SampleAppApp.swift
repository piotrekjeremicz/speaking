//
//  SampleAppApp.swift
//  SampleApp
//
//  Created by Piotrek Jeremicz on 10/07/2026.
//

import SwiftUI

@main
struct SampleAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                List {
                    NavigationLink("1. Init") {
                        InitView()
                    }
                    NavigationLink("2. State + Init") {
                        StateAndInitView()
                    }
                    NavigationLink("3. State + Binding") {
                        StateAndBindingView()
                    }
                    NavigationLink("4. Closure Trap") {
                        ClosureTrapView()
                    }
                    NavigationLink("5. Environment Value") {
                        EnvironmentView()
                    }
                    NavigationLink("6. Preference Value") {
                        PreferenceValueView()
                    }
                    NavigationLink("7. Container Value") {
                        ContainerValueView()
                    }
                }
                .navigationTitle("SwiftUI Data Flow")
            }
        }
    }
}
