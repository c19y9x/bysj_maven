package domain;

public class ZiLanmu {
    private int id;
    private String zlmname;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getZlmname() {
        return zlmname;
    }

    public void setZlmname(String zlmname) {
        this.zlmname = zlmname;
    }

    @Override
    public String toString() {
        return "ZiLanmu{" +
                "id=" + id +
                ", zlmname='" + zlmname + '\'' +
                '}';
    }
}
