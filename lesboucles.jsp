<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<html>
<head>
    <title>Gestion des tâches</title>
</head>
<body bgcolor="white">
    <h1>Saisir une tâche</h1>

    <form method="post">
        <label for="inputValeur">Saisir le nom d'une tâche :</label>
        <input type="text" id="inputValeur" name="valeur" required>
        <input type="submit" value="Enregistrer">
    </form>

<%! 
    public class MyClass {
        String nameTache;
        public MyClass(String name) {
            nameTache = name;
        }
    }
%>

<%
    // Récupérer la liste de tâches depuis la session
    List<MyClass> taches = (List<MyClass>) session.getAttribute("taches");
    if (taches == null) {
        taches = new ArrayList<MyClass>();
    }

    // Ajouter une nouvelle tâche si envoyée
    String valeur = request.getParameter("valeur");
    if (valeur != null && !valeur.trim().isEmpty()) {
        MyClass nouvelleTache = new MyClass(valeur);
        taches.add(nouvelleTache);
        session.setAttribute("taches", taches);
    }
%>

    <h2>Liste des tâches enregistrées</h2>

    <%
        if (taches.isEmpty()) {
    %>
        <p>Aucune tâche enregistrée pour le moment.</p>
    <%
        } else {
    %>
        <table border="1" cellpadding="10">
            <tr>
                <th>#</th>
                <th>Nom de la tâche</th>
            </tr>
            <%
                int i = 1;
                for (MyClass t : taches) {
            %>
                <tr>
                    <td><%= i++ %></td>
                    <td><%= t.nameTache %></td>
                </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>

</body>
</html>
