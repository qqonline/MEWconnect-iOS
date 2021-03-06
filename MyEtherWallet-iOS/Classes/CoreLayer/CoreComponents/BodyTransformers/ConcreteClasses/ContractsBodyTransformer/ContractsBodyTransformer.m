//
//  ContractsBodyTransformer.m
//  MyEtherWallet-iOS
//
//  Created by Mikhail Nikanorov on 21/05/2018.
//  Copyright © 2018 MyEtherWallet, Inc. All rights reserved.
//

#if BETA
#import "MyEtherWallet_iOS_Beta-Swift.h"
#else
#import "MyEtherWallet_iOS-Swift.h"
#endif
#import "ContractsBodyTransformer.h"

#import "TokensBody.h"

@implementation ContractsBodyTransformer

- (NSData *)deriveDataFromBody:(TokensBody *)body {
  return [Web3Wrapper contractRequestForAddress:body.address
                              contractAddresses:body.contractAddresses
                                            abi:body.abi
                                         method:body.method
                                        options:@[@(body.nameRequired),
                                                  @(body.websiteRequired),
                                                  @(body.emailRequired),
                                                  @(body.count)]
                              transactionFields:@[@"data", @"to"]];
}

@end
