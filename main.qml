import QtQuick 2.9
import QtQuick.Window 2.2
import "./"

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Zoo")

    BrowserView {
        id: browserView
        width: parent.width
        height: parent.height
        anchors.fill: parent
    }

}
