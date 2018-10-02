<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


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

  <div class="container">
    <div class="row">
      <div class="col-sm-12 col-md-12 col-lg-6 py-1 flex-fill d-flex justify-content-between align-items-center">
        <div class="form-check">
          <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
          <label class="form-check-label" for="defaultCheck1">
            Hackathons
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
          <label class="form-check-label" for="defaultCheck2">
            Meetup
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="checkbox" value="" id="defaultCheck3">
          <label class="form-check-label" for="defaultCheck3">
            Ateliers coworking
          </label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="checkbox" value="" id="defaultCheck4">
          <label class="form-check-label" for="defaultCheck4">
            Conférences
          </label>
        </div>
      </div>

	<div class="col-sm-12 col-md-12 col-lg-6 py-1 flex-fill d-flex justify-content-center align-items-center">
		<div class=" input-group w-50">
          <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">Date </span>
          </div>
          <input type="text" class="form-control" placeholder=" " aria-label="Username" aria-describedby="basic-addon1">
        </div>
        <div class="dropdown px-3">
    	  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    	    Filtrer par...
    	  </button>
    	  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    	    <a class="dropdown-item" href="#">Lieu</a>
    	    <a class="dropdown-item" href="#">Les événements à venir</a>
    	    <a class="dropdown-item" href="#">Nouveaux événements</a>
    	  </div>
    	</div>        
      </div>
    </div>
  </div>
  
  
  
  
  
  <div class="container d-flex justify-content-center">
    <div class="row justify-content-around">
    
    <jsp:include page="evenementsControleur.jsp"></jsp:include>

      <div class="card shadow-sm p-2 mb-4 bg-white rounded" style="width: 19rem;">
        <img class="card-img-top img-fluid h-50" src="img/2093505.jpg" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Card title</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary btn-lg">Plus de détails</a>
        </div>
      </div>

      <div class="card shadow-sm p-2 mb-4 bg-white rounded" style="width: 19rem;">
        <img class="card-img-top img-fluid h-50" src="img/maison3d.jpg" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Card title</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary btn-lg">Plus de détails</a>
        </div>
      </div>

      <div class="card shadow-sm p-2 mb-4 bg-white rounded" style="width: 19rem;">
        <img class="card-img-top img-fluid h-50" src="img/tech.jpg" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Card title</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary btn-lg">Plus de détails</a>
        </div>
      </div>

      <div class="card shadow-sm p-2 mb-4 bg-white rounded" style="width: 19rem;">
        <img class="card-img-top img-fluid h-50" src="img/Les-robots-seront-ils-patrons-demain--T.jpg" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Card title</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary btn-lg">Plus de détails</a>
        </div>
      </div>

      <div class="card shadow-sm p-2 mb-4 bg-white rounded" style="width: 19rem;">
        <img class="card-img-top img-fluid h-50" src="img/technology (1).jpg" alt="Card image cap">
        <div class="card-body">
          <h5 class="card-title">Card title</h5>
          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary btn-lg">Plus de détails</a>
        </div>
      </div>
      <a href="<%=(session.getAttribute("isConnecte") == null) ? "connexionVue.jsp" : "creerEvenementVue.jsp"%>" class="d-flex justify-content-center align-items-center" style="position:fixed;width:60px;height:60px;bottom:40px;right:40px;background-color:#0C9;color:#FFF;border-radius:50px;text-align:center;box-shadow: 2px 2px 3px #999;">
		<i class="fa fa-plus my-float"></i>
		</a>
	
		

    </div>
  </div>

  <nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
      <li class="page-item disabled">
        <a class="page-link" href="#" aria-label="Previous">
          <span aria-hidden="true">&laquo;</span>
          <span class="sr-only">Previous</span>
        </a>
      </li>
      <li class="page-item"><a class="page-link" href="#">1</a></li>
      <li class="page-item"><a class="page-link" href="#">2</a></li>
      <li class="page-item"><a class="page-link" href="#">3</a></li>
      <li class="page-item"><a class="page-link" href="#">4</a></li>
      <li class="page-item"><a class="page-link" href="#">5</a></li>
      <li class="page-item">
        <a class="page-link" href="#" aria-label="Next">
           <span aria-hidden="true">&raquo;</span>
           <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>
  </nav>

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