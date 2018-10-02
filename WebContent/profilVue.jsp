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

<body class="h-100">
    <div class="container">
      <form class="" action="ProfilServlet" method="post" onsubmit="return validate()">
        <div class="row d-flex justify-content-center">
          <h1 class="mb-5 font-weight-normal">Mon profil</h1>
        </div>
        <div class="row">
          <div class="col-6">
            <div class="d-flex justify-content-center px-3">
              <img src="img/profil.png" style="height: 250px;" class="img-fluid" alt="photo de profil">
            </div>
            <div class="d-flex justify-content-center mb-4">
              <button class="btn btn-lg btn-primary my-4" type="button" data-toggle="modal" data-target="#exampleModal">Modifier ma photo</button>
            </div>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modifier ma photo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                   
                      <div class="form-group">
                        <label for="exampleFormControlFile1">Importer depuis mes images</label>
                        <input type="file" class="form-control-file mb-5" id="exampleFormControlFile1">
                        <label for="exampleInputURL">URL de l'image</label>
                        <input type="url" class="form-control" id="exampleInputURL" name="" placeholder="Coller l'url de l'image">
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
          <div class="col-6">
            <div class="form-group mb-5 mr-lg-5" >
              <label for="profilNom">Nom :</label>
              <input type="text" name="nom" class="form-control w-75" id="profilNom" placeholder="<%=(session.getAttribute("nom") == null) ? "Votre nom" : session.getAttribute("nom")%>" value="<%=(session.getAttribute("nom") == null) ? "" : session.getAttribute("nom")%>">         
            </div>
            <div class="form-group mb-5 mr-lg-5">
              <label for="profilPrenom">Prénom :</label>
              <input type="text" name="prenom" class="form-control w-75" id="profilPrenom" placeholder="<%=(session.getAttribute("prenom") == null) ? "Votre prénom" : session.getAttribute("prenom")%>" value="<%=(session.getAttribute("prenom") == null) ? "" : session.getAttribute("prenom")%>">
            </div>
            <div class="form-group mb-5 mr-lg-5">
              <label for="profilPseudo">Pseudo :</label>
              <input type="text" name="pseudo" class="form-control w-75" id="profilPseudo" placeholder="<%=(session.getAttribute("pseudo") == null) ? "Votre pseudo" : session.getAttribute("pseudo")%>" value="<%=(session.getAttribute("pseudo") == null) ? "" : session.getAttribute("pseudo")%>">
            </div>
          </div>
        </div>
        <div class="col-12 form-signin" >
          <div class="mb-5">
            <label for="profilMail">Adresse e-mail :</label>
            <input type="text" name="mail" class="form-control" id="profilMail" placeholder="<%=(session.getAttribute("mail") == null) ? "Votre adresse e-mail" : session.getAttribute("mail")%>" value="<%=(session.getAttribute("mail") == null) ? "" : session.getAttribute("mail")%>">
          </div>
          <div class="mb-5" >
            <label for="profilEntreprise">Entreprise :</label>
            <input type="text" name="entreprise" class="form-control" id="profilEntreprise" placeholder="<%=(session.getAttribute("entreprise") == null) ? "Votre entreprise" : session.getAttribute("entreprise")%>" value="<%=(session.getAttribute("entreprise") == null) ? "" : session.getAttribute("entreprise")%>">
          </div>
          <div class="mb-3">
            <label for="profilFonction">Fonction :</label>
            <input type="text" name="fonction" class="form-control" id="profilFonction" placeholder="<%=(session.getAttribute("fonction") == null) ? "Votre fonction" : session.getAttribute("fonction")%>" value="<%=(session.getAttribute("fonction") == null) ? "" : session.getAttribute("fonction")%>">
          </div>
          <div class="d-flex justify-content-center mb-5">
            <button class="btn btn-lg btn-primary my-4" type="submit">Enregistrer les modifications</button>
          </div>
          </div>
          </form>
          
          <form class="col-12 form-signin" action="MotDePasseServlet" method="post" onsubmit="return validate()">
          <div class="mb-5">
            <label for="profilAncienMotDePasse">Ancien mot de passe :</label>
            <input type="password" name="mot_de_passe" class="form-control" id="profilAncienMotDePasse" placeholder="Votre ancien mot de passe" >
          </div>
          <div class="mb-5">
            <label for="profilNouveauMotDePasse">Nouveau mot de passe :</label>
            <input type="password" name="nouveau_mot_de_passe" class="form-control" id="profilNouveauMotDePasse" placeholder="Votre nouveau mot de passe">
          </div>
          <div class="mb-3">
            <label for="profilConfirmerMotDePasse">Confirmer le nouveau mot de passe :</label>
            <input type="password" class="form-control" id="profilConfirmerMotDePasse" placeholder="Confirmer le mot de passe">
          </div>
          <div class="d-flex justify-content-center mb-3">
            <button class="btn btn-lg btn-primary my-4" type="submit">Modifier le mot de passe</button>
          </div>       
      </form>
    </div>

</body>


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
    