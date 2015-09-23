/**
* Sample React Native App
* https://github.com/facebook/react-native
*/
'use strict';

var React = require('react-native');

var Main = require('./App/Components/Main');

var {
    AppRegistry,
    StyleSheet,
    NavigatorIOS,
    Text,
    View
} = React;

var styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#111111'
    }
});

class FWMobile extends React.Component{
    render() {
        return (

            <NavigatorIOS
                style={styles.container}
                initialRoute={{
                    title: 'FW Mobile',
                    component: Main
                }} />

        )
    }
};

AppRegistry.registerComponent('FWMobile', () => FWMobile);
