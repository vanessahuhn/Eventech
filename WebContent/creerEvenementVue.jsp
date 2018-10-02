<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="fr">
<head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Site d'événements">
        <meta name="author" content="EvenTeam">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link href="css/Style.css" rel="stylesheet">

        <title>La Buvette Tech</title>

        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/floating-labels.css" rel="stylesheet">
        <link href="css/sticky-footer-navbar.css" rel="stylesheet">
		<link href="css/loginBtn.css" rel="stylesheet">
        <!--icon library -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
       <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
    </head>
<header>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
      <!-- Logo + lien vers la page d'accueil -->
      <a class="navbar-brand" href="#">La Buvette Tech</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                        <a class="nav-link float-right" href="accueil.jsp"><i class="material-icons md-32 md-light">home</i></a>
                    </li>
                    <li class="nav-item d-flex align-items-center"><a class="nav-link float-right"
				href="profilVue.jsp"><%=(session.getAttribute("prenom") == null) ? "" : session.getAttribute("prenom")%> <%=(session.getAttribute("nom") == null) ? "" : session.getAttribute("nom")%></a>
			</li>
              <li class="nav-item d-flex align-items-center">
                        <!-- ajouter le lien vers la page inscription -->
                         <%=(session.getAttribute("isConnecte") == null) ? "<a class='nav-link float-right' href='inscriptionVue.jsp'>Inscription</a>" : ""%>
                    </li>
              <li class="nav-item d-flex align-items-center">
                        <!-- ajouter le lien vers la page connexion -->
<%=(session.getAttribute("isConnecte") == null) ? "<a class='nav-link float-right' href='connexionVue.jsp'>Connexion</a>" : "<a class='nav-link float-right' href='LogoutServlet'>Se déconnecter</a>"%>                    
					</li>
              <li class="nav-item d-flex align-items-center">
                        <!-- ajouter le lien vers la page événements -->
                         <a class="nav-link float-right" href="evenementsVue.jsp">Événements</a>
                    </li>
            </ul>
            <form class="form-inline my-2 my-lg-0 justify-content-end">
      <div class=" input-group">
        <input class="form-control my-2 mr-sm-2" type="text" placeholder="Recherche" aria-label="Search">
        <button class="btn btn-outline-success my-2 mr-sm-0" type="submit">Rechercher</button>
      </div>
      </form>
          </div>
        </nav>
      </header>
<body>
<form class="container" action="creerEvenementControleur.jsp">
    <div class="row p-5 flex-fill border rounded bg-white">
      <div class="col-lg-6 col-md-6">
        <img class="img-top col-lg-12 img-responsive mb-5" src="img/hackathon.png" alt="Card image cap" >
        <div class="d-flex justify-content-center mb-4">
          <button class="btn btn-lg btn-outline-primary" type="button" data-toggle="modal" data-target="#exampleModal">Modifier l'image</button>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Choisir une image</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                
                  <div class="form-group">
                    <label for="exampleFormControlFile1">Importer depuis mes images</label>
                    <input type="file" class="form-control-file mb-5" id="exampleFormControlFile1">
                    <label for="exampleInputURL">URL de l'image</label>
                    <input type="url" name = "image_event" class="form-control" id="exampleInputURL" placeholder="Coller l'url de l'image">
                  </div>
                
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal">Valider</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="form-signin col-lg-6  col-md-6 p-1">
          <div class="form-group mb-5">
            <input type="text" name="nom" class="form-control form-control-lg" id="titreEvent" placeholder="Titre de l'événement">
          </div>
          <div class="form-group mb-4 d-flex justify-content-between align-items-center">
            <i class="fa fa-calendar fa-3x mr-3"></i>
            <input type="date" name="date" class="form-control mr-3" id="dateEvent" placeholder="Date">
            <input type="time" name="heure" class="form-control" id="heureEvent" placeholder="Heure">
          </div>
          <div class="form-group mb-4 d-flex justify-content-between align-items-center">
            <i class="fa fa-map-marker fa-3x mr-3"></i>
            <input type="text" name="lieu" class="form-control" id="adresseEvent" placeholder="Adresse">
          </div>
          <div class="form-group mb-4 d-flex justify-content-between align-items-center">
            <i class="fa fa-users fa-3x mr-3"></i>
            <input type="text" name="places_min" class="form-control mr-2" id="minParticipants" placeholder="Min participants">
            <h4> à </h4>
            <input type="text" name="places_max" class="form-control ml-2" id="maxParticipants" placeholder="Max participants">
          </div>
          <div class="form-group mb-4 d-flex justify-content-between align-items-center">
            <i class="fa fa-credit-card fa-3x mr-3"></i>
            <div class="custom-control custom-checkbox w-100">
              <input type="checkbox" class="custom-control-input" id="gratuit">
              <label class="custom-control-label" for="gratuit">Gratuit ?</label>
            </div>
            <input type="text" name="prix" class="form-control mr-2" id="prixEvent" placeholder="Prix">
            <h4 >euros</h4>
          </div>
          <div class="form-group mb-4 d-flex justify-content-between align-items-center">
            <h5>Cagnotte</h5>
              <input type="URL" name="cagnotte" class="form-control ml-2" id="lienCagnotte" placeholder="Lien vers la cagnotte">
          </div>
          <div class="form-group d-flex justify-content-between align-items-center">
            <i class="fa fa-address-book fa-3x mr-3"></i>
            <select class="form-control" id="contact">
              <option value>Préférences de contact</option>
              <option>Par mail</option>
              <option>Par téléphone</option>
              <option>Aucun contact</option>
            </select>
          </div>
		</div>
    </div>
    <div class="row p-5">
      <div class="col-12">
        <h3 class="text-center mb-4" id="titre1 ">Description</h3>
        <div class="form-group">
          <textarea class="form-control" name="description_detaillee" id="exampleFormControlTextarea1" rows="10"></textarea>
        </div>
        <div class="d-flex justify-content-center mb-5">
          <button class="btn btn-lg btn-primary" type="submit">Enregistrer les modifications</button>
        </div>
    </form>
      </div>
    </div>


           <h3 class="text-center mb-4" id="titre2">Localisation</h3>

          <iframe class="w-100 pb-5" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2624.8804569491804!2d2.408585015201738!3d48.8604899085136!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x47e66d8217ad5241%3A0xe08afca8e783132f!2sSIMPLON.CO!5e0!3m2!1sfr!2sfr!4v1537906533041" height="200" frameborder="0" style="border:0" allowfullscreen></iframe>

  </div>
</div>
</div>
    </form>

  </div>
</div>



</div>
</div>
</body>

<!--footer-->
<footer class="footer bg-secondary h-auto  mb-0">
<div class="container">
  <div class="row h-100">
    <div class="col-lg-3 col-md-12 col-sm-12 flex-fill d-flex justify-content-center align-items-center">
      <img src="img/facebook.png" class="img-fluid p-3" alt="Responsive image">
      <img src="img/twitter.png" class="img-fluid p-3" alt="Responsive image">
      <img src="img/instagram.png" class="img-fluid p-3" alt="Responsive image">
    </div>
    <!--<div class="d-sm-flex d-md-flex d-lg-flex justify-content-around align-items-center">-->

      <div class="col-lg-9 col-md-12 col-sm-12 flex-fill">
        <a class = "text-light p-2" href="#">Confidentialité</a>

        <a class = "text-light p-2" href="#">Conditions d'utilisation</a>

        <a class = "text-light p-2" href="#">Nous contacter</a>

        <a class = "text-light p-2" href="#">Newsletter</a>
        <a class="text-light p-2">&copy; EvenTeam 2018</a>
      </div>

      <!--</div>-->
    </div>
  </div>
</footer>
<!-- Bootstrap core JavaScript
  ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>


</html>