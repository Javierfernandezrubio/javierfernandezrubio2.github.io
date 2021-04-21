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
 <h2>Horario lectivo</h2>
 <table>
 <tr>
<th colspan="1"> </th>
<xsl:for-each select="horario/lunes/*">
<th><xsl:value-of select="name()"></xsl:value-of></th>
</xsl:for-each>
 </tr>
 <xsl:for-each select="horario/*">
 <tr>
<td><xsl:value-of select="name()"/></td>
 <td><xsl:value-of select="primera"/></td>
 <td><xsl:value-of select="segunda"/></td>
 <td><xsl:value-of select="tercera"/></td>
 <td><xsl:value-of select="cuarta"/></td>
 <td><xsl:value-of select="quinta"/></td>
 <td><xsl:value-of select="sexta"/></td>
 </tr>
 </xsl:for-each>
 </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>