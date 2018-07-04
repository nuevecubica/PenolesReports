//
//  AIEngMagazine.swift
//  PenolesReports
//
//  Created by Pablo Gomez Basanta on 7/2/18.
//  Copyright © 2018 Pablo Gomez Basanta. All rights reserved.
//

import UIKit

class AIEngMagazine: Magazine {
  static let shared = AIEngMagazine()
  
  fileprivate init() {}
  
  var name: String = "Peñoles AI English"
  var identifier: String = "AIEngMagazine"
  var downloadURL: URL = URL(string: "https://shiftingmind.s3.amazonaws.com/penoles-ai-eng.zip")!
  
  var initialViewController: UIViewController {
    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "pageNavigationController") as! PageNavigationViewController
    
    viewController.magazine = self
    
    return viewController
  }
  
  var directory: URL = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0].appendingPathComponent("penoles-ai-eng")
  
  var sections:[Section] = [
    Section(name: "Start", pages: [
      // ImagePage(imageName: "portada"),
      CoverPage(theBg: "cover_bg", theFront: "cover_title", theTitle: "cover_front"),
      ]),
    Section(name: "Company Profile", pages: [
      ImagePage(imageName: "perfil_corp_pag1"),
      ImagePage(imageName: "perfil_corp_pag2"),
      AIEngMapPage(),
      ]),
    Section(name: "Business Model", pages: [
      ImagePage(imageName: "modelo_pag1"),
      ]),
    Section(name: "Financial Highlights", pages: [
      modelo_negocio_3Page(imageName: "modelo_pag2"),
      ImagePage(imageName: "modelo_pag3"),
      ImagePage(imageName: "modelo_pag4"),
      ]),
    Section(name: "Letter to Shareholders", pages: [
      ImagePage(imageName: "inf_anual_pag1"),
      ]),
    Section(name: "Letter to the Board of Directors", pages: [
      ImagePage(imageName: "inf_director_pag1"),
      ]),
    Section(name: "Review of Operations", pages: [
      CoverPage(theBg: "ro_cover_bg", theFront: "ro_cover_title", theTitle: "ro_cover_front"),
      ImagePage(imageName: "res_operacion_pag1"),
      ImagePage(imageName: "res_operacion_pag2"),
      ImagePage(imageName: "res_operacion_pag3"),
      ImagePage(imageName: "res_operacion_pag4"),
      ImagePage(imageName: "res_operacion_pag5"),
      res_operacion_6Page(imageName: "res_operacion_pag6"),
      res_operacion_7Page(imageName: "res_operacion_pag7"),
      res_operacion_8Page(imageName: "res_operacion_pag8"),
      ImagePage(imageName: "res_operacion_pag9"),
      ImagePage(imageName: "res_operacion_pag9_2"),
      ImagePage(imageName: "res_operacion_pag10"),
      ImagePage(imageName: "res_operacion_pag11"),
      ImagePage(imageName: "res_operacion_pag12"),
      ImagePage(imageName: "res_operacion_pag13"),
      res_operacion_14Page(imageName: "res_operacion_pag14"),
      res_operacion_15Page(imageName: "res_operacion_pag15"),
      ImagePage(imageName: "res_operacion_pag16"),
      ImagePage(imageName: "res_operacion_pag17"),
      ImagePage(imageName: "res_operacion_pag18"),
      res_operacion_19Page(imageName: "res_operacion_pag19"),
      res_operacion_20Page(imageName: "res_operacion_pag20"),
      ImagePage(imageName: "res_operacion_pag21"),
      
      ]),
    Section(name: "Energy and Technology", pages: [
      CoverPage(theBg: "et_cover_bg", theFront: "et_cover_front", theTitle: "et_cover_title"),
      ImagePage(imageName: "energia_tec_pag1"),
      ImagePage(imageName: "energia_tec_pag2"),
      ]),
    Section(name: "Our People", pages: [
      CoverPage(theBg: "ng_cover_bg", theFront: "ng_cover_front", theTitle: "ng_cover_title"),
      ImagePage(imageName: "nuestra_gente_pag1"),
      ]),
    Section(name: "Corporate Governance", pages: [
      CoverPage(theBg: "gc_cover_bg", theFront: "gc_cover_front", theTitle: "gc_cover_title"),
      ImagePage(imageName: "gob_corp_pag1"),
      ImagePage(imageName: "gob_corp_pag2"),
      ]),
    Section(name: "Management", pages: [
      ImagePage(imageName: "ejecutivos_pag1"),
      ]),
    Section(name: "Board of Directors", pages: [
      ImagePage(imageName: "consejo_admon_pag1"),
      ]),
    Section(name: "Management Discussion and Analysis", pages: [
      ImagePage(imageName: "analisis_res_pag1"),
      ImagePage(imageName: "analisis_res_pag2"),
      ImagePage(imageName: "analisis_res_pag3"),
      ImagePage(imageName: "analisis_res_pag4"),
      ImagePage(imageName: "analisis_res_pag5"),
      ImagePage(imageName: "analisis_res_pag6"),
      ImagePage(imageName: "analisis_res_pag7"),
      ImagePage(imageName: "analisis_res_pag8"),
      ]),
    Section(name: "Report of the Audit and Corporate Governance Committee", pages: [
      ImagePage(imageName: "inf_comite_pag1"),
      ]),
    Section(name: "Shareholder Information", pages: [
      ImagePage(imageName: "inf_accionistas_pag1"),
      ImagePage(imageName: "back_cover"),
      ]),
    ]
}
