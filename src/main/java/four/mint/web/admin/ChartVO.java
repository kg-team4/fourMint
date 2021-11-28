package four.mint.web.admin;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ChartVO {
	private int sales_amount;
	private int sales_count;// quantity of sales
	@JsonFormat(pattern="YY-MM-dd")
	private String daily_chart;
	@JsonFormat(pattern="yyyy-MM")
	private String month_chart;
	@JsonFormat(pattern="YYYY")
	private String year_chart;

	private String transaction_price;
//		private Timestamp start_date;
//		private Timestamp end_date;
	private String start_date;
	private String end_date;
	private String date_term;
	private String status;
	private String product_name;
	private String startDate;
	private String endDate;
}
