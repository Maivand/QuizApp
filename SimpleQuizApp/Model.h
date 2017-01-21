//
//  Model.h
//  SimpleQuizApp
//
//  Created by Mavve on 2017-01-17.
//  Copyright © 2017 Mavve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
-(NSDictionary*)setRandomQuestionDictionaryToQQuestion;
-(void)setupData;
@property (nonatomic) NSDictionary *qurentQuestion;
@property (nonatomic) int correctAnswerInt;
@property (nonatomic) int wrongAnswerInt;
-(int)pointIncrementer:(NSString*)answer;
-(bool)checkIfGameOver;
@end
