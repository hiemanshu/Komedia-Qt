import QtQuick 1.1
import com.nokia.meego 1.0
import Komedia 1.0

Page {
    Xkcd {
        id: xkcd
        onLoadFailed: appWindow.pageStack.push(loadingFailed)
        onLoadComplete: appWindow.pageStack.pop()
    }

    BusyIndicator {
        id: loadingIndicator
        anchors.centerIn: parent
        style: BusyIndicatorStyle {
            size: "large"
        }
    }

    Label {
        anchors.top: loadingIndicator.bottom
        text: "Loading..."
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
