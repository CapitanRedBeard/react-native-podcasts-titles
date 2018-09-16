//  Created by react-native-create-bridge

import { NativeModules } from 'react-native'

const { MediaQuery } = NativeModules

export default {
  getPermissionStatus () {
    console.log('RNMediaQueryBrdige', NativeModules)
    return MediaQuery.getPermissionStatus()
  },

  // EXAMPLE_CONSTANT: RNMediaQueryBrdige.EXAMPLE_CONSTANT
}
