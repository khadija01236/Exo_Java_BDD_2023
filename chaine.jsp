public class Chaine {
    public static void main(String[] args) {
        String bonjour = "salut la compagnie";

        System.out.println("Majuscules : " + bonjour.toUpperCase());

        //  chaîne avec la première lettre en majuscule
        String capitalise = capitaliserPremiereLettre(bonjour);
        System.out.println("Première lettre en majuscule : " + capitalise);
    }

    //  uniquement la première lettre en majuscule
    public static String capitaliserPremiereLettre(String texte) {
        if (texte == null || texte.isEmpty()) {
            return texte;
        }
        return texte.substring(0, 1).toUpperCase() + texte.substring(1);
    }
}

