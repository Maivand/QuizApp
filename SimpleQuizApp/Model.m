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
                         @"fråga" : @"Vem ropar Leif?",
                         @"felsvar1" : @"Tobbe",
                         @"felsvar2" : @"En av dina kompisar",
                         @"felsvar3" : @"öhh?",
                         @"rättsvar" : @"en säl?",
                         };
    
    NSDictionary *q3 = @{
                         @"fråga" : @"Vilken legendarisk munk uppfann champange?",
                         @"felsvar1" : @"Saint Martini",
                         @"felsvar2" : @"Delamotte",
                         @"felsvar3" : @"René-James Lallier",
                         @"rättsvar" : @"Dom Perignon",
                         };
    
    NSDictionary *q4 = @{
                         @"fråga" : @"Vilken är den 7e planeten från solen?",
                         @"felsvar1" : @"Saturn",
                         @"felsvar2" : @"Venus",
                         @"felsvar3" : @"Mars",
                         @"rättsvar" : @"Uranus",
                         };
    NSDictionary *q5 = @{
                         @"fråga" : @"Vilket nr har Ibra på sin united tröja?",
                         @"felsvar1" : @"8",
                         @"felsvar2" : @"11",
                         @"felsvar3" : @"10",
                         @"rättsvar" : @"9",
                         };
    NSDictionary *q6 = @{
                         @"fråga" : @"Vilken typ av insekt är en spansk fluga",
                         @"felsvar1" : @"Fluga",
                         @"felsvar2" : @"Nyckelpiga",
                         @"felsvar3" : @"Häst",
                         @"rättsvar" : @"Skalbagge",
                         };
    NSDictionary *q7 = @{
                         @"fråga" : @"Arabiska siffror har sitt ursprung i vilket land",
                         @"felsvar1" : @"Saudi Arabien",
                         @"felsvar2" : @"Irak",
                         @"felsvar3" : @"Turkiet",
                         @"rättsvar" : @"Indien",
                         };
    NSDictionary *q8 = @{
                         @"fråga" : @"Vilket land uppfann fotboll",
                         @"felsvar1" : @"Tyskland",
                         @"felsvar2" : @"Spanien",
                         @"felsvar3" : @"Italien",
                         @"rättsvar" : @"England",
                         };
    NSDictionary *q9 = @{
                         @"fråga" : @"Vilken nation uppfann kilten?",
                         @"felsvar1" : @"Island",
                         @"felsvar2" : @"England",
                         @"felsvar3" : @"Skotland",
                         @"rättsvar" : @"Irland",
                         };
    NSDictionary *q10 = @{
                         @"fråga" : @"Vilken färg är den svarta lådan på ett plan",
                         @"felsvar1" : @"Grön",
                         @"felsvar2" : @"Blå",
                         @"felsvar3" : @"Svart",
                         @"rättsvar" : @"Orange",
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
