//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by John Erick Santos on 18/6/2023.
//

import UIKit

struct SettingCellModel {
    let title: String
    let handler: () -> Void
}

final class SettingsViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        return tableView
    }()

    private var data = [[SettingCellModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubviews(tableView)

        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        tableView.frame = view.bounds
    }

    private func configureModels() {
        let section = [
            SettingCellModel(title: "Log Out") { [weak self] in
                self?.didTapLogOut()
            }
        ]

        data.append(section)
    }

    private func didTapLogOut() {
        AuthManager.shared.logOut { isLoggedOut in
            DispatchQueue.main.async {
                if isLoggedOut {
                    let loginVC = LoginViewController()
                    loginVC.modalPresentationStyle = .fullScreen
                    self.present(loginVC, animated: true) {
                        self.navigationController?.popToRootViewController(animated: false)
                        self.tabBarController?.selectedIndex = 0
                    }
                } else {
                    // error in logging out
                }
            }
        }
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // handle cell selection
        tableView.deselectRow(at: indexPath, animated: true)

        let settingCellModel = data[indexPath.section][indexPath.row]
        settingCellModel.handler()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
}
