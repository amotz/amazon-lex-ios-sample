//
//  ViewController.swift
//  AmazonLexSample
//
//  Created by amotz on 2017/07/07.
//  Copyright © 2017年 amotz. All rights reserved.
//

import UIKit
import AWSCore
import AWSLex

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let poolId = "xxx:xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxx"
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.USEast1,identityPoolId:poolId)
        let configuration = AWSServiceConfiguration(region:.USEast1, credentialsProvider:credentialsProvider)
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
        let BotName = "LexSample"
        let BotAlias = "LexSampleAlias"
        let chatConfig = AWSLexInteractionKitConfig.defaultInteractionKitConfig(withBotName: BotName, botAlias: BotAlias)
        
        AWSLexInteractionKit.register(with: configuration!, interactionKitConfiguration: chatConfig, forKey: "AWSLexVoiceButton")
        
        chatConfig.autoPlayback = false
        
        AWSLexInteractionKit.register(with: configuration!, interactionKitConfiguration: chatConfig, forKey: "chatConfig")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

