import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    tools: ToolBarLayout {
        ToolIcon {
            platformIconId: "toolbar-back"
            onClicked: appWindow.pageStack.pop()
        }
        ToolIcon {
            platformIconId: "toolbar-previous"
            onClicked: console.log("Previous clicked")
        }
        ToolIcon {
            platformIconId: "toolbar-shuffle"
            onClicked: console.log("Random clicked")
        }
        ToolIcon {
            platformIconId: "toolbar-next"
            onClicked: console.log("Next clicked")
        }
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

    state: (screen.currentOrientation == Screen.Portrait) ? "portrait" : "landscape"

    states: [
        State {
            name: "landscape"
            PropertyChanges {
                target: appWindow
                showStatusBar: false
            }
        },
        State {
            name: "portrait"
            PropertyChanges {
                target: appWindow
                showStatusBar: true
            }
        }
    ]

    Flickable {
        id: imgFlickable
        height: parent.height
        width: parent.width
        contentHeight: image.height
        contentWidth: image.width
        MouseArea {
            height: parent.height
            width: parent.width
            onClicked: {
                if(image.width == imgFlickable.width)
                {
                    image.width = image.sourceSize.width
                    image.height = image.sourceSize.height
                }
                else
                {
                    image.width = imgFlickable.width
                    image.height = imgFlickable.height
                }
            }
            Image {
                id: image
                source: "http://imgs.xkcd.com/comics/citogenesis.png"
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}
