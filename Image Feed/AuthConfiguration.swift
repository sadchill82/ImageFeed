import Foundation

let AccessKey = "66ifq6ApgtDPRs5i_2UKl5SBYuJD7Uyd3z6oXnQVGiE"
let SecretKey = "ycMHBGmZwTBPQGTieDqZQflJn0Ot91tMeGE1Q414s0U"
let RedirectURI = "urn:ietf:wg:oauth:2.0:oob"
let AccessScope = "public+read_user+write_likes"
let DefaultBaseURL = URL(string: "https://api.unsplash.com")!
let UnsplashAuthString = "https://unsplash.com/oauth/authorize"
let OauthString = "https://unsplash.com/oauth/token"
let TokenKey = "Auth token"
let GetPhotosURL = "https://api.unsplash.com/photos"

struct AuthConfiguration {
    let accessKey: String
    let secretKey: String
    let redirectURI: String
    let accessScope: String
    let defaultBaseURL: URL
    let authURLString: String
    let oauthString: String
    let tokenKey: String
    let getPhotosURL: String
    
    
    init(accessKey: String, secretKey: String, redirectURI: String, accessScope: String, authURLString: String, defaultBaseURL: URL , oauthString: String, tokenKey: String, getPhotosURL: String) {
        self.accessKey = accessKey
        self.secretKey = secretKey
        self.redirectURI = redirectURI
        self.accessScope = accessScope
        self.defaultBaseURL = defaultBaseURL
        self.authURLString = authURLString
        self.oauthString = oauthString
        self.tokenKey = tokenKey
        self.getPhotosURL = getPhotosURL
    }
    
    static var constants: AuthConfiguration {
        return AuthConfiguration(accessKey: AccessKey,
                                 secretKey: SecretKey,
                                 redirectURI: RedirectURI,
                                 accessScope: AccessScope,
                                 authURLString: UnsplashAuthString,
                                 defaultBaseURL: DefaultBaseURL,
                                 oauthString: OauthString,
                                 tokenKey: TokenKey,
                                 getPhotosURL: GetPhotosURL
        )
    }
}
