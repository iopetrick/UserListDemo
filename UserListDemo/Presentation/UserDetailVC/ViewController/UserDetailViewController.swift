//
//  UserDetailViewController.swift
//  UserListDemo
//
//  Created by Pratikkumar Prajapati on 21/05/23.
//

import UIKit

class UserDetailViewController: UIViewController {
    
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

        // Do any additional setup after loading the view.
    }

    func setupView() {
        
        self.viewModel.closureUpdateUI = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.fillUI()
        }
    }
    
    private func fillUI() {
        
        self.title = viewModel.fullName
        
        if let url = viewModel.imageURL {
            viewModel.imageLoader.loadImage(url: url, imageView: imageviewProfile)
        }
        
        labelEmail.text = viewModel.email
        labelDOJ.text = viewModel.email
        labelDOB.text = viewModel.email
        
        labelCity.text = viewModel.city
        labelState.text = viewModel.state
        labelCountry.text = viewModel.country
        labelPostcode.text = viewModel.postcode
    }
}
