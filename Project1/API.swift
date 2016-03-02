//
//  API.swift
//  Project1
//
//  Created by Lacey Vu on 2/26/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

typealias APICompletionHandler = (success: Bool, json: [String : AnyObject]) -> ()

class API
{
    static let shared = API()
    private init() {}
    
    let yKeyId = "958f46cf"
    let yKeyAuth = "6b22afe2cbf567bfc13b17095c17152b"
    let yUrlStringForSearch = "http://api.yummly.com/v1/api/recipes?"// THIS
    let yEmptyString = ""

    
    func getRecipes(searchTerm:String?, maxResults: Int? = 20, completion: APICompletionHandler)
    {
        var urlString = ""

        if let searchTerm = searchTerm {
            let updatedSearchTerm = validateSpacesFromSearch(searchTerm)
            urlString = "\(yUrlStringForSearch)_app_id=\(yKeyId)&_app_key=\(yKeyAuth)&q=\(updatedSearchTerm)&maxResult=\(maxResults!)"

        } else {
            urlString = "\(yUrlStringForSearch)_app_id=\(yKeyId)&_app_key=\(yKeyAuth)&maxResult=15&"

        }
        
        self.fetchRequestWithUrlString(urlString) { (success, json) -> () in
            if success{
                completion(success: success, json: json)
            }
        }
        
    }
    
    func fetchRequestWithUrlString(urlString: String, completion: APICompletionHandler)
    {
        let url = NSURL(string: urlString)!
        let request = NSMutableURLRequest(URL: url)

        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            
            if let data = data {
                
                if let json = try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as? [String: AnyObject]{


                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        completion(success: true, json: json)
                    })
                }
                
            }
            
            }.resume()
    }
    
    func validateSpacesFromSearch(originalSearch: String) -> String
    {
        let searchArray = originalSearch.componentsSeparatedByString(" ")
        
        return searchArray.joinWithSeparator("+")
    }
    
    
    
    
    
    func getImage(smallurlString: String, completion: (image: UIImage) -> ())
    {
        let biggerSize = "500"
        let stringArray = smallurlString.componentsSeparatedByString("=")
        if let imageURLString = stringArray.first{
        let urlString = "\(imageURLString)=s\(biggerSize)-c"

        NSOperationQueue().addOperationWithBlock { () -> Void in
            guard let url = NSURL(string: urlString) else { return }
            guard let data = NSData(contentsOfURL: url) else { return }
            guard let image = UIImage(data: data) else { return }
            
            NSOperationQueue.mainQueue().addOperationWithBlock { () -> Void in
                completion(image: image)
            }
        }
        }
    }

    

}
