import QtQuick 2.13
import QtQuick.Window 2.13

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Qt Keyboard")

    Keyboard {
        width: 450
        height: 400

        onKeyboardCode: function (code) {
            console.log("Codice: "+code)
        }
    }
}
