//
//  ControllerM4.swift
//  AptiPost
//
//  Created by Antoine roy on 27/07/2015.
//  Copyright (c) 2015 Antoine roy. All rights reserved.
//

import UIKit
import AVFoundation

let global: globalObj = globalObj()

class AccueilController: UIViewController, UITableViewDataSource, UITableViewDelegate, AVAudioPlayerDelegate {
    
    let tab: [Metier] = [
        Metier(title: "Aucun", apt: [true, true, true, true, true, true, true, true, true, true, true, true, true, true]),
        Metier(title: "Aide de cuisine", apt: [true, true, false, true, false, false, false, true, false, true, true, true, false, true]),
        Metier(title: "Artisan boulanger", apt: [false, true, false, true, false, true, false, true, false, true, true, true, true, true]),
        Metier(title: "Assistant comptable", apt: [true, true, true, true, true, true, true, true, true, true, true, true, true, true]),
        Metier(title: "Barman", apt: [false, true, false, true, false, false, false, true, true, true, true, true, true, true]),
        Metier(title: "Boulanger industriel", apt: [false, true, false, false, false, true, false, true, false, true, false, true, true, true]),
        Metier(title: "Hôte de caisse", apt: [true, true, true, true, false, false, false, true, false, true, false, true, true, true]),
        Metier(title: "Carreleur", apt: [true, false, true, true, true, true, false, true, true, true, false, true, true, true]),
        Metier(title: "Charpentier", apt: [true, false, true, true, true, false, false, true, true, true, false, true, true, true]),
        Metier(title: "Chef de projet informatique", apt: [true, true, true, true, true, true, true, true, true, true, true, true, true, true]),
        Metier(title: "Chef de service", apt: [true, true, true, true, true, true, true, true, true, true, true, true, true, true]),
        Metier(title: "Commercial industrie", apt: [true, true, true, true, true, true, true, true, true, true, true, true, true, true]),
        Metier(title: "Conducteur machine agricoles", apt: [true, false, true, true, true, true, true, true, true, false, false, true, true, true]),
        Metier(title: "Conducteur offset", apt: [true, true, true, true, true, true, true, true, false, true, false, true, true, true]),
        Metier(title: "Conducteur travaux publics", apt: [true, false, true, true, true, false, true, true, true, true, false, true, true, true]),
        Metier(title: "Débiteur en menuiserie", apt: [true, true, true, true, false, false, true, true, false, true, false, true, true, true]),
        Metier(title: "Dépanneur électroménager", apt: [true, true, true, false, false, true, true, true, true, false, false, true, true, true]),
        Metier(title: "Dessinateur projeteur informatisé", apt: [true, true, true, true, true, true, false, true, true, true, true, true, true, true]),
        Metier(title: "Directeur financier", apt: [true, true, true, true, true, true, true, true, true, true, true, true, true, true]),
        Metier(title: "Distributeur de messagerie", apt: [false, true, false, true, false, false, false, true, true, false, false, true, true, true]),
        Metier(title: "Electricien", apt: [true, true, true, true, true, true, false, true, true, true, false, true, true, true]),
        Metier(title: "Employé de restaurant", apt: [false, true, false, true, false, true, true, true, false, true, true, true, true, true]),
        Metier(title: "Employé libre service", apt: [true, true, true, true, false, true, false, true, false, true, true, true, true, true]),
        Metier(title: "Entretien espaces verts", apt: [false, false, false, true, false, true, true, true, true, true, false, true, true, true]),
        Metier(title: "Maçonnerie - gros oeuvre", apt: [false, true, false, true, true, true, false, true, true, true, false, true, true, true]),
        Metier(title: "Magasinier", apt: [true, true, true, true, true, true, false, true, true, true, true, true, true, true]),
        Metier(title: "Maintenance réseau informatique", apt: [true, true, true, true, false, true, false, true, false, true, true, true, true, true]),
        Metier(title: "Mécanicien", apt: [true, true, true, true, false, true, true, true, false, true, true, true, true, true]),
        Metier(title: "Mécanicien affuteur", apt: [true, false, true, true, true, true, true, true, false, true, false, true, true, false]),
        Metier(title: "Métallier", apt: [true, false, true, true, true, true, false, true, true, true, false, true, true, true]),
        Metier(title: "Monteur structure bois", apt: [true, false, true, true, true, false, false, true, true, true, false, true, true, false]),
        Metier(title: "Mouleur noyauteur", apt: [true, false, true, true, true, true, true, true, false, true, false, true, true, false]),
        Metier(title: "Nettoyage industriel", apt: [false, true, false, true, true, true, true, true, true, false, true, true, true, true]),
        Metier(title: "Opérateur assemblage", apt: [true, true, true, true, true, true, false, true, false, true, true, true, true, true]),
        Metier(title: "Opérateur de sciage débit", apt: [true, true, true, true, false, false, true, false, false, true, false, true, true, true]),
        Metier(title: "Opérateur de tri", apt: [true, true, true, true, false, true, false, true, false, false, false, true, true, true]),
        Metier(title: "Opérateur sur machines", apt: [true, true, true, true, false, true, true, true, true, true, true, true, true, true]),
        Metier(title: "Ouvrier agricole", apt: [false, false, false, false, true, false, true, true, true, false, false, true, true, true]),
        Metier(title: "Ouvrier blanchisserie", apt: [false, false, false, true, false, true, true, true, false, true, false, true, true, true]),
        Metier(title: "Ouvrier horticole", apt: [false, true, false, true, false, true, false, true, true, true, false, true, true, true]),
        Metier(title: "Ouvrier horloger", apt: [true, false, true, true, false, true, false, true, false, true, false, true, true, true]),
        Metier(title: "Pâtissier", apt: [false, true, false, true, false, true, false, true, false, true, true, true, true, true]),
        Metier(title: "Peintre", apt: [false, false, false, false, true, true, false, true, true, false, false, true, true, true]),
        Metier(title: "Peintre bâtiment", apt: [false, false, false, true, true, true, false, true, true, true, true, true, true, true]),
        Metier(title: "Peintre pistolet", apt: [true, false, true, true, false, true, false, true, false, true, false, true, true, true]),
        Metier(title: "Polisseur", apt: [true, false, true, true, false, false, false, true, false, true, false, true, true, true]),
        Metier(title: "Règleur machines outils", apt: [true, true, true, true, false, true, true, true, false, true, false, true, true, true]),
        Metier(title: "Responsable marketing", apt: [true, true, true, true, true, true, true, true, true, true, true, true, true, true]),
        Metier(title: "Responsable qualité industrie", apt: [true, true, true, true, true, true, true, true, true, true, true, true, true, true]),
        Metier(title: "Scieur", apt: [true, true, true, true, false, true, true, true, false, true, false, true, true, true]),
        Metier(title: "Secrétariat", apt: [true, true, true, true, false, true, false, true, false, true, true, true, true, true]),
        Metier(title: "Secrétariat direction", apt: [true, true, true, true, true, true, true, true, false, true, true, true, true, true]),
        Metier(title: "Solier moquettiste", apt: [true, false, true, true, true, true, false, true, true, true, false, true, true, false]),
        Metier(title: "Soudeur", apt: [true, false, true, true, true, false, true, true, true, true, false, true, true, true]),
        Metier(title: "Technicien maintenance", apt: [true, true, true, true, false, true, true, true, false, true, true, true, true, true]),
        Metier(title: "Téléprospecteur", apt: [true, true, true, true, false, true, true, true, false, true, true, true, false, true]),
        Metier(title: "Traitement pré presse", apt: [true, true, true, true, true, true, false, true, false, true, true, true, true, true]),
        Metier(title: "Vente", apt: [true, true, true, true, false, false, false, true, false, true, true, true, true, true]),
        Metier(title: "Vente commerce détail", apt: [true, true, true, true, false, true, false, true, false, true, true, true, true, true]),
        Metier(title: "Vernisseur", apt: [true, false, true, true, false, true, false, true, false, false, false, false, true, true])
    ]

    
    let immeubleGauche: UIImageView! = UIImageView(frame: CGRectMake(0, 126, 190, 516))
    let immeubleDroite: UIImageView! = UIImageView(frame: CGRectMake(672, 463, 352, 305))
    let immeubleBas: UIImageView! = UIImageView(frame: CGRectMake(239, 690, 449, 78))
    
    @IBOutlet var logoApti: UIImageView!
    
    @IBOutlet var btnBulleInfo: UIButton!
    @IBOutlet var btnIcnInfo: UIButton!
    
    @IBOutlet var btnBulleEntrain: UIButton!
    @IBOutlet var btnIcnEntrain: UIButton!
    
    @IBOutlet var btnBulleEval: UIButton!
    @IBOutlet var btnIcnEval: UIButton!
    
    @IBOutlet var btnValider: UIButton!
    
    @IBOutlet var btnCollection: [UIButton]!
    @IBOutlet var labelCollection: [UILabel]!
    
    @IBOutlet var listeMetier: UITableView!
    @IBOutlet var btnListeMetier: UIButton!
    @IBOutlet var labelMetier: UILabel!
    
    @IBOutlet var texteMetier: UIImageView!
    @IBOutlet var texteAptitude: UIImageView!
    
    var tabBoolState: [Bool] = []
    let btnMetier: UIImage = UIImage(named: "btnMetier.png")!
    let btnMetierChecked: UIImage = UIImage(named: "btnMetierChecked.png")!
   
    var cpFrameLogo: CGRect!
    var cpFrameBtnInfo: CGRect!
    var cpFrameBtnEval: CGRect!
    var cpFrameBtnEntrain: CGRect!
    
    var cpFrameBulleInfo: CGRect!
    var cpFrameBulleEval: CGRect!
    var cpFrameBulleEntrain: CGRect!
    
    var cpFrameImmeubleGauche: CGRect!
    var cpFrameImmeubleDroite: CGRect!
    var cpFrameImmeubleBas: CGRect!
    
    let backPerso: UIImageView = UIImageView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
    
    
    
    //element information
    @IBOutlet var imgBarresInfo: UIImageView!
    @IBOutlet var texteInfo: UIImageView!
    @IBOutlet var btnRetour: UIButton!
    @IBOutlet var imgInfo: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        global.storyboard = self.storyboard
        self.immeubleGauche.image = UIImage(named: "immeubleGauche.png")
        self.immeubleDroite.image = UIImage(named: "immeubleDroite.png")
        self.immeubleBas.image = UIImage(named: "immeubleBas.png")
        
        cpFrameImmeubleGauche = immeubleGauche.frame
        cpFrameImmeubleDroite = immeubleDroite.frame
        cpFrameImmeubleBas = immeubleBas.frame
        
        listeMetier.layer.borderWidth = 0.5
        listeMetier.layer.cornerRadius = 5

        btnListeMetier.layer.borderWidth = 0.5
        listeMetier.layer.cornerRadius = 5

        
        let background: UIImageView = UIImageView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        background.image = UIImage(named: "fondImmeuble.png")
        backPerso.image = UIImage(named: "fondPersonnages.png")
        listeMetier.delegate = self
        listeMetier.dataSource = self
        self.view.addSubview(background)
        self.view.addSubview(immeubleDroite)
        self.view.addSubview(immeubleGauche)
        self.view.addSubview(immeubleBas)
        self.view.addSubview(backPerso)

        logoApti.alpha = 0
        cpFrameLogo = logoApti.frame
        logoApti.frame = CGRectMake(logoApti.frame.origin.x, logoApti.frame.origin.y + 50, logoApti.frame.width, logoApti.frame.height)
        UIView.animateWithDuration(0.5, animations: {
            self.logoApti.frame = self.cpFrameLogo
            self.logoApti.alpha = 1
        })
        
        cpFrameBtnInfo = btnIcnInfo.frame
        cpFrameBtnEval = btnIcnEval.frame
        cpFrameBtnEntrain = btnIcnEntrain.frame
        
        btnIcnInfo.frame = CGRectMake(btnIcnInfo.frame.origin.x, btnIcnInfo.frame.origin.y - 50, btnIcnInfo.frame.width, btnIcnInfo.frame.height)
        btnIcnInfo.alpha = 0
        btnIcnEval.frame = CGRectMake(btnIcnEval.frame.origin.x, btnIcnEval.frame.origin.y - 50, btnIcnEval.frame.width, btnIcnEval.frame.height)
        btnIcnEval.alpha = 0
        btnIcnEntrain.frame = CGRectMake(btnIcnEntrain.frame.origin.x, btnIcnEntrain.frame.origin.y - 50, btnIcnEntrain.frame.width, btnIcnEntrain.frame.height)
        btnIcnEntrain.alpha = 0
        
        
        UIView.animateWithDuration(0.25, delay: 0.5, options: .CurveEaseOut, animations: {
            self.btnIcnInfo.frame = self.cpFrameBtnInfo
            self.btnIcnInfo.alpha = 1
        }, completion: nil)
        
        UIView.animateWithDuration(0.25, delay: 0.75, options: .CurveEaseOut, animations: {
            self.btnIcnEval.frame = self.cpFrameBtnEval
            self.btnIcnEval.alpha = 1
            }, completion: nil)
        
        UIView.animateWithDuration(0.25, delay: 1, options: .CurveEaseOut, animations: {
            self.btnIcnEntrain.frame = self.cpFrameBtnEntrain
            self.btnIcnEntrain.alpha = 1
            }, completion: nil)
        
        
        cpFrameBulleInfo = btnBulleInfo.frame
        cpFrameBulleEval = btnBulleEval.frame
        cpFrameBulleEntrain = btnBulleEntrain.frame
        
        btnBulleInfo.frame = CGRectMake(btnBulleInfo.frame.origin.x, btnBulleInfo.frame.origin.y + 50, btnBulleInfo.frame.width, btnBulleInfo.frame.height)
        btnBulleInfo.alpha = 0
        btnBulleEval.frame = CGRectMake(btnBulleEval.frame.origin.x, btnBulleEval.frame.origin.y + 50, btnBulleEval.frame.width, btnBulleEval.frame.height)
        btnBulleEval.alpha = 0
        btnBulleEntrain.frame = CGRectMake(btnBulleEntrain.frame.origin.x, btnBulleEntrain.frame.origin.y + 50, btnBulleEntrain.frame.width, btnBulleEntrain.frame.height)
        btnBulleEntrain.alpha = 0
        
        UIView.animateWithDuration(0.25, delay: 1.25, options: .CurveEaseOut, animations: {
            self.btnBulleInfo.frame = self.cpFrameBtnInfo
            self.btnBulleInfo.alpha = 1
        }, completion: nil)
        
        UIView.animateWithDuration(0.25, delay: 1.5, options: .CurveEaseOut, animations: {
            self.btnBulleEval.frame = self.cpFrameBtnEval
            self.btnBulleEval.alpha = 1
            }, completion: nil)
        
        UIView.animateWithDuration(0.25, delay: 1.75, options: .CurveEaseOut, animations: {
            self.btnBulleEntrain.frame = self.cpFrameBtnEntrain
            self.btnBulleEntrain.alpha = 1
            }, completion: nil)
        
        
        
        
        var i = 0
        for btn in btnCollection {
            btn.alpha = 0
            btn.tag = i
            btn.addTarget(self, action: #selector(AccueilController.ChangeState(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            tabBoolState.append(false)
            i += 1
        }
        for label in labelCollection {
            label.alpha = 0
        }
        btnValider.alpha = 0
        listeMetier.alpha = 0
        btnListeMetier.alpha = 0
        labelMetier.alpha = 0
        texteMetier.alpha = 0
        texteAptitude.alpha = 0
        
        
        imgBarresInfo.alpha = 0
        texteInfo.alpha = 0
        btnRetour.alpha = 0
        imgInfo.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func ChangeState(sender: AnyObject!) {
        print("toto")
        
        if tabBoolState[sender.tag] == false {
            sender.setImage(btnMetier, forState: .Highlighted)
            sender.setImage(btnMetierChecked, forState: .Normal)
            tabBoolState[sender.tag] = true
        } else {
            sender.setImage(btnMetier, forState: .Normal)
            sender.setImage(btnMetierChecked, forState: .Highlighted)
            tabBoolState[sender.tag] = false
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel!.text = tab[indexPath.row].title
        cell.backgroundColor = (indexPath.row % 2 == 0 ? UIColor.whiteColor() : UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0))
        
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tab.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.hidden = true
        
        labelMetier.text = tab[indexPath.row].title
        var i = 0
        for btn in btnCollection {
            if tab[indexPath.row].aptitutes[btn.tag] == true {
                btn.setImage(btnMetier, forState: .Highlighted)
                btn.setImage(btnMetierChecked, forState: .Normal)
                tabBoolState[btn.tag] = true
            } else {
                btn.setImage(btnMetier, forState: .Normal)
                btn.setImage(btnMetierChecked, forState: .Highlighted)
                tabBoolState[btn.tag] = false
            }
            i += 1
        }
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = (indexPath.row % 2 == 0 ? UIColor.whiteColor() : UIColor(red: 247.0/255.0, green: 247.0/255.0, blue: 247.0/255.0, alpha: 1.0))
    }
    
    
    @IBAction func showTableView(sender: AnyObject) {
        print("show")
        if listeMetier.hidden == false {
            listeMetier.hidden = true
        } else {
            listeMetier.hidden = false
        }
    }

    
    
    @IBAction func choixMetier(sender: AnyObject) {
        print("toto")
        UIView.animateWithDuration(1.0, animations: {
            
            self.immeubleGauche.frame = CGRectMake(-60, self.immeubleGauche.frame.origin.y, self.immeubleGauche.frame.width, self.immeubleGauche.frame.height)
            
            self.immeubleDroite.frame = CGRectMake(self.immeubleDroite.frame.origin.x + 60, self.immeubleDroite.frame.origin.y, self.immeubleDroite.frame.width, self.immeubleDroite.frame.height)
            
            self.immeubleBas.frame = CGRectMake(self.immeubleBas.frame.origin.x, self.immeubleBas.frame.origin.y + 70, self.immeubleBas.frame.width, self.immeubleBas.frame.height)
            
            self.logoApti.alpha = 0
            self.btnBulleEntrain.alpha = 0
            self.btnBulleEval.alpha = 0
            self.btnBulleInfo.alpha = 0
            
            self.btnIcnEntrain.alpha = 0
            self.btnIcnEval.alpha = 0
            self.btnIcnInfo.alpha = 0
            self.backPerso.alpha = 0
            
            }, completion: {finished in
        
                UIView.animateWithDuration(1.0, animations: {
                    for btn in self.btnCollection {
                        btn.alpha = 1
                    }
                    for label in self.labelCollection {
                        label.alpha = 1
                    }
                    self.btnValider.alpha = 1
                    self.listeMetier.alpha = 1
                    self.listeMetier.hidden = true
                    self.btnListeMetier.alpha = 1
                    self.labelMetier.alpha = 1
                    self.texteMetier.alpha = 1
                    self.texteAptitude.alpha = 1
                })
                
        })
    }
    
    @IBAction func launchQuestion(sender: AnyObject) {
        let vc: UIViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("idQuestion"))!
            self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func showInformation(sender: AnyObject) {
        
        UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseOut, animations: {

            // cache icones menu
            self.immeubleGauche.frame = CGRectMake(-60, self.immeubleGauche.frame.origin.y, self.immeubleGauche.frame.width, self.immeubleGauche.frame.height)
            
            self.immeubleDroite.frame = CGRectMake(self.immeubleDroite.frame.origin.x + 60, self.immeubleDroite.frame.origin.y, self.immeubleDroite.frame.width, self.immeubleDroite.frame.height)
            
            self.immeubleBas.frame = CGRectMake(self.immeubleBas.frame.origin.x, self.immeubleBas.frame.origin.y + 70, self.immeubleBas.frame.width, self.immeubleBas.frame.height)
            
            self.logoApti.alpha = 0
            self.btnBulleEntrain.alpha = 0
            self.btnBulleEval.alpha = 0
            self.btnBulleInfo.alpha = 0
            
            self.btnIcnEntrain.alpha = 0
            self.btnIcnEval.alpha = 0
            self.btnIcnInfo.alpha = 0
            self.backPerso.alpha = 0
            
            }, completion: {finished in
        
                UIView.animateWithDuration(0.5, animations: {
                
                    // affiche icones information
                    self.imgBarresInfo.alpha = 1
                    self.texteInfo.alpha = 1
                    self.btnRetour.alpha = 1
                    self.imgInfo.alpha = 1
                })
        })
    }
    
    
    @IBAction func launchSound(sender: AnyObject) {

        
    }
    
    
    @IBAction func returnMenu(sender: AnyObject) {
        
        UIView.animateWithDuration(0.5, animations: {
        
            // affiche icones information
            self.imgBarresInfo.alpha = 0
            self.texteInfo.alpha = 0
            self.btnRetour.alpha = 0
            self.imgInfo.alpha = 0
            
            }, completion: { finished in
        
                UIView.animateWithDuration(0.5, animations: {
                    self.logoApti.alpha = 1
                    self.btnBulleEntrain.alpha = 1
                    self.btnBulleEval.alpha = 1
                    self.btnBulleInfo.alpha = 1
                    
                    self.btnIcnEntrain.alpha = 1
                    self.btnIcnEval.alpha = 1
                    self.btnIcnInfo.alpha = 1
                    self.backPerso.alpha = 1
                    
                    self.immeubleGauche.frame = self.cpFrameImmeubleGauche
                    self.immeubleDroite.frame = self.cpFrameImmeubleDroite
                    self.immeubleBas.frame = self.cpFrameImmeubleBas
                })
   
        })
        
    }
    
    @IBAction func launchEntrainement(sender: AnyObject) {
        
        /*let vc: GenericController = (self.storyboard?.instantiateViewControllerWithIdentifier("idGenericQuestion") as? GenericController)!
        println(vc)
        vc.question = global.Entrainement[0]
        self.presentViewController(vc, animated: true, completion: nil)*/
        
        /*let vc: QCUChooseElemColor = (self.storyboard?.instantiateViewControllerWithIdentifier("QCUChooseElemColor") as? QCUChooseElemColor)!
        vc.question = global.Entrainement[global.posEntrainement]
        self.presentViewController(vc, animated: true, completion: nil)*/
        
        print("toto")
        let vc: QCUPropoHorizontalHexa = (self.storyboard?.instantiateViewControllerWithIdentifier("QCUPropoHorizontalHexa") as? QCUPropoHorizontalHexa)!
        vc.question = global.Entrainement[2]
        print(vc)
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}
