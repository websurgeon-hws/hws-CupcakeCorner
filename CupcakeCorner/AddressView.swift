//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order

   var body: some View {
       Text("Hello World")
   }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
