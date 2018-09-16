import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import RNMediaQuery from './RNMediaQueryBridgeNativeModule';
import { NativeModules } from 'react-native'

export default class App extends React.Component {
  async componentDidMount() {
    console.log('Status: ', await this.getStatus());
  }

  getStatus = () => {
    return RNMediaQuery.getPermissionStatus();
  }

  render() {
    console.log('NativeModules.', NativeModules.MediaQuery)
    return (
      <View style={styles.container}>
        <Text>Open up App.js to start working on your app!</Text>
        <Text>Changes you make will automatically reload.</Text>
        <Text>Shake your phone to open the developer menu.</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
