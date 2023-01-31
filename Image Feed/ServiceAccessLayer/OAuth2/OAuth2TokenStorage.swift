import Foundation
import SwiftKeychainWrapper

protocol OAuth2TokenStoring {
    var token: String? { get set }
}
final class OAuth2TokenStorage: OAuth2TokenStoring {
    private let keychainWrapper = KeychainWrapper.standard
    
    var token: String? {
        get {
            let token: String? = keychainWrapper.string(forKey: AuthConfiguration.constants.tokenKey)
            return token
        }
        set {
            if let newValue = newValue {
                keychainWrapper.set(newValue, forKey: AuthConfiguration.constants.tokenKey)
            } else {
                keychainWrapper.removeObject(forKey: AuthConfiguration.constants.tokenKey)
            }
        }
    }
}
