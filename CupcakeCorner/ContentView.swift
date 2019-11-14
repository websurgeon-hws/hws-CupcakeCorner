//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.details.type) {
                        ForEach(0..<OrderDetails.types.count, id: \.self) {
                            Text(OrderDetails.types[$0])
                        }
                    }

                    Stepper(value: $order.details.quantity, in: 3...20) {
                        Text("Number of cakes: \(order.details.quantity)")
                    }
                }
                Section {
                    Toggle(isOn: $order.details.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }

                    if order.details.specialRequestEnabled {
                        Toggle(isOn: $order.details.extraFrosting) {
                            Text("Add extra frosting")
                        }

                        Toggle(isOn: $order.details.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                Section {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
