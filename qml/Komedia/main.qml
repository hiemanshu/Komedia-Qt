import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    Component.onCompleted: theme.inverted = true

    MainPage {
        id: mainPage
    }

    XKCD {
        id: xkcd
    }

    Dilbert {
        id: dilbert
    }

    GOComics {
        id: goComics
    }

    LoadingPage {
        id: loadingPage
    }

    LoadingFailed {
        id: loadingFailed
    }

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: qsTr("Sample menu item") }
        }
    }
}
