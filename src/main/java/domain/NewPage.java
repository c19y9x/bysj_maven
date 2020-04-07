package domain;

import java.util.List;

public class NewPage {
    private Lanmu lm; //栏目名
    private List<ZiLanmu> zids; //子栏目名

    public Lanmu getLm() {
        return lm;
    }

    public void setLm(Lanmu lm) {
        this.lm = lm;
    }

    public List<ZiLanmu> getZids() {
        return zids;
    }

    public void setZids(List<ZiLanmu> zids) {
        this.zids = zids;
    }

    @Override
    public String toString() {
        return "NewPage{" +
                "lm=" + lm +
                ", zids=" + zids +
                '}';
    }
}
