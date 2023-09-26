//
//  LoginViewController.swift
//  Food App
//
//  Created by Hatem on 15/09/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MealsViewController")
        navigationController?.pushViewController(vc, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
