import QtQuick 2.5


Item {
    Rectangle {
        id: background
        color: "#80000000"
        anchors.fill: parent

        Rectangle {
            id: rectangle
            color: "#ffffff"
            anchors.rightMargin: 100
            anchors.leftMargin: 100
            anchors.bottomMargin: 100
            anchors.topMargin: 100
            anchors.fill: parent

            Text {
                id: text1
                x: 40
                y: 49
                text: qsTr("Text")
                font.pixelSize: 12
            }

            Text {
                id: text2
                x: 40
                y: 85
                text: qsTr("Text")
                font.pixelSize: 12
            }

            Image {
                id: image
                x: 332
                y: 8
                width: 100
                height: 100
                source: "qrc:/qtquickplugin/images/template_image.png"
            }

            Rectangle {
                id: rectangle1
                x: 60
                y: 201
                width: 146
                height: 54
                color: "#ffffff"

                Text {
                    id: txtRitorna
                    text: qsTr("Ritorna")
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                    font.pixelSize: 12
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                }
            }

            Rectangle {
                id: rectangle2
                x: 228
                y: 201
                width: 146
                height: 54
                color: "#ffffff"

                Text {
                    id: txtAcquista
                    text: qsTr("Acquista")
                    anchors.fill: parent
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.pixelSize: 12
                }

                MouseArea {
                    id: mouseArea1
                    anchors.fill: parent
                }
            }
        }
    }

}
