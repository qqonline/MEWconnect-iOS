//
//  MessageSignerModuleInput.h
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 03/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

@import Foundation;
@import ViperMcFlurryX;

@class MEWConnectCommand;
@class AccountPlainObject;

@protocol MessageSignerModuleInput <RamblerViperModuleInput>

- (void) configureModuleWithMessage:(MEWConnectCommand *)message account:(AccountPlainObject *)account;

@end
