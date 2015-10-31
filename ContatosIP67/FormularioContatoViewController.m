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
@property ContatoDao* dao;
@end

@implementation FormularioContatoViewController

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.dao =[ContatoDao contatoDaoInstance];
        UIBarButtonItem* botaoCadastrar = [[UIBarButtonItem alloc] initWithTitle:@"Salvar" style:UIBarButtonItemStylePlain target:self action:@selector(criaContato)];
        self.navigationItem.rightBarButtonItem = botaoCadastrar;
        self.navigationItem.title = @"Novo contato";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)  didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) criaContato {
    Contato* contato = [Contato new];
    [self pegaDadosDoFormularioWithContato: contato];
    [self.dao adicionaContato:contato];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) pegaDadosDoFormularioWithContato:(Contato *) contato
{
    contato.nome = self.nome.text;
    contato.email = self.email.text;
    contato.site = self.site.text;
    contato.endereco = self.endereco.text;
    contato.telefone = self.telefone.text;
}

@end
