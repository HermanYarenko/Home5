//
//  ProfileViewContoller.swift
//  HomeWorkIOS
//
//  Created by Герман Яренко on 1.12.23.
//



import UIKit

final class ProfileViewController: UIViewController {
    private var person: Profile?
    
    private var personImageView = UIImageView()
    
    private var personFullName: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Profile"
        
        NetworkService().getProfileData{ [weak self] person in
            self?.person = person
            
            DispatchQueue.main.async {
                self?.personFullName.text = (self?.person?.firstName ?? "") + " " + (self?.person?.lastName ?? "")
            }
            DispatchQueue.global().async {
                if let url = URL(string: self?.person?.photo ?? ""),
                   let data = try? Data(contentsOf: url)
                {
                    DispatchQueue.main.async {
                        self?.personImageView.image = UIImage(data: data)
                    }
                }
            }
        }
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(personImageView)
        view.addSubview(personFullName)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        personImageView.translatesAutoresizingMaskIntoConstraints = false
        personFullName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            personImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            personImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            personImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            personImageView.heightAnchor.constraint(equalToConstant: view.frame.size.width / 2),
            
            personFullName.topAnchor.constraint(equalTo: personImageView.bottomAnchor, constant: 10),
            personFullName.centerXAnchor.constraint(equalTo: personImageView.centerXAnchor)
            
        ])
    }
}
