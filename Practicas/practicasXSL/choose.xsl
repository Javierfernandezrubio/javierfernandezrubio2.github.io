<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html>
<head>
<style>
table {
 border: 5px solid red;
}
tr {
 background-color: #4CAF50;
 text-align: left;
}
</style>
</head>
<body>
 <h2>My CD Collection</h2>
 <table>
 <tr >
 <th>Title</th>
 <th>Artist</th>
 </tr>
 <xsl:for-each select="catalog/cd">
    <xsl:sort select="artist"/>
    <xsl:choose>
    <xsl:when test="price &lt; 10">
 <tr>
    <td><xsl:value-of select="title"/></td>
    <td><xsl:value-of select="artist"/></td>
    <td><xsl:value-of select="price"/></td>
 </tr>
    </xsl:when>
    <xsl:when test="price > 10">
     <tr style="background-color: red;">
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="artist"/></td>
        <td><xsl:value-of select="price"/></td>
    </tr>
    </xsl:when>
</xsl:choose>

 </xsl:for-each>
 </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>