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
/*==================== add �R���e���c�Ǘ��҃T�C�g  =========================**/
menu.addItem("�R���e���c�Ǘ��҃T�C�g ");

	/*=============== �����z�e���E�h�Ǘ��҃T�C�g  =========================**/

	var number_1 = null;
	number_1 = new MTMenu();
	number_1.addItem("�����z�e���E�h");
	var number_1_1 = null;
	number_1_1 = new MTMenu();
	number_1_1.addItem("�z�[���y�[�W�Ǘ�", "hotel/hotel.jsp","text");
//	number_1_1.addItem("�ړI�ʊǗ�", "hotel/hotel_01.jsp","text");
//	number_1_1.addItem("�G���A�ʊǗ�", "hotel/hotel_02.jsp","text");
	number_1_1.addItem("�{�ݕʊǗ�", "hotel/index.jsp","text");
	number_1_1.addItem("���[�J���G���A�Ǘ�", "hotel/localarea/index.jsp","text");

//add for test
	number_1_1.addItem("�J�e�S���e�X�g", "hotel/category/index.jsp","text");

	number_1.makeLastSubmenu(number_1_1);

	/*=============== //�����z�e���E�h�Ǘ��҃T�C�g  =========================**/

	/*=============== �M�t�g �Ǘ��҃T�C�g  ==================================**/

	number_1.addItem("�M�t�g");
	var number_1_2 = null;
	number_1_2 = new MTMenu();
	number_1_2.addItem("�z�[���y�[�W�Ǘ�", "gift/gift.jsp","text");
	number_1_2.addItem("���i�y�[�W�Ǘ�", "gift/	gift_sub01.jsp", "text");
	number_1_2.addItem("�ړI�y�[�W�Ǘ�", "gift/	gift_sub02.jsp", "text");
	number_1_2.addItem("���i�ǉ�", "gift/index.jsp","text");
	number_1_2.addItem("�T�v���C���[�ʊǗ�", "gift/index_agent.jsp","text");
	number_1_2.addItem("���J�e�S���[�ʊǗ�", "gift/index_scatid.jsp","text");
	number_1.makeLastSubmenu(number_1_2);

	/*=============== //�M�t�g �Ǘ��҃T�C�g  ================================**/

	/*=============== �i���q�� �Ǘ��҃T�C�g  ==================================**/

	number_1.addItem("�i���q��");
	var number_1_3 = null;
	number_1_3 = new MTMenu();
	number_1_3.addItem("�z�[���y�[�W�Ǘ�", "lmj/flight/list.jsp","text");
	number_1.makeLastSubmenu(number_1_3);

	/*=============== //�M�t�g �Ǘ��҃T�C�g  ================================**/

	/*=============== LMJ�Ǝ��z�e�� �Ǘ��҃T�C�g  ==================================**/

//	number_1.addItem("LMJ�Ǝ��z�e��");
//	var number_1_4 = null;
//	number_1_4 = new MTMenu();
//	number_1_4.addItem("�{�ݒǉ�", "lmj/lmj_hotel/master_form.jsp","text");
//	number_1_4.addItem("�{�ݍX�V", "lmj/lmj_hotel/list.jsp","text");
//	number_1.makeLastSubmenu(number_1_4);

	/*=============== //LMJ�Ǝ��z�e�� �Ǘ��҃T�C�g  ================================**/


	/*=============== �`�P�b�g �Ǘ��҃T�C�g  ==================================**/

	number_1.addItem("�`�P�b�g");
	var number_1_4 = null;
	number_1_4 = new MTMenu();
	number_1_4.addItem("�z�[���y�[�W�Ǘ�", "ticket/ticket.jsp","text");
	number_1_4.addItem("�`�P�b�g�ǉ�", "ticket/info/insertForm.jsp","text");
	number_1_4.addItem("�`�P�b�g�X�V", "ticket/index.jsp?limittype=0","text");
	number_1_4.addItem("�݌�", "ticket/allot/monolist.jsp","text");
	number_1.makeLastSubmenu(number_1_4);

	/*=============== //�`�P�b�g �Ǘ��҃T�C�g  ================================**/

	/*=============== ���X�g���� �Ǘ��҃T�C�g  ==================================**/

	number_1.addItem("���X�g����");
	var number_1_5 = null;
	number_1_5 = new MTMenu();
	number_1_5.addItem("�z�[���y�[�W�Ǘ�", "Restraunt/restraunt.jsp","text");
	number_1_5.addItem("���J�e�S���[", "Restraunt/scatid/index.jsp?limittype=0","text");
	number_1.makeLastSubmenu(number_1_5);

	/*=============== //���X�g���� �Ǘ��҃T�C�g  ================================**/

	/*=============== �A�~���[�Y�����g �Ǘ��҃T�C�g  ==================================**/

	number_1.addItem("�A�~���[�Y�����g");
	var number_1_6 = null;
	number_1_6 = new MTMenu();
	number_1_6.addItem("���i���ǉ�", "amuse/info/insertForm.jsp","text");
	number_1_6.addItem("���i���X�V", "amuse/index.jsp?limittype=0","text");
	number_1.makeLastSubmenu(number_1_6);

	/*=============== //���X�g���� �Ǘ��҃T�C�g  ================================**/
	menu.makeLastSubmenu(number_1);

/*==================== //�R���e���c�Ǘ��҃T�C�g  =========================**/

/*=============== �J�e�S���Ǘ��T�C�g  ==================================**/
menu.addItem("LMJ�Ǘ��҃T�C�g ");

	var number_2 = null;
	number_2 = new MTMenu();
	number_2.addItem("���J�e�S���[�Ǘ�");
	var number_2_1 = null;
	number_2_1 = new MTMenu();
	number_2_1.addItem("�ǉ�", "scatid/scatidInsertForm.jsp","text");
	number_2_1.addItem("���X�V", "scatid/index.jsp","text");
	number_2.makeLastSubmenu(number_2_1);

/*=============== �z�e�����J�e�S���[�Ǘ��T�C�g  ==================================**/

	number_2.addItem("�z�e�����J�e�S���[�Ǘ�");
	var number_2_2 = null;
	number_2_2 = new MTMenu();
	number_2_2.addItem("�ǉ�", "hscatid/scatidInsertForm.jsp","text");
	number_2_2.addItem("���X�V", "hscatid/index.jsp","text");
	number_2.makeLastSubmenu( number_2_2 );

/*=============== �z�e���L�����y�[���Ǘ��T�C�g  ==================================**/

	number_2.addItem("�z�e���L�����y�[���Ǘ�");
	var number_2_3 = null;
	number_2_3 = new MTMenu();
	number_2_3.addItem("�ǉ�", "campaign/campaignInsertForm.jsp","text");
	number_2_3.addItem("���X�V", "campaign/index.jsp","text");
	number_2.makeLastSubmenu(number_2_3);

menu.makeLastSubmenu(number_2);
/*=============== //�J�e�S���Ǘ��T�C�g  ==================================**/

/*=============== �J�e�S���Ǘ��T�C�g  ==================================**/
//menu.addItem("�\���݊Ǘ� ");
//
//	var number_3 = null;
//	number_3 = new MTMenu();
//	number_3.addItem("�M�t�g", "lmj/Settlement/goods/index.jsp","text");
//	number_3.addItem("�i���q��", "lmj/flight/navi.jsp","text");
//	number_3.addItem("�C�O�p�b�P�[�W�c�A�[", "lmj/overseaTours/navi.jsp","text");
//
//menu.makeLastSubmenu(number_3);
/*=============== //�J�e�S���Ǘ��T�C�g  ==================================**/

/*=============== �G�[�W�F���g�Ǘ��T�C�g  ==================================**/
//menu.addItem("�G�[�W�F���g�Ǘ� ");

//	var number_3 = null;
//	number_3 = new MTMenu();
//	number_3.addItem("�G�[�W�F���g�Ǘ�", "lmj/agent/index.jsp","text");

// menu.makeLastSubmenu(number_3);
/*=============== //�G�[�W�F���g�Ǘ��T�C�g  ==================================**/
/*=============== ���[�U�[�Ǘ��T�C�g  ==================================**/
//menu.addItem("���[�U�[�Ǘ� ");

//	var number_4 = null;
//	number_4 = new MTMenu();
//	number_4.addItem("���[�U�[�Ǘ�", "lmj/user/index.jsp","text");

//menu.makeLastSubmenu(number_4);
/*=============== //���[�U�[�Ǘ��T�C�g  ==================================**/
/*=============== ���[�U�[�Ǘ��T�C�g  ==================================**/
menu.addItem("�R���e�L�X�g�Ǘ� ");

	var number_5 = null;
	number_5 = new MTMenu();
	number_5.addItem("�R���e�L�X�g�Ǘ�", "Contextmentenance.jsp","text");

menu.makeLastSubmenu(number_5);
/*=============== //���[�U�[�Ǘ��T�C�g  ==================================**/
</script>
</head>
<body onload="MTMStartMenu(true)" bgcolor="#000033" text="#ffffcc" link="yellow" vlink="lime" alink="red">
</body>
</html>
