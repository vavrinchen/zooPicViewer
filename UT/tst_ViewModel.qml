import QtQuick 2.7
import QtTest 1.0
import QtQuick.Window 2.2
import "../"

Item {

    width: 800
    height: 500

    property var viewModelPanel: viewModelLoader.active ? viewModelLoader.item : null

    Loader {
        id: viewModelLoader
        active: false
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

        function test_addItem_index_increase()
        {
            viewModelPanel.addItem();
            viewModelPanel.addItem();
            compare(viewModelPanel.imgCount, 2);
        }

        function test_next_emit_indexChanged()
        {
            viewModelPanel.addItem();
            viewModelPanel.next();
            compare(spy.count, 1);
        }

        function test_previous_disappear_when_no_img()
        {
            compare(viewModelPanel.previousVisible(), false);
        }

        function test_previous_and_next_disappear_when_1_img()
        {
            viewModelPanel.addItem();
            compare(viewModelPanel.previousVisible(), false);
            compare(viewModelPanel.nextVisible(), false);
        }

        function test_previous_show_when_not_first_img()
        {
            viewModelPanel.addItem();
            viewModelPanel.addItem();
            viewModelPanel.next();
            viewModelPanel.next();
            compare(viewModelPanel.previousVisible(), true);
        }

        function test_next_disappear_when_last_img()
        {
            viewModelPanel.addItem();
            viewModelPanel.addItem();
            viewModelPanel.next();
            viewModelPanel.next();
            compare(viewModelPanel.nextVisible(), false);
        }



    }
}
