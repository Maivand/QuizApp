//
//  Model.m
//  SimpleQuizApp
//
//  Created by Mavve on 2017-01-17.
//  Copyright © 2017 Mavve. All rights reserved.
//

#import "Model.h"

@interface Model()
@property (nonatomic) NSMutableArray *questionsArray;
@property (nonatomic) int randomNr;

@end

@implementation Model


-(void)setupData{
    
    NSDictionary *q1 = @{
                         @"fråga" : @"Vilket OS är värdelöst?",
                         @"felsvar1" : @"Enigma",
                         @"felsvar2" : @"MacOs",
                         @"felsvar3" : @"Linux",
                         @"rättsvar" : @"Windows",
                         };
    
    NSDictionary *q2 = @{
                         @"fråga" : @"Vem ropar på Leif?",
                         @"felsvar1" : @"Tobbe",
                         @"felsvar2" : @"En av dina kompisar",
                         @"felsvar3" : @"öhh?",
                         @"rättsvar" : @"en säl?",
                         };
    
    NSDictionary *q3 = @{
                         @"fråga" : @"Frågan är 3",
                         @"felsvar1" : @"svar13",
                         @"felsvar2" : @"svar23",
                         @"felsvar3" : @"svar33",
                         @"rättsvar" : @"svar43",
                         };
    
    NSDictionary *q4 = @{
                         @"fråga" : @"Frågan är 4",
                         @"felsvar1" : @"svar14",
                         @"felsvar2" : @"svar24",
                         @"felsvar3" : @"svar34",
                         @"rättsvar" : @"svar44",
                         };
    NSDictionary *q5 = @{
                         @"fråga" : @"Frågan är 5",
                         @"felsvar1" : @"svar14",
                         @"felsvar2" : @"svar24",
                         @"felsvar3" : @"svar34",
                         @"rättsvar" : @"svar44",
                         };
    NSDictionary *q6 = @{
                         @"fråga" : @"Frågan är 6",
                         @"felsvar1" : @"svar14",
                         @"felsvar2" : @"svar24",
                         @"felsvar3" : @"svar34",
                         @"rättsvar" : @"svar44",
                         };
    NSDictionary *q7 = @{
                         @"fråga" : @"Frågan är 7",
                         @"felsvar1" : @"svar14",
                         @"felsvar2" : @"svar24",
                         @"felsvar3" : @"svar34",
                         @"rättsvar" : @"svar44",
                         };
    NSDictionary *q8 = @{
                         @"fråga" : @"Frågan är 8",
                         @"felsvar1" : @"svar14",
                         @"felsvar2" : @"svar24",
                         @"felsvar3" : @"svar34",
                         @"rättsvar" : @"svar44",
                         };
    NSDictionary *q9 = @{
                         @"fråga" : @"Frågan är 9",
                         @"felsvar1" : @"svar14",
                         @"felsvar2" : @"svar24",
                         @"felsvar3" : @"svar34",
                         @"rättsvar" : @"svar44",
                         };
    NSDictionary *q10 = @{
                         @"fråga" : @"Frågan är 10",
                         @"felsvar1" : @"svar14",
                         @"felsvar2" : @"svar24",
                         @"felsvar3" : @"svar34",
                         @"rättsvar" : @"svar44",
                         };
    
    self.questionsArray = [NSMutableArray arrayWithObjects:
                           q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,nil];
    
    }

-(NSDictionary*)randomArrayElement:(NSArray*)array {
    self.randomNr = rand() % array.count;
    return array[self.randomNr];
}

-(NSDictionary*)setRandomQuestionDictionaryToQQuestion{
    self.qurentQuestion = [self randomArrayElement:self.questionsArray];
    [self.questionsArray removeObjectAtIndex:self.randomNr];
    return self.qurentQuestion;
    
}

-(int)pointIncrementer:(NSString*)answer {
    if (answer == self.qurentQuestion[@"rättsvar"]) {
        self.correctAnswerInt++;
        NSLog(@"rättsvar valt");
        return self.correctAnswerInt;
    }
    else{
        NSLog(@"felsvar valt");
        self.wrongAnswerInt++;
        return self.wrongAnswerInt;
    }
}
//TODO:fixa denna
-(bool)checkIfGameOver{
    if (self.correctAnswerInt + self.wrongAnswerInt == 5) {
        return YES;
    }
    return NO;
}



@end
