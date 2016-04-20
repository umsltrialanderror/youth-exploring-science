import Foundation

class HTTPRequestHandler: HTTPSessionManagerDelegate {
    
    private var responseClosure: ([AnyObject] -> Void)!
    
    func startWebRequestWithCompletion(closure: ([AnyObject]) -> Void) {
        
        responseClosure = closure
        guard let url = NSURL(string: "https://www.googleapis.com/calendar/v3/calendars/c8tu9s8pfnpkfstv7nu4k6o8bs%40group.calendar.google.com/events/?key=AIzaSyBKovIYC8xeTRFhSTQn83G8GilhhdewYLE") else {
            responseClosure([])
            return
        }
        let request = NSMutableURLRequest(URL: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let sessionManager = HTTPSessionManager(request: request)
        sessionManager.delegate = self
        sessionManager.start()
    }
    
    func sessionFinishedReceivingData(object: NSData?) {
        guard let data = object else {
            responseClosure([])
            return
        }
        do {
            let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String: AnyObject]
            
            if let returnData = jsonData["items"] as? [NSDictionary] {
                responseClosure(returnData)
            } else {
                responseClosure([["error": "Invalid data"]])
            }
        } catch {
            responseClosure([["error" : "Error Parsing JSON"]])
        }
    }
    
    func sessionFailedWithError(error: NSError?) {
        
    }
    
}

//MARK: - HTTP Session Manager Enclosed Delegate
protocol HTTPSessionManagerDelegate: class {
    func sessionFinishedReceivingData(object: NSData?)
    func sessionFailedWithError(error: NSError?)
}
//MARK: - HTTP Session Manager Enclosed Class
class HTTPSessionManager : NSObject, NSURLSessionDelegate, NSURLSessionDataDelegate {
    
    var returnData: NSMutableData?
    var delegate: HTTPSessionManagerDelegate!
    let internalRequest: NSURLRequest!
    var dataTask: NSURLSessionDataTask!
    var statusCode = 500
    
    required init(request: NSURLRequest) {
        internalRequest = request
    }
    
    func start() {
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: configuration, delegate: self, delegateQueue: NSOperationQueue.mainQueue())
        dataTask = session.dataTaskWithRequest(internalRequest)
        dataTask.resume()
    }
    
    func cancel() {
        dataTask.cancel()
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveResponse response: NSURLResponse, completionHandler: (NSURLSessionResponseDisposition) -> Void) {
        print("Connection did receive response: \(response)")
        
        if let httpResponse = response as? NSHTTPURLResponse {
            statusCode = httpResponse.statusCode
        }
        completionHandler(NSURLSessionResponseDisposition.Allow)
    }
    
    func URLSession(session: NSURLSession, dataTask: NSURLSessionDataTask, didReceiveData data: NSData) {
        if returnData == nil {
            returnData = NSMutableData()
        }
        returnData!.appendData(data)
    }
    
    func URLSession(session: NSURLSession, task: NSURLSessionTask, didCompleteWithError error: NSError?) {
        if error == nil {
            if statusCode == 401 {
                let unauthorizedError = NSError(domain: "AuthorizationError", code: statusCode, userInfo: [NSLocalizedDescriptionKey : "Unauthorized access to server resource."])
                self.delegate.sessionFailedWithError(unauthorizedError)
            } else if statusCode == 200 || statusCode == 201 {
                self.delegate.sessionFinishedReceivingData(returnData)
            } else if statusCode == 503 {
                let serviceDown = NSError(domain: "ServiceError", code: statusCode, userInfo: [NSLocalizedDescriptionKey :"503 Service is unavailable."])
                self.delegate.sessionFailedWithError(serviceDown)
            }
        } else {
            if statusCode == 401 {
                let unauthorizedError = NSError(domain: "AuthorizationError", code: statusCode, userInfo: nil)
                unauthorizedError.setValue("Unauthorized access to resource", forKey: NSLocalizedDescriptionKey)
                self.delegate.sessionFailedWithError(unauthorizedError)
            } else {
                self.delegate.sessionFailedWithError(error)
            }
        }
    }
}