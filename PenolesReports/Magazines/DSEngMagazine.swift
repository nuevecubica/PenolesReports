//
//  DSEngMagazine.swift
//  PenolesReports
//
//  Created by Pablo Gomez Basanta on 7/1/18.
//  Copyright © 2018 Pablo Gomez Basanta. All rights reserved.
//

import UIKit

class DSEngMagazine: Magazine {
  static let shared = DSEngMagazine()
  
  fileprivate init() {}
  
  var name: String = "Peñoles SD English"
  var identifier: String = "DSEngMagazine"
  var downloadURL: URL = URL(string: "https://s3-us-west-1.amazonaws.com/nuevecubica-e3/penoles-ds-eng.zip")!
  var image: UIImage { return UIImage(named: "coverDSEngOff")! }
  var downloadedImage: UIImage { return UIImage(named: "coverDSEngOn")! }
  
  var initialViewController: UIViewController {
    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pageNavigationController") as! PageNavigationViewController
    
    viewController.magazine = self
    
    return viewController
  }
  
  var directory: URL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent("penoles-ds-eng")
  
  var sections:[Section] = [
    Section(name: "Start", pages: [
      // ImagePage(imageName: "portada"),
      CoverPage(theBg: "cover_bg", theFront: "cover_title", theTitle: "cover_front")
      ]),
    
    Section(name: "About Peñoles", pages: [
      
      ImagePage(imageName: "perfil_pag1"),
      DSEngMapPage(),
      ImagePage(imageName: "perfil_pag3"),
      ImagePage(imageName: "perfil_pag4"),
      ]),
    
    Section(name: "Message from CEO", pages: [
      ImagePage(imageName: "mensaje_director"),
      ]),
    
    Section(name: "Sustainability Management", pages: [
      CoverPage(theBg: "gestion_bg", theFront: "gestion_front",theTitle:"gestion_title"),
      ImagePage(imageName: "gestion_pag2"),
      ImagePage(imageName: "gestion_pag3"),
      ImagePage(imageName: "gestion_pag4"),
      ImagePage(imageName: "gestion_pag5"),
      ImagePage(imageName: "gestion_pag6"),
      gestion_7Page(imageName:"gestion_pag7"),
      //ImagePage(imageName: "gestion_pag7")
      ]),
    
    Section(name: "Stakeholders", pages: [
      CoverPage(theBg: "grupos_bg", theFront: "grupos_front",theTitle:"grupos_title"),
      ImagePage(imageName: "grupos_pag2"),
      ]),
    
    Section(name: "Transparency and Compliance", pages: [
      CoverPage(theBg: "transparencia_bg", theFront: "transparencia_front",theTitle:"transparencia_title"),
      ImagePage(imageName: "transparencia_pag2"),
      ImagePage(imageName: "transparencia_pag3"),
      ImagePage(imageName: "transparencia_pag4"),
      ImagePage(imageName: "transparencia_pag5"),
      ImagePage(imageName: "transparencia_pag6"),
      ImagePage(imageName: "transparencia_pag7"),
      ImagePage(imageName: "transparencia_pag8"),
      ImagePage(imageName: "transparencia_pag9"),
      ImagePage(imageName: "transparencia_pag10"),
      ]),
    
    Section(name: "Economic Performance", pages: [
      CoverPage(theBg: "desemp_economico_bg", theFront: "desemp_economico_front",theTitle:"desemp_economico_title"),
      ImagePage(imageName: "des_economico_pag2"),
      des_eco_3Page(imageName: "des_economico_pag3"),
      des_eco_4Page(imageName: "des_economico_pag4"),
      ImagePage(imageName: "des_economico_pag5"),
      ImagePage(imageName: "des_economico_pag6"),
      ImagePage(imageName: "des_economico_pag7"),
      ImagePage(imageName: "des_economico_pag8"),
      ImagePage(imageName: "des_economico_pag9"),
      des_eco_10Page(imageName: "des_economico_pag10"),
      ImagePage(imageName: "des_economico_pag11"),
      ImagePage(imageName: "des_economico_pag12"),
      ]),
    
    Section(name: "Environmental Performance", pages: [
      CoverPage(theBg: "desemp_ambiental_bg", theFront: "desemp_ambiental_front",theTitle:"desemp_ambiental_title"),
      des_amb_2Page(imageName: "des_ambiental_pag2"),
      ImagePage(imageName: "des_ambiental_pag3"),
      des_amb_4Page(imageName: "des_ambiental_pag4"),
      des_amb_5Page(imageName: "des_ambiental_pag5"),
      des_amb_6Page(imageName: "des_ambiental_pag6"),
      des_amb_7Page(imageName: "des_ambiental_pag7"),
      des_amb_8Page(imageName: "des_ambiental_pag8"),
      des_amb_9Page(imageName: "des_ambiental_pag9"),
      ImagePage(imageName: "des_ambiental_pag10"),
      ]),
    
    Section(name: "Social Performance", pages: [
      CoverPage(theBg: "desemp_social_bg", theFront: "desemp_social_front",theTitle:"desemp_social_title"),
      des_soc_2Page(imageName:"des_social_pag2"),
      ImagePage(imageName: "des_social_pag3"),
      ImagePage(imageName: "des_social_pag4"),
      ImagePage(imageName: "des_social_pag5"),
      ImagePage(imageName: "des_social_pag6"),
      ImagePage(imageName: "des_social_pag7"),
      des_soc_8Page(imageName:"des_social_pag8"),
      ImagePage(imageName: "des_social_pag9"),
      des_soc_10Page(imageName:"des_social_pag10"),
      ImagePage(imageName: "des_social_pag11"),
      ImagePage(imageName: "des_social_pag12"),
      des_soc_13Page(imageName: "des_social_pag13"),
      des_soc_14Page(imageName:"des_social_pag14"),
      ImagePage(imageName: "des_social_pag15"),
      ImagePage(imageName: "des_social_pag16"),
      ImagePage(imageName: "des_social_pag17"),
      ImagePage(imageName: "des_social_pag18"),
      ImagePage(imageName: "des_social_pag19"),
      ImagePage(imageName: "des_social_pag20"),
      ImagePage(imageName: "des_social_pag21"),
      ImagePage(imageName: "des_social_pag22"),
      ImagePage(imageName: "des_social_pag23"),
      ImagePage(imageName: "des_social_pag24"),
      ImagePage(imageName: "des_social_pag25"),
      ImagePage(imageName: "des_social_pag26"),
      ImagePage(imageName: "des_social_pag27"),
      ImagePage(imageName: "des_social_pag28"),
      ImagePage(imageName: "des_social_pag29"),
      des_soc_30Page(imageName: "des_social_pag30"),
      ]),
    
    Section(name: "Awards and Recognitions", pages: [
      ImagePage(imageName: "premios_pag1"),
      ]),
    
    Section(name: "Associations", pages: [
      ImagePage(imageName: "asociaciones_pag1"),
      ]),
    
    Section(name: "Fourth Financial Statement", pages: [
      ImagePage(imageName: "estado_financiero_pag1"),
      ]),
    
    Section(name: "About this Report", pages: [
      ImagePage(imageName: "acerca_informe_pag1"),
      ImagePage(imageName: "acerca_informe_pag2"),
      ImagePage(imageName: "acerca_informe_pag3"),
      ImagePage(imageName: "acerca_informe_pag4"),
      ImagePage(imageName: "acerca_informe_pag5"),
      ]),
    
    Section(name: "Contact Information", pages: [
      ImagePage(imageName: "contacto_pag1"),
      ImagePage(imageName: "contra_pag1"),
      ]),
    
    ]
}
