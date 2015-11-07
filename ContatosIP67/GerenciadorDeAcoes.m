//
//  GerenciadorDeAcoes.m
//  ContatosIP67
//
//  Created by ios5778 on 07/11/15.
//  Copyright © 2015 Venturus. All rights reserved.
//

#import "GerenciadorDeAcoes.h"
@import MessageUI;


@interface GerenciadorDeAcoes()
<UIActionSheetDelegate,MFMailComposeViewControllerDelegate>

@property UIViewController* controller;

@end

@implementation GerenciadorDeAcoes

- (id)initWithContato:(Contato *)contato {
    self = [super init];
    if (self) {
        self.contato = contato;
    }
    return self;
}

- (void) mostraAcoesDoController:(UIViewController*) controller {
    self.controller = controller;
    UIActionSheet* opcoes = [[UIActionSheet alloc] initWithTitle:@"Ações" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:NULL otherButtonTitles:@"Ligar",@"Enviar SMS",@"Mandar e-mail",@"Acessar site",@"Mostrar no mapa", nil];
    [opcoes showInView:controller.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            [self ligar];
            break;
        case 1:
            [self mandarMensagem];
            break;
        case 2:
            [self enviarEmail];
            break;
        case 3:
            [self abrirSite];
            break;
        case 4:
            [self mostrarMapa];
            break;
    }
}

- (void) abrirAplicativoComUrl:(NSString*) url {
    UIApplication* app = [UIApplication sharedApplication];
    [app openURL:[NSURL URLWithString:url]];
}
                          
- (void) ligar {
    UIDevice* device = [UIDevice currentDevice];
    if ([device.model isEqualToString:@"iPhone"]) {
        NSString* url = [NSString stringWithFormat:@"tel:%@",self.contato.telefone];
        [self abrirAplicativoComUrl:url];
    } else {
        UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Aviso" message:@"Este dispositivo não executa ligações." delegate:NULL cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alerta show];
    }
}

- (void) mandarMensagem {
    NSString* url = [NSString stringWithFormat:@"sms:%@",self.contato.telefone];
    [self abrirAplicativoComUrl:url];
}

- (void) enviarEmail {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController* enviador = [MFMailComposeViewController new];
        [enviador setToRecipients:@[self.contato.email]];
        [enviador setSubject:@"Assunto!"];
        enviador.mailComposeDelegate = self;
        [self.controller presentViewController:enviador animated:YES completion:NULL];
    } else {
        UIAlertView* alerta = [[UIAlertView alloc] initWithTitle:@"Aviso" message:@"Não é possível enviar e-mail." delegate:NULL cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alerta show];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self.controller dismissViewControllerAnimated:YES completion:NULL];
}

- (void) abrirSite {
    [self abrirAplicativoComUrl:self.contato.site];
}

- (void) mostrarMapa {
    NSString* url = [NSString stringWithFormat:@"http://maps.apple.com?q=%@",self.contato.endereco];
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [self abrirAplicativoComUrl:url];
}

@end
