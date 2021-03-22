package bean;

@SuppressWarnings("serial")
public class MyItem implements java.io.Serializable {

	private int id;      //ＩＤ
	private String name;    //商品名
	private int price;      //単価
	private int count;      //数量
	private int shopNum;
	private String img;
	private int card1;



//setid
	public void setId(int id){
		this.id = id;
	}
//getid
	public int getId(){
		return this.id;
	}
//set商品名
	public void setName(String name){
		this.name = name;
	}
//get商品名
	public String getName(){
		return this.name;
	}
//set単価
	public void setPrice(int price){
		this.price = price;
	}
//get単価
	public int getPrice(){
		return this.price;
	}
//set数量
	public void setCount(int count){
		this.count = count;
	}
//get数量
	public int getCount(){
		return this.count;
	}
//set店番号
	public void setShopNum(int shopNum){
		this.shopNum = shopNum;
		}
//get店番号
	public int getShopNum(){
		return this.shopNum;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getImg() {
		return this.img;
	}
	public void setCard(int card1) {
		this.card1 = card1;
	}
	public int getCard() {
		return this.card1;
	}

}
