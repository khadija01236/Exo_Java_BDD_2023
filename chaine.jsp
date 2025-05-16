<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Exercice sur les chaînes</title>
    <meta charset="UTF-8">
</head>
<body bgcolor="white">

<table border="0">
<tr>
    <td></td>
    <td>
        <h1>Exercices de programmation en JSP (Java)</h1>
        <p>Ceci est votre page d'exercices sur les chaînes de caractères</p>
    </td>
</tr>
</table>

<h2>Résultat des manipulations sur les chaînes</h2>
<%
    String bonjour = "salut la compagnie";

    // Affichage en majuscules
    String bonjourMajuscules = bonjour.toUpperCase();

    // Méthode pour mettre la première lettre en majuscule
    String capitalisePremiereLettre = "";
    if (bonjour != null && bonjour.length() > 0) {
        capitalisePremiereLettre = bonjour.substring(0, 1).toUpperCase() + bonjour.substring(1);
    }
%>

<ul>
    <li>Chaîne d'origine : <b><%= bonjour %></b></li>
    <li>Chaîne en majuscules : <b><%= bonjourMajuscules %></b></li>
    <li>Première lettre en majuscule : <b><%= capitalisePremiereLettre %></b></li>
</ul>

</body>
</html>
