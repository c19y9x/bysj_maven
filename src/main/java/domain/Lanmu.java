package domain;

public class Lanmu {
    private int id;
    private String lanmuming;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLanmuming() {
        return lanmuming;
    }

    public void setLanmuming(String lanmuming) {
        this.lanmuming = lanmuming;
    }

    @Override
    public String toString() {
        return "lanmu{" +
                "id=" + id +
                ", lanmuming='" + lanmuming + '\'' +
                '}';
    }
}

