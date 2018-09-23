import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import RNMediaQuery from './RNMediaQueryBridgeNativeModule';
import { NativeModules } from 'react-native'

export default class App extends React.Component {
  state = {
    status: '',
    podcasts: [],
  }

  async componentDidMount() {
    const status = await this.getStatus()
    const podcasts = await this.requestPodcastTitles()
    this.setState({ 
      status,
      podcasts,
    })
    console.log('Status: ', status);
    console.log('Podcasts: ', podcasts)
  }

  getStatus = () => {
    return RNMediaQuery.getPermissionStatus();
  }


  requestPodcastTitles = () => {
    return RNMediaQuery.requestPodcastTitles();
  }

  render() {
    const { status, podcasts } = this.state;

    return (
      <View style={styles.container}>
        <Text>Status: {status}</Text>
        { podcasts.length
            ? podcasts.map((podcast, index) => (
              <Text>{index}: {podcast.podcastTitle}</Text>
            ))
            : null
        }
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
