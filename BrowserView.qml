import QtQuick 2.0
import QtQuick.Controls 1.4
import "./"

Item {
    id: root
    property var viewModel: viewModel
    property var model: Model{}  // viewmodel 不就有提供 model 了, 應該這多餘的, 如果這個 model 跟 viewmodel 提供得不一樣, 不就會亂掉

    Rectangle{
        width: root.width*0.8
        height: root.height*0.8

        anchors.horizontalCenter: root.horizontalCenter
        anchors.verticalCenter: root.verticalCenter
        Image {
            id: backgroundImg
            anchors.fill: parent
            cache: false
            // by 上面的 comment, 如果都是 viewmodel 提供的, 是否有其他方式來表達
            source:  "model/" + model.imageList[viewModel.newIndex]
        }
    }

    Button {
        id: previousBtn
        anchors {
            left: root.left
            verticalCenter: root.verticalCenter
        }

        iconSource: "./model/btn_prev.svg"
        visible: viewModel.previousVisible()
        onClicked: viewModel.previous()

    }

    Button {
        id: nextBtn
        anchors {
            right: root.right
            verticalCenter: root.verticalCenter
        }

        iconSource: "./model/btn_next.svg"
        visible: viewModel.nextVisible()
        onClicked: viewModel.next()

    }


    ViewModel {
        id: viewModel
    }
}

