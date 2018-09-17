import QtQuick 2.0
import "./"

Item {
    
    Text {
        id: index_indicator

        font.bold: true
        font.pixelSize:20
        text:(id_indexArea.newIndex+1) + "/" + model.imageList.length
    }
}
