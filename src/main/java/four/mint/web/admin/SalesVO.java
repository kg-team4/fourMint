package four.mint.web.admin;

import java.util.Date;

public class SalesVO {
	int sales_no;
	String product_name;
	int product_price;
	Date sales_date;
	Date register_Date;
	String name;
	public int getSales_no() {
		return sales_no;
	}
	public void setSales_no(int sales_no) {
		this.sales_no = sales_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public Date getSales_date() {
		return sales_date;
	}
	public void setSales_date(Date sales_date) {
		this.sales_date = sales_date;
	}
	public Date getRegister_Date() {
		return register_Date;
	}
	public void setRegister_Date(Date register_Date) {
		this.register_Date = register_Date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
