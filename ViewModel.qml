import QtQuick 2.0

Item {
    id: root
    signal indexChanged
    property int newIndex: -1

    ListModel {
        id: id_indexlist
    }


    function addItem(index) {
        id_indexlist.append({"INDEX": index})
    }

    function next() {
        root.newIndex = (root.newIndex + 1) % id_indexlist.count
        root.indexChanged()
    }

    function previous() {
        root.newIndex = root.newIndex - 1
        root.indexChanged()
    }

    property alias tst_id_indexlist: id_indexlist
}
