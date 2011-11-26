import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: commonTools

    state: (screen.currentOrientation == Screen.Portrait) ? "portrait" : "landscape"

    states: [
        State {
            name: "landscape"
            PropertyChanges {
                target: mainGrid
                columns: 4
                spacing: 26
                anchors.leftMargin: 28
            }
            PropertyChanges {
                target: appWindow
                showStatusBar: false
            }
        },
        State {
            name: "portrait"
            PropertyChanges {
                target:  mainGrid
                columns: 2
                anchors.leftMargin: 42
                spacing: 40
            }
            PropertyChanges {
                target: appWindow
                showStatusBar: true
            }
        }
    ]

    Grid {
        id: mainGrid
        spacing: 40
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.leftMargin: 42
        columns: 2
        MouseArea {
            width: xkcdImg.width
            height: xkcdImg.height
            Image {
                id: xkcdImg
                source: "images/xkcd.png"
            }
            onClicked: appWindow.pageStack.push(xkcd)
        }
        MouseArea {
            width: calvinImg.width
            height: calvinImg.height
            Image {
                id: calvinImg
                source: "images/calvin.png"
            }
            onClicked: appWindow.pageStack.push(goComics)
        }
        MouseArea {
            width: dilbertImg.width
            height: dilbertImg.height
            Image {
                id: dilbertImg
                source: "images/dilbert.png"
            }
            onClicked: appWindow.pageStack.push(dilbert)
        }
        MouseArea {
            width: garfieldImg.width
            height: garfieldImg.height
            Image {
                id: garfieldImg
                source: "images/garfield.png"
            }
            onClicked: appWindow.pageStack.push(goComics)
        }
    }
}
