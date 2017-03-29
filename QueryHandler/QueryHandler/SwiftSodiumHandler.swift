//
//  SwiftSodiumHandler.swift
//  SensorRetrieval
//
//  Created by Keshav Tadimeti on 2/10/16.
//

import Foundation
import Sodium

class SwiftSodiumHandler {
    
    let sodium = Sodium()!
    let signpublicKeyPath = Bundle.main.path(forResource: "sign_public", ofType: "key")
    let encryptpublicKeyPath = Bundle.main.path(forResource: "box_public", ofType: "key")
    
    func verifySignature(_ signedMessage: Data) -> Data? {
        let publicKey = try? Data(contentsOf: URL(fileURLWithPath: signpublicKeyPath!))
        return sodium.sign.open(signedMessage: signedMessage, publicKey: publicKey! as Sign.PublicKey) as Data?
    }
    
    func encryptResponse(_ message: Data) -> Data? {
        do {
            let publicKey:Box.PublicKey = try Data(contentsOf: URL(fileURLWithPath: encryptpublicKeyPath!)) as Box.PublicKey
            return sodium.box.seal(message: message, recipientPublicKey: publicKey)! as Data
        }
        catch {
            // catch the error
            return Data(bytes: [0])
        }
    }
}
