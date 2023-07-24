//
//  ViewController.swift
//  Marathon8thTask
//
//  Created by Артем Соколовский on 22.07.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1000)
        scrollView.delegate = self
        return scrollView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
		
		imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person.crop.circle.fill")
		imageView.tintColor = .systemGray
		imageView.clipsToBounds = true
		
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

		title = "Avatar"

		view = scrollView
		view.backgroundColor = .white
		
		scrollView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
		
		guard let navigationBar = navigationController?.navigationBar else { return }
		
		for subview in navigationBar.subviews {
			if NSStringFromClass(subview.classForCoder).contains("UINavigationBarLargeTitleView") {
				
				subview.addSubview(imageView)
				
				let right = imageView.rightAnchor.constraint(equalTo: subview.rightAnchor, constant: -20)
				let top = imageView.topAnchor.constraint(equalTo: subview.bottomAnchor, constant: 20)
				let bottom = imageView.bottomAnchor.constraint(equalTo: imageView.superview?.bottomAnchor ?? navigationBar.bottomAnchor, constant: -10)
				let height = imageView.heightAnchor.constraint(equalToConstant: 36)
				let width = imageView.widthAnchor.constraint(equalToConstant: 36)
				
				let constraints = [right, top, bottom, height, width]
				
				NSLayoutConstraint.activate(constraints)
			}
		}
    }
}
