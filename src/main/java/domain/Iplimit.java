package domain;

public class Iplimit {
    private String ipmethod;
    private String value;

    public String getIpmethod() {
        return ipmethod;
    }

    public void setIpmethod(String ipmethod) {
        this.ipmethod = ipmethod;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "Iplimit{" +
                "ipmethod='" + ipmethod + '\'' +
                ", value='" + value + '\'' +
                '}';
    }
}
