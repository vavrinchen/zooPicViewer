import QtQuick 2.0
import "./"

Item {
    property string indexIndicatorText

    Text {

        font.bold: true
        font.pixelSize: 20
        text: indexIndicatorText
    }
}
