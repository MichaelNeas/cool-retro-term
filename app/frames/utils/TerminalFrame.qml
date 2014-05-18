import QtQuick 2.2

Item{
    id: framecontainer
    property int addedWidth
    property int addedHeight
    property int borderLeft
    property int borderRight
    property int borderTop
    property int borderBottom
    property string imageSource
    property string normalsSource
    property rect sourceRect
    property string shaderString

    //Value used to create the rect used to add the border to the texture
    property real rectX
    property real rectY

    //Values used to displace the texture in the screen. Used to make reflections correct.
    property real displacementLeft
    property real displacementTop
    property real displacementRight
    property real displacementBottom

    property real distortionCoefficient

    BorderImage{
        id: frameimage
        anchors.centerIn: parent
        width: parent.width + addedWidth
        height: parent.height + addedHeight

        border.bottom: borderBottom
        border.top: borderTop
        border.left: borderLeft
        border.right: borderRight

        source: imageSource
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
    }
    BorderImage{
        id: framenormals
        anchors.fill: frameimage

        border.bottom: borderBottom
        border.top: borderTop
        border.left: borderLeft
        border.right: borderRight

        source: normalsSource
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
    }
    ShaderEffectSource{
        id: framesource
        sourceItem: frameimage
        hideSource: true
    }
    ShaderEffectSource{
        id: framesourcenormals
        sourceItem: framenormals
        hideSource: true
    }
    Loader{
        anchors.fill: frameimage
        source: shaderString
    }
}