//
//  ViewController.m
//  ContatosIP67
//
//  Created by ios5778 on 24/10/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "FormularioContatoViewController.h"
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
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.contato) {
        self.nome.text = self.contato.nome;
        self.email.text = self.contato.email;
        self.site.text = self.contato.site;
        self.endereco.text = self.contato.endereco;
        self.telefone.text = self.contato.telefone;
        UIBarButtonItem* botaoEditar = [[UIBarButtonItem alloc] initWithTitle:@"Salvar" style:UIBarButtonItemStylePlain target:self action:@selector(editarContato)];
        self.navigationItem.rightBarButtonItem = botaoEditar;
        self.navigationItem.title = @"Editar contato";
    } else {
        UIBarButtonItem* botaoCadastrar = [[UIBarButtonItem alloc] initWithTitle:@"Salvar" style:UIBarButtonItemStylePlain target:self action:@selector(criaContato)];
        self.navigationItem.rightBarButtonItem = botaoCadastrar;
        self.navigationItem.title = @"Novo contato";
    }
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

- (void) editarContato {
    [self pegaDadosDoFormularioWithContato: self.contato];
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
