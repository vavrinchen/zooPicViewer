import QtQuick 2.0
import "./"

Item {
    id: root

    // 不需要這些 properties; 沒有對外的需要, 對內直接 reference 就好
    property var id_background: id_background
    property var id_previous: id_previous
    property var id_next: id_next
    property var id_indexArea: id_indexArea

    Image {
        // naming: 不需要 id_ prefix; 其他的 naming 也做修改
        id: id_background
        anchors.fill: parent
        cache: false
    }

    // 這個 Previous/next button 好像可以抽成一個 component
    Image {
        id: id_previous
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
        source: "./model/btn_prev.svg"
        visible: (id_indexArea.newIndex!==0&&model.imageList.length!==1) // against Rule B
        MouseArea{
            anchors.fill: parent
            onClicked: {
                id_indexArea.previous()
            }
        }
    }

    Image {
        id: id_next
        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }
        source: "./model/btn_next.svg"
        visible: (id_indexArea.newIndex!==model.imageList.length-1&&model.imageList.length!==1)  // against Rule B
        MouseArea{
            anchors.fill: parent
            onClicked: {
                id_indexArea.next()
            }
        }
    }


    ViewModel {
        id: id_indexArea

        height: mainRoot.height / 10
        Model{
            id: model
        }
        // 是否不用 signal, 用其他方式來達到一樣的目的, 因為有 against Rule B
        onIndexChanged: {
            id_background.source = "model/" + model.imageList[id_indexArea.newIndex]
            console.log("id_indexArea.newIndex: ", id_indexArea.newIndex)
        }
    }
}

