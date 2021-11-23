package four.mint.web.user.servicecenter;

import lombok.Data;

@Data
public class ServiceCenterFaqVO {
	private int faq_seq;
	private String faq_category;
	private String faq_title;
	private String faq_content;
}
