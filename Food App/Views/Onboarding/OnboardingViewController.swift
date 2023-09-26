//
//  OnboardingViewController.swift
//  Food App
//
//  Created by Hatem on 14/09/2023.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControll: UIPageControl!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    var slides : [OnBoardingSlide] = []

    var currentPage = 0 {
        didSet {
            pageControll.currentPage = currentPage
//            if currentPage == slides.count - 1 {
//                nextBtn.setTitle("Get Started", for: .normal)
//            } else {
//                nextBtn.setTitle("Next", for: .normal)
//            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        slides = [
                    OnBoardingSlide(title: "Browse your menu and order directly", description: "Our app can send you everywhere, even space. For only $2.99 per month", image: #imageLiteral(resourceName: "Group 1")),
                    OnBoardingSlide(title: "Even to space with us! Together", description: "Our app can send you everywhere, even space. For only $2.99 per month", image: #imageLiteral(resourceName: "Group 2")),
                    OnBoardingSlide(title: "Pickup delivery at your door", description: "Our app can send you everywhere, even space. For only $2.99 per month", image: #imageLiteral(resourceName: "Group 3") )
                    
                ]
        pageControll.numberOfPages = slides.count
        
   
    }
    

    @IBAction func nextButtonClicked(_ sender: UIButton) {
        
        if currentPage == slides.count - 1 {
            let controller = storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnborded = true
            present(controller, animated: true)
            
        }else {
            currentPage += 1
            let indexpath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
        }
        
    }
    

}
extension OnboardingViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
    
}
