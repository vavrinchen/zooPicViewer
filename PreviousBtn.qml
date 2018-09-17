import QtQuick 2.0
import "./"

Image {
    id: previousBtn
    anchors {
        left: parent.left
        verticalCenter: parent.verticalCenter
    }
    source: "./model/btn_prev.svg"
    visible: viewModel.previousVisible()
    MouseArea{
        anchors.fill: parent
        onClicked: {
            viewModel.previous()
        }
    }
}
