/**
* Sample React Native App
* https://github.com/facebook/react-native
*/
'use strict';

var React = require('react-native');
var {
    AppRegistry,
    StyleSheet,
    Text,
    Image,
    TouchableHighlight,
    View,
    NavigatorIOS
} = React;

var Login = React.createClass({
    render: function() {
        return (



            <View style={styles.container}>

            <Text style={styles.headline}>
            My new sign in page
            </Text>
            <Text style={styles.instructions}>
            Lets get you signed in
            </Text>

            <TouchableHighlight onPress={this._onPressButton}>
              <Text style={styles.getstarted}>
                Login
              </Text>
            </TouchableHighlight>

            </View>
        );
    }
});

var styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
        padding: 15
    },
    icon : {
        marginBottom: 20,
    },
    headline: {
        fontSize: 36,
        textAlign: 'center',
        margin: 10,
    },
    instructions: {
        textAlign: 'center',
        color: '#333333',
        marginBottom: 80,
    },
    getstarted: {
        textAlign: 'center',
        color: '#ffffff',
        backgroundColor: '#0aba0a',
        fontWeight: 'bold',
        fontSize: 24,
        padding: 10
    }

});

AppRegistry.registerComponent('Login', () => Login);
