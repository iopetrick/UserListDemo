//
//  UserDetailViewController.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 21/05/23.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var imageviewProfile: UIImageView!
    @IBOutlet weak var labelAge: UILabel!

    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelDOJ: UILabel!
    @IBOutlet weak var labelDOB: UILabel!
    
    
    @IBOutlet weak var labelCity: UILabel!
    @IBOutlet weak var labelState: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var labelPostcode: UILabel!
    
    var viewModel: UserDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        
        let backButton = UIBarButtonItem(image: UIImage(named: "ic_left"),
                                         style: UIBarButtonItem.Style.plain,
                                         target: self,
                                         action: #selector(buttonClickedBack))
        backButton.tintColor = UIColor.label
        self.navigationItem.leftBarButtonItem = backButton
        
        self.viewModel.closureUpdateUI = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.fillUI()
        }
        self.viewModel.viewDidLoad()
    }
    
    @objc func buttonClickedBack() {
        self.coordinator?.popViewController()
    }
    
    private func fillUI() {
        
        self.title = viewModel.fullName
        
        if let url = viewModel.imageURL {
            viewModel.imageLoader.loadImage(url: url, imageView: imageviewProfile)
        }
        labelAge.text = viewModel.age
        
        labelEmail.text = viewModel.email
        labelDOJ.text = viewModel.dateOfJoined
        labelDOB.text = viewModel.dateOfBirth
        
        labelCity.text = viewModel.city
        labelState.text = viewModel.state
        labelCountry.text = viewModel.country
        labelPostcode.text = viewModel.postcode
    }
}
