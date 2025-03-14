<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Les chaines</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les chaines de caractères</h1>
    <form action="#" method="post">
        <p>Saisir une chaine (Du texte avec 6 caractères minimum) : <input type="text" id="inputValeur" name="chaine"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

    <%-- Récupération des valeurs --%>
    <% 
        String chaine = request.getParameter("chaine");
        if (chaine != null && chaine.length() >= 6) {
    %>

    <p>La longueur de votre chaîne est de <%= chaine.length() %> caractères</p>
    <p>Le 3° caractère de votre chaine est la lettre <%= chaine.charAt(2) %></p>
    <p>Une sous chaine de votre texte : <%= chaine.substring(2, 6) %></p>
    
    <%-- Recherche du premier 'e' --%>
    <% int position = chaine.indexOf('e'); %>
    <p>Votre premier "e" est en : <%= position >= 0 ? position : "Aucun 'e' trouvé" %></p>
    
    <h2>Exercice 1 : Combien de 'e' dans notre chaine de caractères ?</h2>
    <% int countE = 0;
       for (char c : chaine.toCharArray()) {
           if (c == 'e') countE++;
       }
    %>
    <p>Le nombre de 'e' dans votre texte est : <%= countE %></p>

    <h2>Exercice 2 : Affichage vertical</h2>
    <pre>
    <% for (char c : chaine.toCharArray()) { %>
        <%= c %> <br>
    <% } %>
    </pre>

    <h2>Exercice 3 : Retour à la ligne</h2>
    <% String[] mots = chaine.split(" "); %>
    <pre>
    <% for (String mot : mots) { %>
        <%= mot %> <br>
    <% } %>
    </pre>

    <h2>Exercice 4 : Afficher une lettre sur deux</h2>
    <% StringBuilder alternance = new StringBuilder();
       for (int i = 0; i < chaine.length(); i += 2) {
           alternance.append(chaine.charAt(i));
       }
    %>
    <p><%= alternance.toString() %></p>

    <h2>Exercice 5 : La phrase en verlant</h2>
    <% StringBuilder inverser = new StringBuilder(chaine).reverse(); %>
    <p><%= inverser.toString() %></p>

    <h2>Exercice 6 : Consonnes et voyelles</h2>
    <% int voyelles = 0, consonnes = 0;
       String voyellesLettres = "aeiouyAEIOUY";
       for (char c : chaine.toCharArray()) {
           if (Character.isLetter(c)) {
               if (voyellesLettres.indexOf(c) >= 0) {
                   voyelles++;
               } else {
                   consonnes++;
               }
           }
       }
    %>
    <p>Voyelles : <%= voyelles %>, Consonnes : <%= consonnes %></p>

    <% } else { %>
    <p>Veuillez saisir une chaîne d'au moins 6 caractères.</p>
    <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
