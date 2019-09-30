import QtQuick 2.5
import QtQuick.Window 2.0

Window {
    id: window
    visible: true
    width: 1000
    height: 800
    title: qsTr("ATK CP40 - CP66")

    FontLoader { id: atkFont; name: "Proxima Nova Rg"; source: "qrc:fonts/ProximaNova-Bold.otf" }

    // - MVC - MVD
    ListModel {
        id: listModelProdotti
        ListElement {
            title: "TTT111"
            prodId: 5
            image: "image1"
            prezzo: 9.0
        }
        ListElement {
            title: "TTT222"
            prodId: 3
            image: "image2"
            prezzo: 10.0
        }
        ListElement {
            title: "TTT333"
            prodId: 4
            image: "image4"
            prezzo: 9.80
        }
    }

    ListView {
        x: 15
        width: 150
        height: 68
        anchors.top: keyboard.bottom
        anchors.topMargin: 6
        model: listModelProdotti
        delegate: delegateProdotti
    }

    Component {
        id: delegateProdotti
        Text {
            text: title + " - " + image + "\nPrezzo: " + prezzo
        }
    }

    // -- Fine MVC - MVD

    Keyboard {
        id: keyboard
        width: 400
        height: 399
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
            else if (code[0]==='5')
                image.source = "sensual-massage.png"
            else
                image.source = "TestdiGravidanza_NEW.jpg"
        }
    }

    Rectangle{
        id: rectProduct
        x: 418
        width: 200
        height: 227
        anchors.top: parent.top
        anchors.topMargin: 149
        anchors.right: parent.right
        anchors.rightMargin: 22
    Image {
        id: image
        anchors.fill: parent
        source: "pingu200.png"
        fillMode: Image.PreserveAspectFit
    }
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                console.log("Pressed for anim")
                //prodAnimation.start()
                //propAnim.start()
                propAnimVert.start()
            }
        }

        NumberAnimation on y {
            target: image
            //target: rectProduct
            // property: "x"
            id: prodAnimation
            // from: 0;
            to: 600
            // to: rectProduct.width - image.width - rectProduct.padding
            duration:1500
        }

        PropertyAnimation {
            id: propAnimVert
        target: rectProduct
        properties: "x"
        // from: 100;
        to: 600
        duration:1500
        //running: true
        easing.type: "OutElastic"
        }

        PropertyAnimation {
            id: propAnim
        target: rectProduct
        // properties: "width, height"
        properties: "x"
        from: 100; to: 200
        duration:1500
        //running: true
        easing.type: "InElastic"
        }
    }

    Image {
        id: image1
        x: 475
        y: 5
        source: "orologio.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: image2
        y: 461
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 15
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

    Text {
        id: farmacie
        x: 612
        y: 21
        text: qsTr("Farmacie di turno")
        font.pixelSize: 30
        font.family: atkFont.name
    }

    Text {
        id: credit
        x: 411
        y: 149
        color: "#fc7f15"
        text: qsTr("0.00")
        font.pixelSize: 50
        font.family: atkFont.name
    }

    DetailDiv {
        visible: false
        anchors.fill: parent
    }
}




