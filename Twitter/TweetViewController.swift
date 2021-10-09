//
//  TweetViewController.swift
//  Twitter
//
//  Created by Iris on 10/1/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tweetTextView: UITextView!
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (Error) in
                print("Error posting tweets \(Error)")
                self.dismiss(animated: true, completion: nil)

            })
        } else {
            self.dismiss(animated: true, completion: nil)

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()


        // Do any additional setup after loading the view.
    }
    
}
