import QtQuick 2.5
import QtQuick.Window 2.0

Window {
    id: window
    visible: true
    width: 1000
    height: 800
    title: qsTr("ATK CP40 - CP66")

    FontLoader { id: atkFont; name: "Proxima Nova Rg"; source: "qrc:fonts/ProximaNova-Bold.otf" }

    Rectangle {
        width: 350; height: 200
        color: "#80000040"
        //x: 637
        //y: 535
        anchors.right: parent.right
        anchors.rightMargin: 30
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30

    GridView {
        id: listModelFromCpp
        cellHeight: 80
        contentHeight: 100
        contentWidth: 100
        anchors.fill: parent

        model: myProductModel
        delegate: Rectangle {
            height: parent.height
            width: parent.width
            //anchors.fill: parent
            color: modelData.color
            Text {
                text: modelData.name
                anchors.fill: parent
                anchors.centerIn: parent
                font.pointSize: 20
            }
            MouseArea {
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
            console.log("Codice: "+code)
            if (code[0]==='1'){
                image.source = "pingu200.png"
                imageProd.source = "pingu200.png"
            }
            else if (code[0]==='2'){
                imageProd.source = "Finissimo12.png"
                divDetail.detailFotoProd.source = "Finissimo12.png"
                divDetail.detailTitle.text = "Finissimo 12"
            }
            else if (code[0]==='3'){
                imageProd.source = "FinissmoEasyWay_6.png"
                divDetail.detailFotoProd.source = "FinissmoEasyWay_6.png"
                divDetail.detailTitle.text = "Finissimo Easy Way"
            }
            else if (code[0]==='4'){
                imageProd.source = "gel_madagascar.png"
                divDetail.detailTitle.text = "Gel Madagascar"
                divDetail.detailFotoProd.source = "gel_madagascar.png"
            }
            else if (code[0]==='5'){
                imageProd.source = "sensual-massage.png"
                divDetail.detailFotoProd.source = "sensual-massage.png"
                divDetail.detailTitle.text = "Sensual Massage"
            }
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

    Rectangle {
        id: divCredit
        x: 421
        y: 206
        width: 200
        height: 200
        color: "#80000000"
        radius: 19

        Text {
            id: credit
            x: 27
            y: 34
            color: "#fc7f15"
            text: qsTr("0.00")
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            style: Text.Raised
            font.pixelSize: 60
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
        id: image1
        x: 475
        y: 5
        source: "orologio.png"
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: bottoneProd
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

        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            onClicked: divDetail.visible = true
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

    DetailDiv {
        id: divDetail
        visible: false
        anchors.fill: parent
    }

}




