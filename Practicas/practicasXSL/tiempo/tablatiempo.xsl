<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
 <h2>Tiempo en Córdoba</h2>
 <table>
 <tr >
 <th>Dia</th>
 <th>Estado del Cielo</th>
 <th>Probabilidad de precipitacion</th>
 </tr>
 <xsl:for-each select="root/prediccion/*">
 <tr>
 <td><xsl:value-of select="@fecha"/></td>
 <td><xsl:value-of select="estado_cielo/@descripcion"/></td>
 <xsl:if test="prob_precipitacion">
  <td><xsl:value-of select="dia/prob_precipitacion"/></td>
 </xsl:if>
 </tr>
 </xsl:for-each>
 </table>
</body>
</html>
  </xsl:template>
</xsl:stylesheet>
