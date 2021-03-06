//
//  ViewController.m
//  SimpleQuizApp
//
//  Created by Mavve on 2017-01-17.
//  Copyright © 2017 Mavve. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()
@property (nonatomic) Model *model;
@property (weak, nonatomic) IBOutlet UIButton *btnOne;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *btnTwo;
@property (weak, nonatomic) IBOutlet UIButton *btnThree;
@property (weak, nonatomic) IBOutlet UIButton *btnFour;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestionBtn;
@property (weak, nonatomic) IBOutlet UILabel *correctPointsLabel;
@property (weak, nonatomic) IBOutlet UILabel *wrongeAnswerLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerInfoLabel;
@property (weak, nonatomic) IBOutlet UIButton *startNewGameBtn;
@property (nonatomic) NSMutableArray *shuffleStringArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[Model alloc]init];
    [self.model setupData];
    [self.model setRandomQuestionDictionaryToQQuestion];
    [self setQuestionsAndAnswersToView];
    self.startNewGameBtn.hidden = YES;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)CheckAnswer:(UIButton *)sender {
    
    UIButton* btn = (UIButton*)sender;
    
    [self.model pointIncrementer:btn.titleLabel.text];
    
        self.correctPointsLabel.text =[NSString stringWithFormat:@"%i", self.model.correctAnswerInt];
        
        self.wrongeAnswerLabel.text =[NSString stringWithFormat:@"%i", self.model.wrongAnswerInt];
    
    if ([btn.titleLabel.text isEqualToString: self.model.qurentQuestion[@"rättsvar"]]) {
        self.answerInfoLabel.text =@"RÄTT SVAR";
        btn.backgroundColor = [UIColor greenColor];
        [self endGameChecker:self.model.checkIfGameOver];
        self.nextQuestionBtn.hidden = NO;
        //if gameover hidebutton nextquestion
        if (self.model.checkIfGameOver == YES) {
            self.nextQuestionBtn.hidden = YES;
        }
    }else {
        self.answerInfoLabel.text =@"FEL FEL FEL!";
        btn.backgroundColor = [UIColor redColor];
        [self endGameChecker:self.model.checkIfGameOver];
        self.nextQuestionBtn.hidden = NO;
        //if gameover hidebutton nextquestion
        if (self.model.checkIfGameOver == YES) {
            self.nextQuestionBtn.hidden = YES;
        }
    }
    
    [self disableBtns];
}

- (IBAction)newQuestionBtn:(UIButton *)sender {
    [self getNewQuestion];
}

-(void)getNewQuestion{
    self.answerInfoLabel.text =@"";
    [self endGameChecker:self.model.checkIfGameOver];
    [self resetUIColors];
    [self.model setRandomQuestionDictionaryToQQuestion];
    [self setQuestionsAndAnswersToView];
    [self enableBtns];
    self.nextQuestionBtn.hidden = YES;
}

- (IBAction)startNewGame:(id)sender {
    self.model = [[Model alloc]init];
    [self.model setupData];
    [self.model setRandomQuestionDictionaryToQQuestion];
    [self setQuestionsAndAnswersToView];
    [self getNewQuestion];
    self.startNewGameBtn.hidden = YES;
    self.nextQuestionBtn.hidden = YES;
    self.correctPointsLabel.text =@"0";
    self.wrongeAnswerLabel.text =@"0";
}


-(void)endGameChecker:(bool)gameOver{
    if(gameOver == YES){
        
        [self hideShowBtns:YES];
        
        self.questionLabel.text = [NSString stringWithFormat:@"Your total points were\n %i correct answers and\n %i bad answers", self.model.correctAnswerInt, self.model.wrongAnswerInt];
        
        self.questionLabel.numberOfLines = 0;
        self.nextQuestionBtn.hidden = YES;
        self.startNewGameBtn.hidden = NO;
        
        
    }else
        
        [self hideShowBtns:NO];
}


//TODO:gör en shuffle array som lägger ut strängarna i parametrarna
-(void)setQuestionsAndAnswersToView{
    
    
    self.shuffleStringArray = [NSMutableArray arrayWithObjects:@"felsvar1",@"felsvar2",@"felsvar3",@"rättsvar", nil];
    /*for (int i = 0; i < [self.shuffleStringArray.count]; i++) {
        NSString *svar = i;
    }*/
    
    for (int i = 4; i > 0; i--) {
        
        int randIdx = arc4random() % i;
        switch (i){
        
            case 1 :
                [self.btnOne setTitle:self.model.qurentQuestion[[self.shuffleStringArray objectAtIndex:randIdx]] forState:(UIControlStateNormal)];
                [self.shuffleStringArray removeObjectAtIndex:randIdx];
                break;
            case 2 :
                [self.btnTwo setTitle:self.model.qurentQuestion[[self.shuffleStringArray objectAtIndex:randIdx]] forState:(UIControlStateNormal)];
                [self.shuffleStringArray removeObjectAtIndex:randIdx];
                break;
            case 3 :
                [self.btnThree setTitle:self.model.qurentQuestion[[self.shuffleStringArray objectAtIndex:randIdx]] forState:(UIControlStateNormal)];
                [self.shuffleStringArray removeObjectAtIndex:randIdx];
                break;
            case 4 :
                [self.btnFour setTitle:self.model.qurentQuestion[[self.shuffleStringArray objectAtIndex:randIdx]] forState:(UIControlStateNormal)];
                [self.shuffleStringArray removeObjectAtIndex:randIdx];
                break;
    }
    
    
    
    /*[self.btnTwo setTitle:self.model.qurentQuestion[@"felsvar2"] forState:(UIControlStateNormal)];
    [self.btnThree setTitle:self.model.qurentQuestion[@"felsvar3"] forState:(UIControlStateNormal)];
    [self.btnFour setTitle:self.model.qurentQuestion[@"rättsvar"] forState:(UIControlStateNormal)];
     */
    self.questionLabel.text = self.model.qurentQuestion[@"fråga"];

}
}

-(IBAction)disableBtns{
    self.btnOne.enabled = NO;
    self.btnTwo.enabled = NO;
    self.btnThree.enabled = NO;
    self.btnFour.enabled = NO;
    

}
-(IBAction)enableBtns{
    self.btnOne.enabled = YES;
    self.btnTwo.enabled = YES;
    self.btnThree.enabled = YES;
    self.btnFour.enabled = YES;
}
-(IBAction)resetUIColors{
    self.btnOne.backgroundColor = [UIColor whiteColor];
    self.btnTwo.backgroundColor = [UIColor whiteColor];
    self.btnThree.backgroundColor = [UIColor whiteColor];
    self.btnFour.backgroundColor = [UIColor whiteColor];
}
-(IBAction)hideShowBtns:(bool)x{
    self.btnOne.hidden = x;
    self.btnTwo.hidden = x;
    self.btnThree.hidden = x;
    self.btnFour.hidden = x;
    self.correctPointsLabel.hidden = x;
    self.wrongeAnswerLabel.hidden = x;
    self.answerInfoLabel.hidden = x;
}



@end
