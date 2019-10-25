import QtQuick 2.5
import QtQuick.Window 2.0
import QtQuick.Controls 2.0


Window {

    // property alias credit : txtCreditInt.text

    id: window
    visible: true
    width: 1000
    height: 800
    title: qsTr("ATK CP40 - CP66")

    FontLoader { id: atkFont; name: "Proxima Nova Rg"; source: "qrc:fonts/ProximaNova-Bold.otf" }

    Connections {
        // target: credit
        //onCreditChanged: console.log("XXX")
    }

    Rectangle {
        id: containerBtns
        y: 428
        height: 435
        color: "#80000040"
        anchors.left: parent.left
        anchors.leftMargin: 442

        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20

        GridView {
            id: listModelFromCpp
            anchors.fill: parent

            cellHeight: 90
            cellWidth: parent.width / 2 - anchors.leftMargin - anchors.rightMargin

            model: myProductModel
            delegate: Rectangle {
                id: cellaGrid
                height: listModelFromCpp.cellHeight
                width: listModelFromCpp.cellWidth

                // color: modelData.color
                radius: 6

                Rectangle {
                    id: rectImage
                    color: "black"
                    radius: 6
                    anchors.leftMargin: 3
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.topMargin: 3
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 3
                    width: 50
                }

                Text {
                    text: modelData.name + " - " + modelData.prezzo
                    anchors.left: rectImage.right
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.top: parent.top
                    anchors.leftMargin: 3
                    font.pointSize: 20
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: console.log(modelData.name)
                }
            }
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
            // console.log("Codice: "+code)
            if (code[0]==='1'){
                image.source = "images/pingu200.png"
                imageProd.source = "images/pingu200.png"
            }
            else if (code[0]==='2'){
                imageProd.source = "images/Finissimo12.png"
                divDetail.detailFotoProd.source = "images/Finissimo12.png"
                divDetail.detailTitle.text = "Finissimo 12"
            }
            else if (code[0]==='3'){
                imageProd.source = "images/FinissmoEasyWay_6.png"
                divDetail.detailFotoProd.source = "images/FinissmoEasyWay_6.png"
                divDetail.detailTitle.text = "Finissimo Easy Way"
            }
            else if (code[0]==='4'){
                imageProd.source = "images/gel_madagascar.png"
                divDetail.detailTitle.text = "Gel Madagascar"
                divDetail.detailFotoProd.source = "images/gel_madagascar.png"
            }
            else if (code[0]==='5'){
                imageProd.source = "images/sensual-massage.png"
                divDetail.detailFotoProd.source = "images/sensual-massage.png"
                divDetail.detailTitle.text = "Sensual Massage"
            }
            else
                image.source = "images/pingu200.png"
        }
    }

    Rectangle {
        id: divCredit
        x: 763
        width: 200
        height: 200
        color: "#80000000"
        radius: 19
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 70

        Text {
            id: txtCreditInt
            y: 34
            color: "#fc7f15"
            text: qsTr("0.")
            anchors.left: parent.left
            anchors.leftMargin: 39
            style: Text.Raised
            font.pixelSize: 65
            font.family: atkFont.name
        }
        Text {
            id: txtCreditDec
            y: 34
            color: "#fc7f15"
            text: qsTr("00")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 102
            anchors.left: txtCreditInt.right
            anchors.leftMargin: 0
            style: Text.Raised
            font.pixelSize: 55
            font.family: atkFont.name
        }

        Text {
            id: lblEuro
            x: 48
            y: 113
            color: "#fc7f15"
            text: qsTr("euro")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: atkFont.name
            font.pixelSize: 40
            style: Text.Raised
        }
    }

    Image {
        id: imgOrologio
        x: 475
        y: 5
        source: "images/orologio.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: bottoneProd
        y: 512
        width: 414
        height: 211
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 82
        anchors.left: parent.left
        anchors.leftMargin: 22
        source: "images/BTN.png"
        fillMode: Image.PreserveAspectFit

        Rectangle {
            id: rectangle
            width: 154
            color: "#000000"
            radius: 17
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.left: parent.left
            anchors.leftMargin: 10

            Image {
                id: imageProd
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10
                anchors.fill: parent
                source: "images/Finissimo12.png"
                fillMode: Image.PreserveAspectFit
            }
        }

        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            onClicked: divDetail.visible = true
        }
    }

    Text {
        id: textColonne
        x: 469
        y: 117
        width: 38
        height: 20
        text: colonne+" colonne"
        font.pixelSize: 12
    }

    Text {
        id: farmacie
        x: 612
        y: 21
        text: qsTr("Farmacie di turno")
        font.pixelSize: 30
        font.family: atkFont.name
    }

    DetailDiv {
        id: divDetail
        visible: false
        anchors.fill: parent
    }


    Button {
        id: btnOpen
        x: 469
        text: "WS Open"
        anchors.top: parent.top
        anchors.topMargin: 163
        anchors.right: parent.right
        anchors.rightMargin: 431
        onClicked: myWebSocket.doOpen()
    }

    Button {
        id: btnClose
        text: "WS Close"
        anchors.top: btnOpen.bottom
        anchors.topMargin: -40
        anchors.left: btnOpen.right
        anchors.leftMargin: 7
        onClicked: myWebSocket.doClose()
    }

    Button {
        id: btnState
        x: 576
        y: 269
        text: "WS State"
        onClicked: {
            txtCreditInt.text = "10."
            textWsState.text = myWebSocket.getState()
        }
    }

    Button {
        id: btnSend
        x: 469
        y: 269
        text: "WS Send"
        onClicked: myWebSocket.sendCmd("{\"cmd\":\"ciao\"}")
    }

    Button {
        id: btnSendLightOn
        x: 469
        y: 216
        text: "Light ON"
        onClicked: myWebSocket.sendCmd("setLightOn")
    }

    Button {
        id: btnSendLightOff
        x: 576
        y: 216
        text: "Light OFF"
        onClicked: myWebSocket.sendCmd("setLightOff")
    }

    Text {
        id: textWsState
        x: 469
        y: 315
        width: 207
        height: 20
        text: qsTr("Text")
        font.pixelSize: 12
    }
}


