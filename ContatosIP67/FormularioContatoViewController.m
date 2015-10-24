//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "FormularioContatoViewController.h"
#import "Contato.h"
#import "ContatoDao.h"

@interface FormularioContatoViewController ()

@end

@implementation FormularioContatoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)  didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pegaDadosDoFormulario {
    Contato* contato = [Contato new];
    contato.nome = self.nome.text;
    contato.email = self.email.text;
    contato.site = self.site.text;
    contato.endereco = self.endereco.text;
    contato.telefone = self.telefone.text;
    
    ContatoDao* dao = [ContatoDao contatoDaoInstance];
    [dao adicionaContato:contato];
    
    NSLog(@"%@", dao.contatos);
}

@end
