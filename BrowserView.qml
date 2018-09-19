import QtQuick 2.0
import QtQuick.Controls 1.4
import "./"

Item {
    id: root
    property var viewModel: viewModel

    Rectangle{
        width: root.width*0.8
        height: root.height*0.8

        anchors.horizontalCenter: root.horizontalCenter
        anchors.verticalCenter: root.verticalCenter
        Image {
            id: backgroundImg
            anchors.fill: parent
            cache: false 
            source:  "model/" + viewModel.model.imageList[viewModel.newIndex]
        }
    }

    Button {
        id: previousBtn
        anchors {
            left: root.left
            verticalCenter: root.verticalCenter
        }

        iconSource: "./model/btn_prev.svg"
//        visible: viewModel.previousVisible() 應該不用了, 多的 function 要 remove
        onClicked: viewModel.previous()

    }

    Button {
        id: nextBtn
        anchors {
            right: root.right
            verticalCenter: root.verticalCenter
        }

        iconSource: "./model/btn_next.svg"
//        visible: viewModel.nextVisible()
        onClicked: viewModel.next()

    }

    IndicatorView {
        id: indicatorView
        anchors {
            horizontalCenter: parent.horizontalCenter
        }
        indexIndicatorText: viewModel.getIndicatorText()

    }

    ViewModel {
        id: viewModel
    }
}

