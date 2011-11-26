import QtQuick 1.1
import com.nokia.meego 1.0

Page {

    tools: ToolBarLayout {
        ToolIcon {
            platformIconId: "toolbar-back"
            onClicked: appWindow.pageStack.pop()
        }
    }

    Text {
        anchors.centerIn: parent
        text: ("The comic failed to load, check your internet connection and try again!")
    }
}
