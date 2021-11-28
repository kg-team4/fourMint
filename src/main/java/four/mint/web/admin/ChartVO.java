package four.mint.web.admin;

import java.sql.Timestamp;
import java.util.TimeZone;

import lombok.Data;

@Data
public class ChartVO {
		private int sales_amount;
		private int sales_count;// quantity of sales
		// @JsonFormat(pattern="yy-MM-dd")
		private String daily_chart;
		// @JsonFormat(pattern="yyyy-MM-dd")
		private String month_chart;
		// @JsonFormat(pattern="yyyy-MM")
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

