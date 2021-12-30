package MyBean;

public class ProductBean {

    String gname;
    float price;
    String image;
    int number;
    int gid;
    float sum;
    int cid;

    public ProductBean( String gname,  float price, String image,int number,int gid,float sum,int cid) {
        this.gname = gname;
        this.price = price;
        this.image = image;
        this.number = number;
        this.gid = gid;
        this.sum = sum;
        this.cid=cid;
    }

    public int getCid() {
        return cid;
    }

    public float getSum() {
        return sum;
    }

    public int getGid() {
        return gid;
    }

    public int getNumber() {
        return number;
    }

    


    public String getGname() {
        return gname;
    }



    public float getPrice() {
        return price;
    }

    public String getImage() {
        return image;
    }




   
}
