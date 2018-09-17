import QtQuick 2.0
import "./"

Image {
    id: nextBtn
    anchors {
        right: parent.right
        verticalCenter: parent.verticalCenter
    }
    source: "./model/btn_next.svg"
    visible: viewModel.nextVisible()
    MouseArea{
        anchors.fill: parent
        onClicked: {
            viewModel.next()
        }
    }
}
