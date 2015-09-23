var React = require('react-native');

var Login = require('./Login');

var {
    StyleSheet,
    Text,
    Image,
    TouchableHighlight,
    View
} = React;

var Main = React.createClass({

    _onPressButton: function() {
            this.props.navigator.push(Login);
    },

    render() {
        return (
            <NavigatorIOS
                ref='nav'
                initialRoute = {{
                    title: 'FW Mobile',
                    component: Main
                }}
            />

            <View style={styles.container}>

            <Image
            style={styles.icon}
            source={require('image!fluff_paw')}
            />

            <Text style={styles.headline}>
            FW Mobile
            </Text>
            <Text style={styles.instructions}>
            To get started, you must already be a registered user of FW.
            </Text>

            <TouchableHighlight onPress={this._onPressButton}>
              <Text style={styles.getstarted}>
                Get started
              </Text>
            </TouchableHighlight>

            </View>
        )
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


module.exports = Main;
