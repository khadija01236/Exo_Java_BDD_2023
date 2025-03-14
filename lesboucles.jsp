<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Boucles</title>
    <style>
        body { font-family: Arial, sans-serif; }
        pre { font-size: 16px; }
    </style>
</head>
<body>
    <h1>Exercices sur les boucles</h1>
    <form action="#" method="post">
        <label for="inputValeur">Saisir le nombre d'étoiles : </label>
        <input type="text" id="inputValeur" name="valeur">
        <input type="submit" value="Afficher">
    </form>

    <% 
        String valeur = request.getParameter("valeur"); 
        if (valeur != null && !valeur.isEmpty()) {
            int cpt = Integer.parseInt(valeur);
    %>

    <h2>Exercice 1 : Le carré d'étoiles</h2>
   <pre>
<% for(int j = 0; j < cpt; j++) { 
        for(int i = 0; i < cpt; i++) { 
            out.print("*");
        } 
        out.print("<br>");
   } 
%>
</pre>

    <h2>Exercice 2 : Triangle rectangle gauche</h2>
    <pre>
    <% for(int i = 1; i <= cpt; i++) { 
            for(int j = 0; j < i; j++) { 
                out.print("*");
            } 
            out.print("<br>");
       } 
    %>
    </pre>

    <h2>Exercice 3 : Triangle rectangle inversé</h2>
    <pre>
    <% for(int i = cpt; i > 0; i--) { 
            for(int j = 0; j < i; j++) { 
                out.print("*");
            } 
            out.print("<br>");
       } 
    %>
    </pre>

    <h2>Exercice 4 : Triangle rectangle aligné à droite</h2>
    <pre>
    <% for(int i = 1; i <= cpt; i++) { 
            for(int j = 0; j < cpt - i; j++) { 
                out.print(" ");
            } 
            for(int k = 0; k < i; k++) { 
                out.print("*");
            } 
           out.print("<br>");
       } 
    %>
    </pre>

    <h2>Exercice 5 : Triangle isocèle</h2>
    <pre>
    <% for(int i = 1; i <= cpt; i++) { 
            for(int j = 0; j < cpt - i; j++) { 
                out.print(" ");
            } 
            for(int k = 0; k < (2 * i - 1); k++) { 
                out.print("*");
            } 
            out.print("<br>");
       } 
    %>
    </pre>

    <h2>Exercice 6 : Demi-losange</h2>
    <pre>
    <% for(int i = 1; i <= cpt; i++) { 
            for(int j = 0; j < cpt - i; j++) { 
                out.print(" ");
            } 
            for(int k = 0; k < i; k++) { 
                out.print("*");
            } 
            out.println();
       }
       for(int i = cpt; i > 0; i--) { 
            for(int j = 0; j < cpt - i; j++) { 
                out.print(" ");
            } 
            for(int k = 0; k < i; k++) { 
                out.print("*");
            } 
            out.print("<br>");
       }
    %>
    </pre>

    <h2>Exercice 7 : Table de multiplication</h2>
    <pre>
    <% for(int i = 1; i <= 10; i++) { 
            out.println(cpt + " x " + i + " = " + (cpt * i));
       } 
    %>
    </pre>

    <% } %>

    <p><a href="index.html">Retour au sommaire</a></p>
</body>
</html>
