<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output method="html" encoding="Shift_JIS"/>
<xsl:template match="/">
<xsl:value-of select="MAIL/AGENT/NAME"/>様
お世話になります。
以下の内容にてお問い合せ頂いております。ご対応をお願いいたします。
株式会社　ラストミニット・ドット・コム
03-3526-6221
--------------------------------------------------
ご照会アドレス：<xsl:value-of select="MAIL/EMAIL"/>
--------------------------------------------------
受付番号：<xsl:value-of select="MAIL/ORDER_NO"/>
商品名：<xsl:value-of select="MAIL/COURSE_NAME"/> (<xsl:value-of select="MAIL/CODE"/>)
<xsl:for-each select="MAIL/FLIGHT/">
<xsl:choose>
<xsl:when test="@seq=1">日本出発便</xsl:when>
<xsl:when test="@seq=2">日本到着便</xsl:when>
</xsl:choose> 出発日：<xsl:value-of select="ARRIVE_DATE"/>
出発地：<xsl:value-of select="DEPT"/>
到着地：<xsl:value-of select="ARRIVE"/>
</xsl:for-each>

備考：
<xsl:value-of select="MAIL/REMARKS"/>
---------------------------------------------------

旅行人数：大人 <xsl:value-of select="MAIL/ADULT"/>名 子供 <xsl:value-of select="MAIL/CHILD"/>名 幼児 <xsl:value-of select="MAIL/INFANT"/>名

ご旅行者全員の情報です。
<xsl:for-each select="MAIL/MEMBER">
<xsl:choose><xsl:when test="@seq=1">代表者</xsl:when><xsl:otherwise>同行者<xsl:value-of select="position()-1"/></xsl:otherwise></xsl:choose>
名前 漢字：(姓)<xsl:value-of select="K_LNAME"/> (名)<xsl:value-of select="K_FNAME"/>
名前 ローマ字：(姓)<xsl:value-of select="R_LNAME"/> (名)<xsl:value-of select="R_FNAME"/>
性別：<xsl:value-of select="TITLE"/>
生年月日：<xsl:value-of select="BIRTHDAY"/>
</xsl:for-each>

--------------------------------------------------
代表者の情報
電子メール：<xsl:value-of select="MAIL/EMAIL"/>

住所　〒<xsl:value-of select="MAIL/ZIP"/>
<xsl:value-of select="MAIL/STATE"/><xsl:value-of select="MAIL/ADDRESS1"/><xsl:value-of select="MAIL/ADDRESS2"/>

連絡先電話番号：<xsl:value-of select="MAIL/TEL"/>
航空券お受け取り方法：<xsl:value-of select="MAIL/PAYMENT"/>
お支払い方法：<xsl:value-of select="MAIL/TICKETING"/>
<xsl:if test="MAIL/ADDRESSFLG[not(.='')]">旅行目的：<xsl:value-of select="MAIL/ADDRESSFLG"/></xsl:if>
==================================================
do something lastminute.com
http：//www.lastminute.co.jp

</xsl:template>
</xsl:stylesheet>
