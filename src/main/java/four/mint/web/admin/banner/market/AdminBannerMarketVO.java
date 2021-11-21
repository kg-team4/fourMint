package four.mint.web.admin.banner.market;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminBannerMarketVO {
	private int no;
	private String image;
	private Timestamp date;
}
