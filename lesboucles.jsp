<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Ajouter une tâche</title>
</head>
<body>
    <h1>Ajouter une nouvelle tâche</h1>
    
    <form action="TaskServlet" method="post">
        <label for="titre">Titre :</label>
        <input type="text" id="titre" name="titre" required><br><br>

        <label for="description">Description :</label><br>
        <textarea id="description" name="description" rows="4" cols="40" required></textarea><br><br>

        <label for="date">Date d'échéance :</label>
        <input type="date" id="date" name="date" required><br><br>

        <input type="submit" value="Ajouter la tâche">
    </form>

    <br>
    <a href="lesconditions.jsp">Voir les tâches</a>
</body>
</html>
