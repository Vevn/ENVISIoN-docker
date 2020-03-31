function Controller() {
    installer.autoRejectMessageBoxes();
    installer.installationFinished.connect(function() {
        gui.clickButton(buttons.NextButton);
    })
}

Controller.prototype.WelcomePageCallback = function() {
    console.log("Welcome Page");
    gui.clickButton(buttons.NextButton, 3000);
}

Controller.prototype.CredentialsPageCallback = function() {
    var page = gui.pageWidgetByObjectName("CredentialsPage");
    page.loginWidget.EmailLineEdit.setText("");
    page.loginWidget.PasswordLineEdit.setText("");
    gui.clickButton( buttons.NextButton);
}

Controller.prototype.ObligationsPageCallback = function() {
    console.log("Obligations Page");

    var page = gui.pageWidgetByObjectName("ObligationsPage");
    page.obligationsAgreement.setChecked(true);
    page.completeChanged();
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.IntroductionPageCallback = function() {
    console.log("Introduction Page");

    gui.clickButton(buttons.NextButton);
}

Controller.prototype.TargetDirectoryPageCallback = function() {
    console.log("Target Directory Page");

    gui.currentPageWidget().TargetDirectoryLineEdit.setText("/opt/Qt");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ComponentSelectionPageCallback = function() {
    console.log("Component Selection Page");

    var widget = gui.currentPageWidget();

    widget.deselectAll();
    widget.selectComponent("qt.qt5.5141.gcc_64");

    gui.clickButton(buttons.NextButton);
}

Controller.prototype.LicenseAgreementPageCallback = function() {
    console.log("License Agreement Page");

    gui.currentPageWidget().AcceptLicenseRadioButton.setChecked(true);
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.StartMenuDirectoryPageCallback = function() {
    console.log("Start Menu Directory Page");
    gui.clickButton(buttons.NextButton);
}

Controller.prototype.ReadyForInstallationPageCallback = function() {
    console.log("Ready to install Page");
    gui.clickButton(buttons.CommitButton);
}

Controller.prototype.FinishedPageCallback = function() {
    console.log("Finished Page");

    var widget = gui.currentPageWidget();
    if (widget.LaunchQtCreatorCheckBoxForm) {
        widget.LaunchQtCreatorCheckBoxForm.launchQtCreatorCheckBox.setChecked(false);
    }
    gui.clickButton(buttons.FinishButton);
}
