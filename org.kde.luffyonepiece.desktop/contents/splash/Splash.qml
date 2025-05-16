import QtQuick 2.5
import QtQuick.Window 2.2

Rectangle {
    id: root
    color: "#161616"

    // Container with 16:9 aspect ratio, centered and maximized within the window
    Item {
        id: aspectContainer
        anchors.centerIn: parent

        readonly property real maxW: root.width
        readonly property real maxH: root.height
        readonly property real targetW: Math.min(maxW, maxH * 16 / 9)
        readonly property real targetH: Math.min(maxH, maxW * 9 / 16)
        width: targetW
        height: targetH

        // Animated GIF centered and scaled with aspect ratio preserved
        AnimatedImage {
            id: luffyGif
            anchors.fill: parent
            source: "images/luffy.gif"
            fillMode: Image.PreserveAspectFit
            cache: false
            playing: true
            smooth: true
        }

        // Loading spinner at the bottom center
        Image {
            id: busyIndicator
            source: "images/loading.svgz"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            width: 48
            height: 48

            RotationAnimator on rotation {
                id: rotationAnimator
                from: 0
                to: 360
                duration: 1500
                loops: Animation.Infinite
                running: true
            }
        }
    }

    // Fade-in animation for content (optional)
    OpacityAnimator {
        id: introAnimation
        running: true
        target: aspectContainer
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
