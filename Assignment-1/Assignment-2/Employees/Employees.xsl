<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/Employees">
      <html>
            <body>
               <h2>Employees List</h2>
				<table border = "1">

					<tr bgcolor="lightblue">
						<th>Last Name</th>
						<th>First Name</th>
						<th>Phone Number</th>
						<th>Birthday</th>
						<th>HourlyRate</th>
					</tr>
					
					<xsl:for-each select = "Employee">
					
						<tr>
							<td><xsl:value-of select = "Last"/></td>
							<td><xsl:value-of select = "First"/></td>
							<td><xsl:value-of select = "Phone"/></td>
							<td><xsl:value-of select = "Birthday"/></td>
							<td><xsl:value-of select = "HourlyRate"/></td>
						</tr>
					
					</xsl:for-each>
					
				</table>
            </body>
      </html>
</xsl:template>
</xsl:stylesheet> 