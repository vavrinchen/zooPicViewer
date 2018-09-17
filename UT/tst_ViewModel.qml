import QtQuick 2.7
import QtTest 1.0
import QtQuick.Window 2.2
import "../"

Item {

    width: 800
    height: 500

    property var viewModelPanel: viewModelLoader.active ? viewModelLoader.item : null

    // 為何需要此 Window ??
    Window { id: vastWin; width: 800; height: 600}

    Loader {
        id: viewModelLoader

        // default active value is false
        sourceComponent: ViewModel{}
    }

    SignalSpy { id: spy; target: viewModelPanel; signalName: "indexChanged"; }

    TestCase {
        name: "ViewModelPanel"
        when: windowShown

        function init()
        {
            viewModelLoader.active = true;
            waitForRendering(viewModelLoader.item);
        }

        function cleanup()
        {
            viewModelLoader.active = false;
            spy.clear();
        }

        // 請針對 accepatane criteria 來驗證你的 viewmodel, 這樣你的 viewmodel 才是根據這樣而寫的

        function test_addItem_index_increase()
        {
            viewModelPanel.addItem(1);
            viewModelPanel.addItem(1);
            compare(viewModelPanel.tst_id_indexlist.count, 2);
        }

        function test_next_emit_indexChanged()
        {
            viewModelPanel.next();
            compare(spy.count, 1);
        }

    }
}
