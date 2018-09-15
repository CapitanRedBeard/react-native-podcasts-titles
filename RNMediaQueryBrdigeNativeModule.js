//  Created by react-native-create-bridge

import { NativeModules } from 'react-native'

const { RNMediaQueryBrdige } = NativeModules

export default {
  exampleMethod () {
    return RNMediaQueryBrdige.exampleMethod()
  },

  EXAMPLE_CONSTANT: RNMediaQueryBrdige.EXAMPLE_CONSTANT
}
