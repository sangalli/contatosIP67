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
<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
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
    UIBarButtonItem* botaoSalvar;
    if (self.contato) {
        self.nome.text = self.contato.nome;
        self.email.text = self.contato.email;
        self.site.text = self.contato.site;
        self.endereco.text = self.contato.endereco;
        self.telefone.text = self.contato.telefone;
        [self.botaoFoto setBackgroundImage:self.contato.foto forState:UIControlStateNormal];
        if (self.contato.foto) {
            [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
        } else {
            [self.botaoFoto setTitle:@"Foto" forState:UIControlStateNormal];
        }
        botaoSalvar = [[UIBarButtonItem alloc] initWithTitle:@"Atualizar" style:UIBarButtonItemStylePlain target:self action:@selector(editarContato)];
        self.navigationItem.title = @"Editar contato";
    } else {
        botaoSalvar = [[UIBarButtonItem alloc] initWithTitle:@"Cadastrar" style:UIBarButtonItemStylePlain target:self action:@selector(criaContato)];
        self.navigationItem.title = @"Novo contato";
    }
    self.navigationItem.rightBarButtonItem = botaoSalvar;
}

- (void)  didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)selecionaFoto {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertController* actionSheet = [UIAlertController alertControllerWithTitle:@"Foto" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Câmera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self exibeCamera];
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Biblioteca de fotos" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self exibeBiblioteca];
        }]];
        
        [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        
        [self presentViewController:actionSheet animated:YES completion:nil];
    } else {
        [self exibeBiblioteca];
    }
}

- (void)exibeCamera {
    
}

- (void)exibeBiblioteca {
    UIImagePickerController* picker = [UIImagePickerController new];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = YES;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
} 

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage* fotoSelecionada = [info valueForKey:UIImagePickerControllerEditedImage];
    [self.botaoFoto setBackgroundImage:fotoSelecionada forState:UIControlStateNormal];
    [self.botaoFoto setTitle:nil forState:UIControlStateNormal];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}


- (void) criaContato {
    Contato* contato = [Contato new];
    [self pegaDadosDoFormularioWithContato: contato];
    [self.dao adicionaContato:contato];
    [self.delegate contatoAdicionado:contato];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) editarContato {
    [self pegaDadosDoFormularioWithContato: self.contato];
    [self.delegate contatoAtualizado:self.contato];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) pegaDadosDoFormularioWithContato:(Contato *) contato
{
    contato.nome = self.nome.text;
    contato.email = self.email.text;
    contato.site = self.site.text;
    contato.endereco = self.endereco.text;
    contato.telefone = self.telefone.text;
    contato.foto = [self.botaoFoto backgroundImageForState:UIControlStateNormal];
}

@end
