//
//  AboutController.swift
//  InfinityTracker
//
//  Created by Marco Boschi on 08/08/2018.
//  Copyright © 2018 Marco Boschi. All rights reserved.
//

import UIKit
import MBLibrary

class AboutController: UITableViewController {
	
	private var appInfo: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        appInfo = NSLocalizedString("REPORT_TEXT", comment: "Report problem") + "\n\nWorkouts Tracker \(AppVersion.currentVersion) (\(AppVersion.bundleVersion))\n© 2019 Qiang Ma"
		
		Appearance.setupNavigationBar(navigationController)
    }
    
	override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
		return appInfo
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		switch (indexPath.section, indexPath.row) {
		case (0, 0):
			UIApplication.shared.open(URL(string: "https://github.com/QiangMaDeveloper/WorkoutsTracker")!)
		default:
			break
		}
		
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
    // MARK: - Navigation

	@IBAction func done(_ sender: AnyObject) {
		dismiss(animated: true, completion: nil)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let id = segue.identifier else {
			return
		}
		
		switch id {
		case "contact":
			let dest = (segue.destination as! UINavigationController).topViewController as! ContactMeViewController
			dest.appName = "Tracker"
		default:
			break
		}
	}

}
