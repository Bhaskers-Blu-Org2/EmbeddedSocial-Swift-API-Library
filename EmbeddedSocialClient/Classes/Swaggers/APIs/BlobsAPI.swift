//
// BlobsAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation
import Alamofire


open class BlobsAPI: APIBase {
    /**
     Get blob
     - parameter blobHandle: (path) Blob handle 
     - parameter authorization: (header) Format is: \&quot;Scheme CredentialsList\&quot;. Possible values are:  - Anon AK&#x3D;AppKey  - SocialPlus TK&#x3D;SessionToken  - Facebook AK&#x3D;AppKey|TK&#x3D;AccessToken  - Google AK&#x3D;AppKey|TK&#x3D;AccessToken  - Twitter AK&#x3D;AppKey|RT&#x3D;RequestToken|TK&#x3D;AccessToken  - Microsoft AK&#x3D;AppKey|TK&#x3D;AccessToken  - AADS2S AK&#x3D;AppKey|[UH&#x3D;UserHandle]|TK&#x3D;AADToken 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func blobsGetBlob(blobHandle: String, authorization: String, completion: @escaping ((_ data: URL?, _ error: ErrorResponse?) -> Void)) {
        blobsGetBlobWithRequestBuilder(blobHandle: blobHandle, authorization: authorization).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Get blob
     - GET /v0.7/blobs/{blobHandle}

     - examples: [{output=none}]
     - parameter blobHandle: (path) Blob handle 
     - parameter authorization: (header) Format is: \&quot;Scheme CredentialsList\&quot;. Possible values are:  - Anon AK&#x3D;AppKey  - SocialPlus TK&#x3D;SessionToken  - Facebook AK&#x3D;AppKey|TK&#x3D;AccessToken  - Google AK&#x3D;AppKey|TK&#x3D;AccessToken  - Twitter AK&#x3D;AppKey|RT&#x3D;RequestToken|TK&#x3D;AccessToken  - Microsoft AK&#x3D;AppKey|TK&#x3D;AccessToken  - AADS2S AK&#x3D;AppKey|[UH&#x3D;UserHandle]|TK&#x3D;AADToken 
     - returns: RequestBuilder<URL> 
     */
    open class func blobsGetBlobWithRequestBuilder(blobHandle: String, authorization: String) -> RequestBuilder<URL> {
        var path = "/v0.7/blobs/{blobHandle}"
        path = path.replacingOccurrences(of: "{blobHandle}", with: "\(blobHandle)", options: .literal, range: nil)
        let URLString = EmbeddedSocialClientAPI.basePath + path
        let parameters: [String:Any]? = nil

        let url = NSURLComponents(string: URLString)
        let nillableHeaders: [String: Any?] = [
            "Authorization": authorization
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<URL>.Type = EmbeddedSocialClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: (url?.string ?? URLString), parameters: parameters, isBody: false, headers: headerParameters)
    }

    /**
     Upload a blob
     - parameter authorization: (header) Format is: \&quot;Scheme CredentialsList\&quot;. Possible values are:  - Anon AK&#x3D;AppKey  - SocialPlus TK&#x3D;SessionToken  - Facebook AK&#x3D;AppKey|TK&#x3D;AccessToken  - Google AK&#x3D;AppKey|TK&#x3D;AccessToken  - Twitter AK&#x3D;AppKey|RT&#x3D;RequestToken|TK&#x3D;AccessToken  - Microsoft AK&#x3D;AppKey|TK&#x3D;AccessToken  - AADS2S AK&#x3D;AppKey|[UH&#x3D;UserHandle]|TK&#x3D;AADToken 
     - parameter blob: (body) MIME encoded contents of the blob 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func blobsPostBlob(authorization: String, blob: Data, completion: @escaping ((_ data: PostBlobResponse?, _ error: ErrorResponse?) -> Void)) {
        blobsPostBlobWithRequestBuilder(authorization: authorization, blob: blob).execute { (response, error) -> Void in
            completion(response?.body, error)
        }
    }


    /**
     Upload a blob
     - POST /v0.7/blobs
     - If your blob is an image, use image APIs. For all other blob types, use this API.

     - examples: [{contentType=application/json, example={
  "blobHandle" : "aeiou"
}}, {contentType=application/xml, example=<null>
  <blobHandle>aeiou</blobHandle>
</null>}]
     - examples: [{contentType=application/json, example={
  "blobHandle" : "aeiou"
}}, {contentType=application/xml, example=<null>
  <blobHandle>aeiou</blobHandle>
</null>}]
     - parameter authorization: (header) Format is: \&quot;Scheme CredentialsList\&quot;. Possible values are:  - Anon AK&#x3D;AppKey  - SocialPlus TK&#x3D;SessionToken  - Facebook AK&#x3D;AppKey|TK&#x3D;AccessToken  - Google AK&#x3D;AppKey|TK&#x3D;AccessToken  - Twitter AK&#x3D;AppKey|RT&#x3D;RequestToken|TK&#x3D;AccessToken  - Microsoft AK&#x3D;AppKey|TK&#x3D;AccessToken  - AADS2S AK&#x3D;AppKey|[UH&#x3D;UserHandle]|TK&#x3D;AADToken 
     - parameter blob: (body) MIME encoded contents of the blob 
     - returns: RequestBuilder<PostBlobResponse> 
     */
    open class func blobsPostBlobWithRequestBuilder(authorization: String, blob: Data) -> RequestBuilder<PostBlobResponse> {
        let path = "/v0.7/blobs"
        let URLString = EmbeddedSocialClientAPI.basePath + path
        let parameters = blob.encodeToJSON() as? [String:AnyObject]

        let url = NSURLComponents(string: URLString)
        let nillableHeaders: [String: Any?] = [
            "Authorization": authorization
        ]
        let headerParameters = APIHelper.rejectNilHeaders(nillableHeaders)

        let requestBuilder: RequestBuilder<PostBlobResponse>.Type = EmbeddedSocialClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", URLString: (url?.string ?? URLString), parameters: parameters, isBody: true, headers: headerParameters)
    }

}
