package domain;

import java.util.List;

public class ShouyePage {
    private List<Lanmu> lanmus;
    private List<ShouyeContent> shouyeContents;

    public List<Lanmu> getLanmus() {
        return lanmus;
    }

    public void setLanmus(List<Lanmu> lanmus) {
        this.lanmus = lanmus;
    }

    public List<ShouyeContent> getShouyeContents() {
        return shouyeContents;
    }

    public void setShouyeContents(List<ShouyeContent> shouyeContents) {
        this.shouyeContents = shouyeContents;
    }

    @Override
    public String toString() {
        return "ShouyePage{" +
                "lanmus=" + lanmus +
                ", shouyeContents=" + shouyeContents +
                '}';
    }
}
