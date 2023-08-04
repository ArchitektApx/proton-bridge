// Copyright (c) 2023 Proton AG
// This file is part of Proton Mail Bridge.
// Proton Mail Bridge is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// Proton Mail Bridge is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// You should have received a copy of the GNU General Public License
// along with Proton Mail Bridge. If not, see <https://www.gnu.org/licenses/>.
import QtQml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.impl
import "." as Proton
import ".."

Item {
    id: root

    property ColorScheme colorScheme

    function showLogin2FA() {
        descriptionLabel.text = qsTr("You have enabled two-factor authentication. Please enter the 6-digit code provided by your authenticator application.");
        linkLabel1.linkText = "";
        linkLabel1.linkURL = "";
        linkLabel2.linkText = "";
        linkLabel2.linkURL = "";
        showLoginCommon();
    }
    function showClientSelector() {
        titleLabel.text = qsTr("Configure your email client");
        descriptionLabel.text = qsTr("Bridge is now connected to Proton, and has already started downloading your messages. Let’s now connect your email client to Bridge.");
        linkLabel1.linkText = qsTr("Why do");
        linkLabel1.linkURL = "https://proton.me";
        linkLabel2.linkText = qsTr("I need");
        linkLabel2.linkURL = "https://proton.me";
        icon.source = "/qml/icons/img-mail-clients.svg";
        icon.sourceSize.height = 128;
        icon.sourceSize.width = 128;
        Layout.preferredHeight = 72;
        Layout.preferredWidth = 72;
    }
    function showLoginCommon() {
        titleLabel.text = qsTr("Sign in to your Proton Account");
        icon.Layout.preferredHeight = 72;
        icon.Layout.preferredWidth = 72;
        icon.source = "/qml/icons/ic-bridge.svg";
        icon.sourceSize.height = 128;
        icon.sourceSize.width = 128;
    }
    function showLoginMailboxPassword() {
        root.description = qsTr("You have secured your account with a separate mailbox password.");
        linkLabel1.linkText = "";
        linkLabel1.linkURL = "";
        linkLabel2.linkText = "";
        linkLabel2.linkURL = "";
        showLoginCommon();
    }
    function showOnboarding() {
        titleLabel.text = qsTr("Welcome to\nProton Mail Bridge");
        descriptionLabel.text = qsTr("Bridge is the gateway between your Proton account and your email client. It runs in the background and encrypts and decrypts your messages seamlessly. ");
        linkLabel1.linkText = qsTr("Why do I need Bridge?");
        linkLabel1.linkURL = "https://proton.me/support/bridge";
        linkLabel2.linkText = "";
        linkLabel2.linkURL = "";
        icon.Layout.preferredHeight = 148;
        icon.Layout.preferredWidth = 265;
        icon.source = "/qml/icons/img-welcome.svg";
        icon.sourceSize.height = 148;
        icon.sourceSize.width = 265;
    }
    function showLogin() {
        descriptionLabel.text = qsTr("Let's start by signing in to your Proton account.");
        linkLabel1.linkText = qsTr("Create or upgrade your account");
        linkLabel1.linkURL = "https://proton.me/mail/pricing";
        linkLabel2.linkText = "";
        linkLabel2.linkURL = "";
        showLoginCommon();
    }
    Connections {
        function onLogin2FARequested() {
            showLogin2FA();
        }
        function onLogin2PasswordRequested() {
            showLoginMailboxPassword();
        }

        target: Backend
    }
    ColumnLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        spacing: 0

        Image {
            id: icon
            Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
            Layout.preferredHeight: 72
            Layout.preferredWidth: 72
            fillMode: Image.PreserveAspectFit
            source: ""
            sourceSize.height: 72
            sourceSize.width: 72
        }
        Label {
            id: titleLabel
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            Layout.topMargin: 16
            colorScheme: root.colorScheme
            horizontalAlignment: Text.AlignHCenter
            text: ""
            type: Label.LabelType.Heading
            wrapMode: Text.WordWrap
        }
        Label {
            id: descriptionLabel
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            Layout.topMargin: 96
            colorScheme: root.colorScheme
            horizontalAlignment: Text.AlignHCenter
            text: ""
            type: Label.LabelType.Body
            wrapMode: Text.WordWrap
        }
        LinkLabel {
            id: linkLabel1
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 96
            colorScheme: root.colorScheme
            visible: (text !== "")
        }
        LinkLabel {
            id: linkLabel2
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: 16
            colorScheme: root.colorScheme
            visible: (text !== "")
        }
    }
}
