public class Task {
    private String titre;
    private String description;
    private String dateEcheance;
    private boolean terminee;

    public Task(String titre, String description, String dateEcheance) {
        this.titre = titre;
        this.description = description;
        this.dateEcheance = dateEcheance;
        this.terminee = false;
    }

    public String getTitre() { return titre; }
    public String getDescription() { return description; }
    public String getDateEcheance() { return dateEcheance; }
    public boolean isTerminee() { return terminee; }
    public void setTerminee(boolean terminee) { this.terminee = terminee; }
}
