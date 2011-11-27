import QtQuick 1.1
import com.nokia.meego 1.0
import Komedia 1.0

Page {
    Xkcd {
        id: xkcd
        onEnableButtons: {
            prev.enabled = true
            next.enabled = true
            random.enabled = true
        }
    }

    tools: ToolBarLayout {
        ToolIcon {
            platformIconId: "toolbar-back"
            onClicked: appWindow.pageStack.pop()
        }
        ToolIcon {
            platformIconId: "toolbar-grid"
            onClicked: {
                if(altText.visible == false)
                    altText.visible = true
                else
                    altText.visible = false
            }
        }
        ToolIcon {
            id: prev
            platformIconId: "toolbar-previous"
            onClicked: xkcd.prev()
            enabled: false
        }
        ToolIcon {
            id: random
            platformIconId: "toolbar-shuffle"
            onClicked: xkcd.random()
            enabled: false
        }
        ToolIcon {
            id: next
            platformIconId: "toolbar-next"
            onClicked: xkcd.next()
            enabled: false
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
                target: altFlickable
                height: 80
            }
            PropertyChanges {
                target: appWindow
                showStatusBar: false
            }
        },
        State {
            name: "portrait"
            PropertyChanges {
                target: altFlickable
                height: 200
            }
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
                source: xkcd.comicUrl
                fillMode: Image.PreserveAspectFit
            }
        }
    }

    Flickable {
        id: altFlickable
        anchors.bottom: parent.bottom
        height: 200
        width: parent.width
        contentHeight: altText.height
        contentWidth: parent.width
        TextArea {
            id: altText
            text: xkcd.altText
            visible: false
            anchors.fill: parent
            readOnly: true
            height: parent.height
        }
    }
}
