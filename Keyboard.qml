import QtQuick 2.0

Item {
    id: element
    transformOrigin: Item.Center

    signal keyboardCode(string code)

    Rectangle {
        id: rectangle
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#0231b5"
            }

            GradientStop {
                position: 0.611
                color: "#fbfbfb"
            }
        }
        border.color: "#00000000"
        anchors.bottomMargin: 0
        anchors.fill: parent
        border.width: 2

        Grid {
            id: grid
            x: 120
            anchors.top: parent.top
            anchors.topMargin: rectangle.height / 15 // 40
            anchors.horizontalCenter: parent.horizontalCenter
            columns: 3

            Key {
                text: "1"
                onClicked: {
                    addKey("1")
                }
            }

            Key {
                text: "2"
                onClicked: {
                    addKey("2")
                }
            }

            Key {
                id: key
                text: "3"
                onClicked: addKey("3")
            }

            Key {
                id: key4
                text: "4"
                onClicked: addKey("4")
            }

            Key {
                id: key5
                text: "5"
                onClicked: addKey("5")
            }
            Key {
                id: key6
                text: "6"
                onClicked: addKey("6")
            }
            Key {
                id: key7
                text: "7"
                onClicked: addKey("7")
            }
            Key {
                id: key8
                text: "8"
                onClicked: addKey("8")
            }
            Key {
                id: key9
                text: "9"
                onClicked: addKey("9")
            }
            Key {
                text: "CANC"
                onClicked: display.text = ""
            }
            Key {
                id: key0
                text: "0"
                onClicked: addKey("0")
            }
            Key {
                id: keyAcq
                text: "ACQ"
                onClicked: {
                    nextDel = true
                    keyboardCode(display.text)
                }
            }
        }

        Text {
            id: display
            y: 353
            color: "#0000ff"
            text: qsTr("Prodotto")
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 8
            font.weight: Font.DemiBold
            styleColor: "#f36a6a"
            horizontalAlignment: Text.AlignHCenter
            anchors.right: parent.right
            anchors.rightMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8
            font.pixelSize: 32
        }

    }


    property var nextDel: true
    width: 380
    height: 363

    function addKey(key){
        if (nextDel){
            display.text = key
            nextDel = false
        }
        else
            display.text = display.text + key
    }

}



/*##^##
Designer {
    D{i:0;height:400;width:450}D{i:2;anchors_y:40}D{i:15;anchors_x:8}D{i:1;anchors_height:400;anchors_width:400}
}
##^##*/
