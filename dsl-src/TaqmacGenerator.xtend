/*
 * generated by Xtext 2.14.0
 */
package fr.ut2j.m1ice.pdc.taqmac.dsl.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import itineraire.Itineraire
import itineraire.ModeTransport
import org.eclipse.emf.common.util.EList
import itineraire.ModeAffichage
import itineraire.PlageHoraire

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class TaqmacGenerator extends AbstractGenerator {

	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
	var itineraire = resource.contents.get(0) as Itineraire ;
	fsa.generateFile('generatedJavascript.js',generateJavascript(itineraire));
	
	}
	
	def generateJavascript(Itineraire itineraire){
		'''
		�generateTransportListCheckBox(itineraire.modesTransport)�
		�generateSelectMode(itineraire.modesAffichage)�
		�generateDateField(itineraire.plageHoraire)�
		'''
		
	}
	
	

	def generateTransportListCheckBox(EList<ModeTransport> list){
		var listCheckbox = "";
		var str = "";
		'''
		function setCheckboxList(){
			�for (trans : list) {
				str = "<div>";
				str += "<label for='�trans.getType().toLowerCase()�'>�trans.getType()�</label>";
				str += "<input type='checkbox' name='�trans.getType().toLowerCase()�' value='�trans.getType().toLowerCase()�' id='�trans.getType().toLowerCase()�'>" 	
				str += "</div>";
				listCheckbox += str;
			}�
 			document.getElementById("transportationListContainer").innerHTML = �listCheckbox�;
		}
		setCheckboxList();
		'''
	}
	
	def generateSelectMode(EList<ModeAffichage> list){
		var affichage = list.get(0).getType();
		var html = "";
		switch (affichage) {
			case "Carte": {
					
					html = "document.getElementById(\"map\").style.display = \"flex\"";
					html = "document.getElementById(\"route\").style.display = \"none\"";
				}
				case "Text": {
					html = "document.getElementById(\"map\").style.display = \"none\"";
				html = "document.getElementById(\"route\").style.display = \"flex\"";
					
				}
			default: {
				
			}
		}
		
		'''
		function createSelectDisplayMode(){
			�html�
		}
		createSelectDisplayMode();
		'''
	}
	
	def generateDateField(PlageHoraire plage){
		
	}
}
