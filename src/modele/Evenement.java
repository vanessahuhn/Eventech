package modele;

import java.time.LocalTime;
import java.util.Date;

public class Evenement {
	
	String nom;
	String lieu;
	Date date;
	LocalTime heure;
	String prix;
	boolean isPublic;
	String description_resumee;
	String description_detaillee;
	int nombre_inscrits;
	int nbreParticipant;
	String cagnotte;
	int placesMax;
	int placesMin;
	String image_event;
	boolean isCagnotte;
	boolean isPlaceLimitee;
	String type;
	String categorie;
	
	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getLieu() {
		return lieu;
	}

	public void setLieu(String lieu) {
		this.lieu = lieu;
	}

	public String getPrix() {
		return prix;
	}

	public void setPrix(String prix) {
		this.prix = prix;
	}

	public boolean isPublic() {
		return isPublic;
	}

	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}

	public String getDescription_resumee() {
		return description_resumee;
	}

	public void setDescription_resumee(String description) {
		this.description_resumee = description;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public LocalTime getHeure() {
		return heure;
	}

	public void setHeure(LocalTime heure) {
		this.heure = heure;
	}

	public String getDescription_detaillee() {
		return description_detaillee;
	}

	public void setDescription_detaillee(String description_detaillee) {
		this.description_detaillee = description_detaillee;
	}

	public int getNombre_inscrits() {
		return nombre_inscrits;
	}

	public void setNombre_inscrits(int nombre_inscrits) {
		this.nombre_inscrits = nombre_inscrits;
	}

	public int getNbreParticipant() {
		return nbreParticipant;
	}

	public void setNbreParticipant(int nbreParticipant) {
		this.nbreParticipant = nbreParticipant;
	}

	public String getCagnotte() {
		return cagnotte;
	}

	public void setCagnotte(String cagnotte) {
		this.cagnotte = cagnotte;
	}

	public int getPlacesMax() {
		return placesMax;
	}

	public void setPlacesMax(int placesMax) {
		this.placesMax = placesMax;
	}
	
	public int getPlacesMin() {
		return placesMin;
	}

	public void setPlacesMin(int placesMin) {
		this.placesMin = placesMin;
	}

	public String getImage_event() {
		return image_event;
	}

	public void setImage_event(String image_event) {
		this.image_event = image_event;
	}

	public boolean isCagnotte() {
		return isCagnotte;
	}

	public void setCagnotte(boolean isCagnotte) {
		this.isCagnotte = isCagnotte;
	}

	public boolean isPlaceLimitee() {
		return isPlaceLimitee;
	}

	public void setPlaceLimitee(boolean isPlaceLimitee) {
		this.isPlaceLimitee = isPlaceLimitee;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCategorie() {
		return categorie;
	}

	public void setCategorie(String categorie) {
		this.categorie = categorie;
	}
	
	
}
