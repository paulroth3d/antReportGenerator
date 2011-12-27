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
</style>
</head>
<body>
	<div id='toc' class='section'>
		<h1>Table of Contents</h1>
		<ul>
			<li><a href='#general'>General</a></li>
			<li><a href='#fieldSets'>Field Sets</a></li>
			<li><a href='#validActive'>Validation Rules: Active</a></li>
			<li><a href='#validInactive'>Validation Rules: Inactive</a></li>
		</ul>
	</div>
	<div id='general' class='section'>
		<h1>General</h1>
		<table class='general' border='1'>
			<tr><th>Type</th><th>Is Enabled</th></tr>
			<tr><td>Activities</td><td><xsl:value-of select='sfdc:CustomObject/sfdc:enableActivities' /></td></tr>
			<tr><td>Enhanced Lookup</td><td><xsl:value-of select='sfdc:CustomObject/sfdc:enableEnhancedLookup' /></td></tr>
			<tr><td>enableFeeds</td><td><xsl:value-of select='sfdc:CustomObject/sfdc:enableFeeds' /></td></tr>
			<tr><td>enableHistory</td><td><xsl:value-of select='sfdc:CustomObject/sfdc:enableHistory' /></td></tr>
			<tr><td>enableReports</td><td><xsl:value-of select='sfdc:CustomObject/sfdc:enableReports' /></td></tr>
		</table>
		<div clas='tocLink'><a href='#toc'>Back to Top</a></div>
	</div>
	
	<div id='fieldSets' class='section'>
		<h1>Field Sets</h1>
		<xsl:for-each select='sfdc:CustomObject/sfdc:fieldSets'>
			<h2 class='fullName'><xsl:value-of select='sfdc:fullName' /></h2>
			<div class='descr'><pre>Description: <xsl:value-of select='sfdc:description' /></pre></div>
			
			<ul>
			<xsl:for-each select="./sfdc:displayedFields">
				<xsl:sort select="sfdc:field" />
				<xsl:choose>
					<xsl:when test='sfdc:isRequired=false'>
				<li class='req'><xsl:value-of select='sfdc:field' />*</li>
					</xsl:when>
					<xsl:otherwise>
				<li class='noreq'><xsl:value-of select='sfdc:field' /></li>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			</ul>
		</xsl:for-each>
		<div clas='tocLink'><a href='#toc'>Back to Top</a></div>
	</div>
	
	<div class='section'>
	<h1>Validation Rules</h1>
	
	<div id='validActive' class='subsection'>
	<h2>Active</h2>
	<xsl:for-each select="sfdc:CustomObject/sfdc:validationRules[sfdc:active='true']">
		<xsl:sort select="sfdc:active" />
		<div class='validation'>
			<h3><xsl:value-of select='sfdc:fullName' /></h3>
			<p class='desc'><xsl:value-of select='sfdc:description' /></p>
			<p class='msg'>Error Message: <xsl:value-of select='sfdc:errorMessage' /></p>
			<pre class='formula'><xsl:value-of select='sfdc:errorConditionFormula' /></pre>
		</div>
	</xsl:for-each>
	<div clas='tocLink'><a href='#toc'>Back to Top</a></div>
	</div>
	
	<div id='validInactive' class='subsection'>
	<h2>Inactive</h2>
	<xsl:for-each select="sfdc:CustomObject/sfdc:validationRules[sfdc:active!='true']">
		<xsl:sort select="sfdc:active" />
		<div class='validation'>
			<h3><xsl:value-of select='sfdc:fullName' /></h3>
			<p class='desc'><xsl:value-of select='sfdc:description' /></p>
			<p class='msg'>Error Message: <xsl:value-of select='sfdc:errorMessage' /></p>
			<pre class='formula'><xsl:value-of select='sfdc:errorConditionFormula' /></pre>
		</div>
	</xsl:for-each>
	<div clas='tocLink'><a href='#toc'>Back to Top</a></div>
	</div>
	</div>
	
</body>
</html>
</xsl:template>
</xsl:stylesheet>
