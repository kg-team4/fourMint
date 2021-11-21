package four.mint.web.admin.banner.store;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class AdminBannerStoreVO {
	private int no;
	private String image;
	private Timestamp date;
}
