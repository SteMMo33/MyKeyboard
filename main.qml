import QtQuick 2.13
import QtQuick.Window 2.13

Window {
    id: window
    visible: true
    width: 640
    height: 580
    title: qsTr("Qt Keyboard")

    Keyboard {
        width: 400
        height: 344
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5

        onKeyboardCode: function (code) {
            console.log("Codice: "+code)
            if (code[0]==='1')
                image.source = "pingu200.png"
            else if (code[0]==='2')
                image.source = "Finissimo12.png"
            else if (code[0]==='3')
                image.source = "FinissmoEasyWay_6.png"
            else if (code[0]==='4')
                image.source = "gel_madagascar.png"
            else
                image.source = "cactus.jpg"
        }
    }

    Image {
        id: image
        x: 418
        width: 200
        height: 200
        anchors.top: parent.top
        anchors.topMargin: 149
        anchors.right: parent.right
        anchors.rightMargin: 22
        source: "cactus.jpg"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image1
        x: 431
        y: 10
        source: "orologio.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image2
        y: 370
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 3
        anchors.left: parent.left
        anchors.leftMargin: 3
        source: "BTN.png"
        fillMode: Image.PreserveAspectFit

        Rectangle {
            id: rectangle
            x: 16
            y: 5
            width: 154
            height: 190
            color: "#000000"
            radius: 17

            Image {
                id: imageProd
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10
                anchors.fill: parent
                source: "Finissimo12.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}

/*##^##
Designer {
    D{i:2;anchors_y:10}D{i:6;anchors_height:161;anchors_width:155;anchors_x:27;anchors_y:20}
D{i:4;anchors_x:0}
}
##^##*/
