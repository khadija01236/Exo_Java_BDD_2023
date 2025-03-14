<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Les tableaux</title>
</head>
<body bgcolor="white">
    <h1>Exercices sur les tableaux</h1>
    <form action="#" method="post">
        <p>Saisir au minimum 3 chiffres à la suite, exemple : 6 78 15 <input type="text" id="inputValeur" name="chaine"></p>
        <p><input type="submit" value="Afficher"></p>
    </form>

    <% String chaine = request.getParameter("chaine"); %>
    <% if (chaine != null && !chaine.isEmpty()) { %>
        <% String[] tableauDeChiffres = chaine.split("\\s+");
           int[] nombres = new int[tableauDeChiffres.length];
           for (int i = 0; i < tableauDeChiffres.length; i++) {
               nombres[i] = Integer.parseInt(tableauDeChiffres[i]);
           }
        %>
        <p>Le tableau contient <%= nombres.length %> valeurs</p>
        <% for (int i = 0; i < nombres.length; i++) { %>
            <p>Chiffre <%= i + 1 %> : <%= nombres[i] %></p>
        <% } %>
        
        <h2>Exercice 1 : Le carré de la première valeur</h2>
        <p>Le carré de la première valeur est : <%= nombres[0] * nombres[0] %></p>
        
        <h2>Exercice 2 : La somme des 2 premières valeurs</h2>
        <p>La somme des deux premières valeurs est : <%= nombres[0] + nombres[1] %></p>
        
        <h2>Exercice 3 : La somme de toutes les valeurs</h2>
        <% int somme = 0;
           for (int nombre : nombres) {
               somme += nombre;
           }
        %>
        <p>La somme de toutes les valeurs est : <%= somme %></p>
        
        <h2>Exercice 4 : La valeur maximale</h2>
        <% int max = nombres[0];
           for (int nombre : nombres) {
               if (nombre > max) max = nombre;
           }
        %>
        <p>La valeur maximale est : <%= max %></p>
        
        <h2>Exercice 5 : La valeur minimale</h2>
        <% int min = nombres[0];
           for (int nombre : nombres) {
               if (nombre < min) min = nombre;
           }
        %>
        <p>La valeur minimale est : <%= min %></p>
        
        <h2>Exercice 6 : La valeur la plus proche de 0</h2>
        <% int procheZero = nombres[0];
           for (int nombre : nombres) {
               if (Math.abs(nombre) < Math.abs(procheZero)) {
                   procheZero = nombre;
               }
           }
        %>
        <p>La valeur la plus proche de 0 est : <%= procheZero %></p>
        
        <h2>Exercice 7 : La valeur la plus proche de 0 (2° version)</h2>
        <% int procheZeroV2 = nombres[0];
           for (int nombre : nombres) {
               if (Math.abs(nombre) < Math.abs(procheZeroV2) ||
                   (Math.abs(nombre) == Math.abs(procheZeroV2) && nombre > procheZeroV2)) {
                   procheZeroV2 = nombre;
               }
           }
        %>
        <p>La valeur la plus proche de 0 (avec priorité au positif) est : <%= procheZeroV2 %></p>
    <% } %>
    
    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
