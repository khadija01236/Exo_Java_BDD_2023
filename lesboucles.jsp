<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>

<html>
<head>
    <title>Gestionnaire de tâches</title>
</head>
<body bgcolor="white">
    <h1>Ajouter une tâche</h1>

    <form method="post">
        <label>Titre :</label>
        <input type="text" name="titre" required><br><br>

        <label>Description :</label><br>
        <textarea name="description" rows="4" cols="40" required></textarea><br><br>

        <label>Date d'échéance :</label>
        <input type="date" name="date" required><br><br>

        <input type="submit" name="action" value="Ajouter">
    </form>

    <hr>

<%! 
    public class Task {
        String titre;
        String description;
        String date;
        boolean terminee;

        public Task(String titre, String description, String date) {
            this.titre = titre;
            this.description = description;
            this.date = date;
            this.terminee = false;
        }
    }
%>

<%
    // Récupérer la liste des tâches
    List<Task> taches = (List<Task>) session.getAttribute("taches");
    if (taches == null) {
        taches = new ArrayList<Task>();
    }

    String action = request.getParameter("action");

    // Ajouter une nouvelle tâche
    if ("Ajouter".equals(action)) {
        String titre = request.getParameter("titre");
        String description = request.getParameter("description");
        String date = request.getParameter("date");

        Task nouvelleTache = new Task(titre, description, date);
        taches.add(nouvelleTache);
        session.setAttribute("taches", taches);
    }

    // Supprimer une tâche
    String deleteIndexStr = request.getParameter("supprimer");
    if (deleteIndexStr != null) {
        int index = Integer.parseInt(deleteIndexStr);
        if (index >= 0 && index < taches.size()) {
            taches.remove(index);
            session.setAttribute("taches", taches);
        }
    }

    // Marquer une tâche comme terminée
    String doneIndexStr = request.getParameter("terminer");
    if (doneIndexStr != null) {
        int index = Integer.parseInt(doneIndexStr);
        if (index >= 0 && index < taches.size()) {
            taches.get(index).terminee = true;
            session.setAttribute("taches", taches);
        }
    }
%>

    <h2>Liste des tâches</h2>

    <%
        if (taches.isEmpty()) {
    %>
        <p>Aucune tâche enregistrée.</p>
    <%
        } else {
    %>
        <table border="1" cellpadding="8">
            <tr>
                <th>#</th>
                <th>Titre</th>
                <th>Description</th>
                <th>Date d'échéance</th>
                <th>Statut</th>
                <th>Actions</th>
            </tr>
            <%
                for (int i = 0; i < taches.size(); i++) {
                    Task t = taches.get(i);
            %>
                <tr>
                    <td><%= i + 1 %></td>
                    <td><%= t.titre %></td>
                    <td><%= t.description %></td>
                    <td><%= t.date %></td>
                    <td><%= t.terminee ? "Terminée" : "En cours" %></td>
                    <td>
                        <form method="post" style="display:inline;">
                            <input type="hidden" name="supprimer" value="<%= i %>">
                            <input type="submit" value="Supprimer">
                        </form>
                        <% if (!t.terminee) { %>
                        <form method="post" style="display:inline;">
                            <input type="hidden" name="terminer" value="<%= i %>">
                            <input type="submit" value="Terminer">
                        </form>
                        <% } %>
                    </td>
                </tr>
            <%
                }
            %>
        </table>
    <%
        }
    %>

    <br><br>
    <a href="index.html">Retour à l'accueil</a>

</body>
</html>
