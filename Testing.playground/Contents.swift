//: Playground - noun: a place where people can play

import UIKit
import XCPlayground


XCPSetExecutionShouldContinueIndefinitely()


let chatPost = "http://108.197.28.233/scripts/chat_post.php"
let url = NSURL(string: chatPost)
let request = NSURLRequest(URL: url!)

NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
    (response, data, error) in
    print(NSString(data: data!, encoding: NSUTF8StringEncoding))
}

