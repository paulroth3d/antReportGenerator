<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:sfdc="http://soap.sforce.com/2006/04/metadata"
	exclude-result-prefixes="sfdc"
>
<xsl:template match="/">
<html>
<head>
<style type='text/css'>
	.section { padding-left: 30px; }
	.subsection { padding-left: 50px; }
	
	.fieldRow .noteditable { background-color: #FFCCCC; }
	.fieldRow .nothidden { background-color: #FFCCCC; }
	
	.rtRow .notvisible { background-color: #FFCCCC; }
	.rtRow .defMarker { color: #006600; }
</style>
</head>
<body>
	<div id='toc' class='section'>
		<h1>Table of Contents</h1>
		<ul>
			<li><a href='#general'>General</a></li>
			<li><a href='#fields'>Field Level Securities</a></li>
			<li><a href='#objects'>Object Level Permissions</a></li>
			<li><a href='#recordTypes'>Record Type Visibilities</a></li>
		</ul>
	</div>
	
	<div id='general' class='section'>
		<h1>General</h1>
		<table class='general' border='1'>
			<tr><td>Name</td><td><xsl:value-of select='sfdc:Profile/sfdc:userLicense' /></td></tr>
		</table>
		<div clas='tocLink'><a href='#toc'>Back to Top</a></div>
	</div>
	
	<div id='fields' class='section'>
		<h1>Field Level Securities</h1>
		
		<table border='1'>
			<tr>
				<th>Field</th>
				<th>Editable</th>
				<th>Hidden</th>
			</tr>
		<xsl:for-each select="sfdc:Profile/sfdc:fieldLevelSecurities">
			<xsl:sort select="sfdc:field" />
			<xsl:sort select="sfdc:editable" />
			<xsl:sort select="sfdc:hidden" />
			
			<tr class='fieldRow'>
				<td><xsl:value-of select='sfdc:field' /></td>
				
				<xsl:choose>
					<xsl:when test='sfdc:editable="true"'>
				<td class='editable'>TRUE</td>
					</xsl:when>
					<xsl:otherwise>
				<td class='noteditable'><xsl:value-of select='sfdc:editable' /> </td>
					</xsl:otherwise>
				</xsl:choose>
				
				<xsl:choose>
					<xsl:when test='sfdc:hidden="true"'>
				<td class='hidden'>TRUE</td>
					</xsl:when>
					<xsl:otherwise>
				<td class='nothidden'><xsl:value-of select='sfdc:hidden' /> </td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
		</xsl:for-each>
		</table>
		<div clas='tocLink'><a href='#toc'>Back to Top</a></div>
	</div>
	
	<div id='objects' class='section'>
		<h1>Object Level Permissions</h1>
		
		<table border='1'>
			<tr>
				<th>Objects</th>
				<th>Rights</th>
			</tr>
		<xsl:for-each select="sfdc:Profile/sfdc:objectPermissions">
			<xsl:sort select="sfdc:object" />
			
			<tr class='objectRow'>
				<td><xsl:value-of select='sfdc:object' /></td>
				<td>
					<xsl:choose><xsl:when test='sfdc:allowCreate="true"'>C</xsl:when><xsl:otherwise>_</xsl:otherwise></xsl:choose>
					<xsl:choose><xsl:when test='sfdc:allowRead="true"'>R</xsl:when><xsl:otherwise>_</xsl:otherwise></xsl:choose>
					<xsl:choose><xsl:when test='sfdc:allowEdit="true"'>U</xsl:when><xsl:otherwise>_</xsl:otherwise></xsl:choose>
					<xsl:choose><xsl:when test='sfdc:allowDelete="true"'>D</xsl:when><xsl:otherwise>_</xsl:otherwise></xsl:choose>
					<xsl:choose><xsl:when test='sfdc:modifyAllRecords="true"'>M</xsl:when><xsl:otherwise>_</xsl:otherwise></xsl:choose>
					<xsl:choose><xsl:when test='sfdc:viewAllRecords="true"'>V</xsl:when><xsl:otherwise>_</xsl:otherwise></xsl:choose>
				</td>
			</tr>
		</xsl:for-each>
		</table>
		<div clas='tocLink'><a href='#toc'>Back to Top</a></div>
	</div>
	
	<div id='recordTypes' class='section'>
		<h1>Record Type Visibilities</h1>
		
		<table border='1'>
			<tr>
				<th>Record Type</th>
				<th>Visible</th>
				<th>Default</th>
			</tr>
		<xsl:for-each select="sfdc:Profile/sfdc:recordTypeVisibilities">
			<xsl:sort select="sfdc:recordType" />
			<xsl:sort select="sfdc:visible" />
			<xsl:sort select="sfdc:default" />
			
			<tr class='rtRow'>
				<xsl:choose><xsl:when test='sfdc:default="true"'>
				<td class='default'><xsl:value-of select='sfdc:recordType' /><span class='defMarker'>*</span></td>
				</xsl:when><xsl:otherwise>
				<td class='notdefault'><xsl:value-of select='sfdc:recordType' /></td>
				</xsl:otherwise></xsl:choose>
				
				
				<xsl:choose>
					<xsl:when test='sfdc:visible="true"'>
				<td class='visible'>TRUE</td>
					</xsl:when>
					<xsl:otherwise>
				<td class='notvisible'><xsl:value-of select='sfdc:visible' /> </td>
					</xsl:otherwise>
				</xsl:choose>
				
				
				<xsl:choose>
					<xsl:when test='sfdc:default="true"'>
				<td class='default'>TRUE</td>
					</xsl:when>
					<xsl:otherwise>
				<td class='notdefault'><xsl:value-of select='sfdc:default' /> </td>
					</xsl:otherwise>
				</xsl:choose>
			</tr>
		</xsl:for-each>
		</table>
		<div clas='tocLink'><a href='#toc'>Back to Top</a></div>
	</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>
