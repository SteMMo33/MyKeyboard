import QtQuick 2.5
import QtQuick.Window 2.0
import QtQuick.Controls 2.0
import QtWebSockets 1.0


Window {

    property int colonne
    property alias credit : txtCredit.text

    id: window
    visible: true
    width: 1000
    height: 800
    title: qsTr("ATK CP40 - CP66")

    FontLoader { id: atkFont; name: "Proxima Nova Rg"; source: "qrc:fonts/ProximaNova-Bold.otf" }

    // ---

    WebSocket {
        id: socket

        // url: "ws://echo.websocket.org" //
        // url: "ws://10.191.40.232:7681"
        url: "ws://localhost:7681"

        onTextMessageReceived: {
            messageBox.text = messageBox.text + "\nReceived message: " + message
        }
        onStatusChanged: {
            console.log("State: "+socket.status)
            if (socket.status == WebSocket.Error) {
                                    console.log("Error: " + socket.errorString)
                                } else if (socket.status == WebSocket.Open) {
                                    socket.sendTextMessage("Hello World")
                                } else if (socket.status == WebSocket.Closed) {
                                    messageBox.text += "\nSocket closed"
                                } else if (socket.status == WebSocket.Connecting) {
                             messageBox.text += "\nto "+socket.url
                         }
        }
        active: false
    }

    Text {
       id: messageBox
       text: socket.status == WebSocket.Open ? qsTr("Sending...") : qsTr("Welcome!")
       anchors.centerIn: parent
       height: 100;

       MouseArea {
              anchors.fill: parent
              onClicked: {
                  socket.active = !socket.active

                  console.log("Press - active: "+socket.active)
                  messageBox.text = "Active is "+socket.active
                  if (socket.active == true){
                      messageBox.text += "\nto: "+socket.url
                      console.log("to: "+socket.url)
                  }
                  //Qt.quit();
              }
          }
    }

    Text {
        id: wsCmd
        text: qsTr("CMD")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
       x: 48
       y: 432
       width: 200
       height: 100;

       MouseArea {
           anchors.fill: parent
              onClicked: {
                  socket.sendTextMessage("{ cmd: \"firmware\"} ")
                  console.log("SentCmd")
              }
          }
    }

    // ----

    Rectangle {
        id: containerBtns
        y: 557
        height: 300
        color: "#80000040"
        anchors.left: parent.left
        anchors.leftMargin: 520

        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30

        GridView {
            id: listModelFromCpp
            anchors.rightMargin: 3
            anchors.leftMargin: 3
            anchors.bottomMargin: 3
            anchors.topMargin: 3

            cellHeight: 90
            cellWidth: parent.width / 2 - anchors.leftMargin - anchors.rightMargin

            anchors.fill: parent

            model: myProductModel
            delegate: Rectangle {
                id: cellaGrid
                height: listModelFromCpp.cellHeight
                width: listModelFromCpp.cellWidth

                color: modelData.color
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

    Rectangle{
        id: rectProduct
        x: 418
        width: 200
        height: 227
        anchors.top: parent.top
        anchors.topMargin: 176
        anchors.right: parent.right
        anchors.rightMargin: 22
        Image {
            id: image
            anchors.fill: parent
            source: "images/pingu200.png"
            fillMode: Image.PreserveAspectFit
        }
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                console.log("Pressed for anim")
                prodAnimation.start()
                //propAnim.start()
                //propAnimVert.start()
                //function(){
                //    credit = credit + 4.5
                //}
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

    Rectangle {
        id: divCredit
        x: 421
        y: 206
        width: 200
        height: 200
        color: "#80000000"
        radius: 19

        Text {
            id: txtCredit
            x: 27
            y: 34
            color: "#fc7f15"
            text: qsTr("0.00")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            style: Text.Raised
            font.pixelSize: 65
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
        y: 461
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15
        anchors.left: parent.left
        anchors.leftMargin: 15
        source: "images/BTN.png"
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
        text: qsTr("Text")
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
        text: "WS Open"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        onClicked: myWebSocket.doOpen()
    }

    Button {
        id: btnClose
        text: "WS Close"
        anchors.topMargin: 10
        anchors.top: btnOpen.bottom
        anchors.right: parent.right
        anchors.rightMargin: 10
        onClicked: myWebSocket.doClose()
    }

    Button {
        id: btnState
        text: "WS State"
        anchors.topMargin: 10
        anchors.top: btnClose.bottom
        anchors.right: parent.right
        anchors.rightMargin: 10
        onClicked: textWsState.text = myWebSocket.getState()
    }

    Button {
        id: btnSend
        text: "WS Send"
        anchors.top: btnState.top
        anchors.topMargin: 0
        anchors.right: btnState.left
        anchors.rightMargin: 10
        onClicked: myWebSocket.sendCmd("{\"cmd\":\"ciao\"}")
    }

    Button {
        id: btnSendLightOn
        text: "Light ON"
        anchors.top: btnState.top
        anchors.topMargin: 0
        anchors.right: btnSend.left
        anchors.rightMargin: 10
        onClicked: myWebSocket.sendCmd("{\"setLightOn\"}")
    }

    Button {
        id: btnSendLightOff
        text: "Light OFF"
        anchors.top: btnState.top
        anchors.topMargin: 0
        anchors.right: btnSendLightOn.left
        anchors.rightMargin: 10
        onClicked: myWebSocket.sendCmd("{\"setLightOff\"}")
    }

    Text {
        id: textWsState
        x: 780
        y: 80
        width: 38
        height: 20
        text: qsTr("Text")
        font.pixelSize: 12
    }
}


