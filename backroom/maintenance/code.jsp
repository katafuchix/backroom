<%@ page import="java.util.*" contentType="text/html; charset=shift_jis"%>
<%@ taglib uri="/WEB-INF/app.tld" prefix="app" %>
<app:CheckMaintenaceLogon/>
<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=Shift_JIS">

<title>LMJ Maintenance</title>
<script type="text/javascript" src="mtmcode.js">
</script>

<script type="text/javascript">

MTMDefaultTarget = "text";

/******************************************************************************
* User-configurable list of icons.                                            *
******************************************************************************/

var MTMIconList = null;
MTMIconList = new IconList();
MTMIconList.addIcon(new MTMIcon("menu_link_external.gif", "http://", "pre"));
MTMIconList.addIcon(new MTMIcon("menu_link_pdf.gif", ".pdf", "post"));

/******************************************************************************
* User-configurable menu.                                                     *
******************************************************************************/

// Main menu.
var menu = null;
menu = new MTMenu();
/*==================== add コンテンツ管理者サイト  =========================**/
menu.addItem("コンテンツ管理者サイト ");

	/*=============== 国内ホテル・宿管理者サイト  =========================**/

	var number_1 = null;
	number_1 = new MTMenu();
	number_1.addItem("国内ホテル・宿");
	var number_1_1 = null;
	number_1_1 = new MTMenu();
	number_1_1.addItem("ホームページ管理", "hotel/hotel.jsp","text");
//	number_1_1.addItem("目的別管理", "hotel/hotel_01.jsp","text");
//	number_1_1.addItem("エリア別管理", "hotel/hotel_02.jsp","text");
	number_1_1.addItem("施設別管理", "hotel/index.jsp","text");
	number_1_1.addItem("ローカルエリア管理", "hotel/localarea/index.jsp","text");

//add for test
	number_1_1.addItem("カテゴリテスト", "hotel/category/index.jsp","text");

	number_1.makeLastSubmenu(number_1_1);

	/*=============== //国内ホテル・宿管理者サイト  =========================**/

	/*=============== ギフト 管理者サイト  ==================================**/

	number_1.addItem("ギフト");
	var number_1_2 = null;
	number_1_2 = new MTMenu();
	number_1_2.addItem("ホームページ管理", "gift/gift.jsp","text");
	number_1_2.addItem("価格ページ管理", "gift/	gift_sub01.jsp", "text");
	number_1_2.addItem("目的ページ管理", "gift/	gift_sub02.jsp", "text");
	number_1_2.addItem("商品追加", "gift/index.jsp","text");
	number_1_2.addItem("サプライヤー別管理", "gift/index_agent.jsp","text");
	number_1_2.addItem("小カテゴリー別管理", "gift/index_scatid.jsp","text");
	number_1.makeLastSubmenu(number_1_2);

	/*=============== //ギフト 管理者サイト  ================================**/

	/*=============== 格安航空券 管理者サイト  ==================================**/

	number_1.addItem("格安航空券");
	var number_1_3 = null;
	number_1_3 = new MTMenu();
	number_1_3.addItem("ホームページ管理", "lmj/flight/list.jsp","text");
	number_1.makeLastSubmenu(number_1_3);

	/*=============== //ギフト 管理者サイト  ================================**/

	/*=============== LMJ独自ホテル 管理者サイト  ==================================**/

//	number_1.addItem("LMJ独自ホテル");
//	var number_1_4 = null;
//	number_1_4 = new MTMenu();
//	number_1_4.addItem("施設追加", "lmj/lmj_hotel/master_form.jsp","text");
//	number_1_4.addItem("施設更新", "lmj/lmj_hotel/list.jsp","text");
//	number_1.makeLastSubmenu(number_1_4);

	/*=============== //LMJ独自ホテル 管理者サイト  ================================**/


	/*=============== チケット 管理者サイト  ==================================**/

	number_1.addItem("チケット");
	var number_1_4 = null;
	number_1_4 = new MTMenu();
	number_1_4.addItem("ホームページ管理", "ticket/ticket.jsp","text");
	number_1_4.addItem("チケット追加", "ticket/info/insertForm.jsp","text");
	number_1_4.addItem("チケット更新", "ticket/index.jsp?limittype=0","text");
	number_1_4.addItem("在庫", "ticket/allot/monolist.jsp","text");
	number_1.makeLastSubmenu(number_1_4);

	/*=============== //チケット 管理者サイト  ================================**/

	/*=============== レストラン 管理者サイト  ==================================**/

	number_1.addItem("レストラン");
	var number_1_5 = null;
	number_1_5 = new MTMenu();
	number_1_5.addItem("ホームページ管理", "Restraunt/restraunt.jsp","text");
	number_1_5.addItem("小カテゴリー", "Restraunt/scatid/index.jsp?limittype=0","text");
	number_1.makeLastSubmenu(number_1_5);

	/*=============== //レストラン 管理者サイト  ================================**/

	/*=============== アミューズメント 管理者サイト  ==================================**/

	number_1.addItem("アミューズメント");
	var number_1_6 = null;
	number_1_6 = new MTMenu();
	number_1_6.addItem("商品情報追加", "amuse/info/insertForm.jsp","text");
	number_1_6.addItem("商品情報更新", "amuse/index.jsp?limittype=0","text");
	number_1.makeLastSubmenu(number_1_6);

	/*=============== //レストラン 管理者サイト  ================================**/
	menu.makeLastSubmenu(number_1);

/*==================== //コンテンツ管理者サイト  =========================**/

/*=============== カテゴリ管理サイト  ==================================**/
menu.addItem("LMJ管理者サイト ");

	var number_2 = null;
	number_2 = new MTMenu();
	number_2.addItem("小カテゴリー管理");
	var number_2_1 = null;
	number_2_1 = new MTMenu();
	number_2_1.addItem("追加", "scatid/scatidInsertForm.jsp","text");
	number_2_1.addItem("情報更新", "scatid/index.jsp","text");
	number_2.makeLastSubmenu(number_2_1);

/*=============== ホテル小カテゴリー管理サイト  ==================================**/

	number_2.addItem("ホテル小カテゴリー管理");
	var number_2_2 = null;
	number_2_2 = new MTMenu();
	number_2_2.addItem("追加", "hscatid/scatidInsertForm.jsp","text");
	number_2_2.addItem("情報更新", "hscatid/index.jsp","text");
	number_2.makeLastSubmenu( number_2_2 );

/*=============== ホテルキャンペーン管理サイト  ==================================**/

	number_2.addItem("ホテルキャンペーン管理");
	var number_2_3 = null;
	number_2_3 = new MTMenu();
	number_2_3.addItem("追加", "campaign/campaignInsertForm.jsp","text");
	number_2_3.addItem("情報更新", "campaign/index.jsp","text");
	number_2.makeLastSubmenu(number_2_3);

menu.makeLastSubmenu(number_2);
/*=============== //カテゴリ管理サイト  ==================================**/

/*=============== カテゴリ管理サイト  ==================================**/
//menu.addItem("申込み管理 ");
//
//	var number_3 = null;
//	number_3 = new MTMenu();
//	number_3.addItem("ギフト", "lmj/Settlement/goods/index.jsp","text");
//	number_3.addItem("格安航空券", "lmj/flight/navi.jsp","text");
//	number_3.addItem("海外パッケージツアー", "lmj/overseaTours/navi.jsp","text");
//
//menu.makeLastSubmenu(number_3);
/*=============== //カテゴリ管理サイト  ==================================**/

/*=============== エージェント管理サイト  ==================================**/
//menu.addItem("エージェント管理 ");

//	var number_3 = null;
//	number_3 = new MTMenu();
//	number_3.addItem("エージェント管理", "lmj/agent/index.jsp","text");

// menu.makeLastSubmenu(number_3);
/*=============== //エージェント管理サイト  ==================================**/
/*=============== ユーザー管理サイト  ==================================**/
//menu.addItem("ユーザー管理 ");

//	var number_4 = null;
//	number_4 = new MTMenu();
//	number_4.addItem("ユーザー管理", "lmj/user/index.jsp","text");

//menu.makeLastSubmenu(number_4);
/*=============== //ユーザー管理サイト  ==================================**/
/*=============== ユーザー管理サイト  ==================================**/
menu.addItem("コンテキスト管理 ");

	var number_5 = null;
	number_5 = new MTMenu();
	number_5.addItem("コンテキスト管理", "Contextmentenance.jsp","text");

menu.makeLastSubmenu(number_5);
/*=============== //ユーザー管理サイト  ==================================**/
</script>
</head>
<body onload="MTMStartMenu(true)" bgcolor="#000033" text="#ffffcc" link="yellow" vlink="lime" alink="red">
</body>
</html>
