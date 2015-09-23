var React = require('react-native');

var {
    StyleSheet,
    Text,
    Image,
    TouchableHighlight,
    View,
    TextInput
} = React;

var Login = React.createClass({
    render() {
        return (
            <View style={styles.container}>

            <Text style={styles.headline}>
            Login
            </Text>

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


module.exports = Login;
