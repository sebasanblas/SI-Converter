//
//  AppDelegate.swift
//  SI Converter
//
//  Created by Sebastian San Blas on 28/05/2021.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindow: NSWindowController?

    @IBOutlet weak var window: NSWindow!

    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
            if !flag {
                for mainWindow: AnyObject in sender.windows {
                    mainWindow.makeKeyAndOrderFront(self)
            }
        }
        return true
    }

}
