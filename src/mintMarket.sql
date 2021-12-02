CREATE TABLE admin
(
    id varchar(30),
    password varchar(100),
    name varchar(30)
);

CREATE TABLE aeskey
(
    key varchar(16)
);

CREATE TABLE bannermarket
(
    no integer,
    image varchar(500),
    date timestamp without time zone DEFAULT timezone('Asia/Seoul'::text, now())
);

CREATE TABLE bannerstore
(
    no integer,
    image varchar(500),
    date timestamp without time zone DEFAULT timezone('Asia/Seoul'::text, now())
);

CREATE TABLE blacklist
(
    blacklist_seq integer NOT NULL DEFAULT nextval('blacklist_blacklist_seq_seq'::regclass),
    name varchar(100),
    email_id varchar(100),
    nickname varchar(100),
    date date DEFAULT now(),
    report_seq integer
);

CREATE TABLE comment
(
    comment_seq integer NOT NULL DEFAULT nextval('comment_comment_seq_seq1'::regclass),
    profile varchar(500),
    nickname varchar(100),
    date timestamp without time zone,
    content varchar(4000),
    board_seq numeric(5,0),
    re_seq numeric(5,0)
);

CREATE TABLE community
(
    community_seq integer NOT NULL DEFAULT nextval('community_community_seq_seq'::regclass),
    title varchar(300),
    category varchar(30),
    date timestamp without time zone DEFAULT timezone('Asia/Seoul'::text, now()),
    nickname varchar(30),
    address2 varchar(100),
    content varchar(4000),
    url varchar(4000),
    views numeric(5,0) DEFAULT 0,
    likes numeric(5,0) DEFAULT 0
);

CREATE TABLE communitycomment
(
    comment_seq integer NOT NULL DEFAULT nextval('comment_comment_seq_seq'::regclass),
    nickname varchar(100) COLLATE pg_catalog."default",
    date timestamp without time zone DEFAULT timezone('Asia/Seoul'::text, now()),
    content varchar(4000) COLLATE pg_catalog."default",
    board_seq numeric(5,0),
    re_seq numeric(5,0)
);

CREATE TABLE communitylike
(
    community_seq numeric(5,0),
    nickname varchar(30) COLLATE pg_catalog."default"
);

CREATE TABLE deletemember
(
    email_id varchar(30),
    password varchar(100),
    name varchar(15),
    nickname varchar(30),
    phone varchar(11),
    address1 varchar(15),
    address2 varchar(100),
    address3 varchar(30),
    birth varchar(6),
    gender varchar(5),
    blacklist_date date,
    social_login varchar(15),
    date timestamp without time zone DEFAULT timezone('Asia/Seoul'::text, now()),
    snsid varchar(50),
    profile varchar(100),
    rating numeric(3,1),
    reports numeric(5,0),
    delete_date timestamp without time zone DEFAULT timezone('Asia/Seoul'::text, now())
);


CREATE TABLE faq
(
    faq_category varchar(20),
    faq_title varchar(300),
    faq_content varchar(4000),
    faq_seq integer NOT NULL DEFAULT nextval('faq_faq_seq_seq'::regclass)
);

CREATE TABLE follow
(
    standard varchar(100),
    target varchar(100)
);

CREATE TABLE market_category_big
(
    num integer NOT NULL DEFAULT nextval('category_big_num_seq'::regclass),
    name varchar(30),
    middle json
);

CREATE TABLE marketboard
(
    market_seq integer NOT NULL DEFAULT nextval('marketboard_market_seq_seq'::regclass),
    img_name varchar(300),
    category_big varchar(30),
    category_middle varchar(30),
    product_name varchar(300),
    product_price numeric(10,0),
    product_content varchar(4000),
    url varchar(4000),
    date timestamp without time zone DEFAULT now(),
    address2 varchar(100),
    nickname varchar(30),
    views numeric(5,0) DEFAULT 0,
    status numeric(1,0) DEFAULT 1,
    buyer varchar(100),
    sell_date timestamp without time zone
);

CREATE TABLE marketlike
(
    market_seq numeric(5,0),
    nickname varchar(30)
);

CREATE TABLE marketrating
(
    market_seq numeric(5,0),
    rating numeric(2,1),
    writer varchar(30),
    date timestamp without time zone,
    content varchar(4000)
);

CREATE TABLE member
(
    email_id varchar(30) NOT NULL,
    password varchar(100),
    name varchar(15),
    nickname varchar(30),
    phone varchar(11),
    address1 varchar(15),
    address2 varchar(30),
    address3 varchar(30),
    birth varchar(6),
    gender varchar(5),
    blacklist_date date,
    social_login varchar(15),
    date timestamp without time zone DEFAULT timezone('Asia/Seoul'::text, now()),
    snsid varchar(50),
    profile varchar(100) DEFAULT 'https://mintmarket.s3.ap-northeast-2.amazonaws.com/profile/user_circle.png'::character varying,
    rating numeric(3,1) DEFAULT 3.0,
    reports numeric(5,0) DEFAULT 0,
    delete_date timestamp without time zone DEFAULT now(),
    CONSTRAINT member_pkey PRIMARY KEY (email_id),
    CONSTRAINT member_nickname_key UNIQUE (nickname)
);

CREATE TABLE message
(
    no integer NOT NULL DEFAULT nextval('message_no_seq'::regclass),
    room integer NOT NULL DEFAULT 0,
    send_nick varchar(50) NOT NULL,
    recv_nick varchar(50) NOT NULL,
    send_time timestamp without time zone NOT NULL,
    read_time timestamp without time zone,
    content varchar(1000),
    image varchar(500),
    read_check integer NOT NULL,
    CONSTRAINT message_pkey PRIMARY KEY (no)
);

CREATE TABLE notice
(
    notice_title varchar(200),
    notice_content varchar(4000),
    date timestamp without time zone,
    notice_seq integer NOT NULL DEFAULT nextval('notice_seq_seq'::regclass),
    status integer
);

CREATE TABLE report
(
    report_seq integer NOT NULL DEFAULT nextval('report_report_seq_seq'::regclass),
    reason varchar(1000),
    content varchar(4000),
    market_seq numeric(5,0),
    reporter varchar(100),
    reported varchar(100),
    date timestamp without time zone DEFAULT timezone('Asia/Seoul'::text, now())
);

CREATE TABLE sales
(
    sales_no integer NOT NULL DEFAULT nextval('sales_sales_no_seq'::regclass),
    product_name varchar(30) NOT NULL,
    product_price integer NOT NULL,
    sales_date timestamp without time zone NOT NULL,
    register_date timestamp without time zone NOT NULL,
    name varchar(30) NOT NULL,
    CONSTRAINT sales_pkey PRIMARY KEY (sales_no)
);

CREATE TABLE sthreekey
(
    ackey varchar(100),
    sekey varchar(100)
);

CREATE TABLE store_cart
(
    cart_id integer NOT NULL DEFAULT nextval('store_cart_cart_id_seq'::regclass),
    nickname varchar(30),
    store_seq integer,
    product_price numeric(10,0),
    amount numeric(2,0),
    url varchar(4000),
    product_name varchar(300),
    CONSTRAINT store_cart_pkey PRIMARY KEY (cart_id)
);

CREATE TABLE store_category_big
(
    num integer,
    name varchar(30) COLLATE pg_catalog."default"
);

CREATE TABLE storeanswer
(
    ask_seq numeric(5,0),
    content varchar(4000),
    date timestamp without time zone DEFAULT now()
);

CREATE TABLE storeask
(
    ask_seq integer NOT NULL DEFAULT nextval('storeask_ask_seq_seq'::regclass),
    store_seq numeric(5,0),
    nickname varchar(30),
    content varchar(4000),
    date timestamp without time zone DEFAULT now(),
    status numeric(1,0),
    product_name varchar(100),
    answer varchar(4000),
    answer_date timestamp without time zone
);

CREATE TABLE storeboard
(
    store_seq integer NOT NULL DEFAULT nextval('storeboard_store_seq_seq'::regclass),
    img_name varchar(300),
    category_big varchar(300),
    product_name varchar(300),
    product_price numeric(10,0),
    product_content varchar(4000),
    product_stock numeric(10,0),
    url varchar(4000),
    date timestamp without time zone,
    product_like integer DEFAULT 0
);

CREATE TABLE storelike
(
    store_seq numeric(5,0),
    nickname varchar(30)
);

CREATE TABLE storerate
(
    store_seq numeric(5,0),
    nickname varchar(30),
    rating numeric(3,1),
    content varchar(4000),
    date timestamp without time zone DEFAULT now(),
    rate_seq integer NOT NULL DEFAULT nextval('storerate_rate_seq_seq'::regclass)
);

CREATE TABLE tablemember
(
    name varchar(30),
    id varchar(30),
    nickname varchar(30),
    register timestamp(6) without time zone
);

CREATE TABLE transactionhistory
(
    transaction_seq integer NOT NULL DEFAULT nextval('transactionhistory_transaction_seq_seq'::regclass),
    email_id varchar(100),
    product_name varchar(100),
    transaction_price numeric(10,0),
    transaction_count numeric(10,0),
    date timestamp without time zone DEFAULT timezone('Asia/Seoul'::text, now()),
    merchant_uid varchar(100),
    product_price numeric(10,0),
    request varchar(1000),
    address2 varchar(100),
    status varchar(30),
    cancel_date timestamp without time zone,
    cancel_status varchar(30),
    cancel_reason varchar(4000),
    pay_cancel varchar(100),
    exchange_count integer DEFAULT 0
);