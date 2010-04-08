<?xml version='1.0'?>
<xsl:stylesheet xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xslthl="http://xslthl.sf.net"
                exclude-result-prefixes="xslthl"
                version="1.0">

    <xsl:import href="../docbook-xsl-1.75.2/fo/docbook.xsl" />

    <!--
    ###################################################
         Extensions
    ###################################################
    -->
    <!-- These extensions are required for table printing and other stuff -->
    <!--<xsl:param name="use.extensions">1</xsl:param>-->
    <!--<xsl:param name="tablecolumns.extension">0</xsl:param>-->
    <!--<xsl:param name="callout.extensions">1</xsl:param>-->
    <!--<xsl:param name="fop.extensions">1</xsl:param>-->

    <!--
    ###################################################
         Fonts & Styles
    ###################################################
    -->
    <!-- Use code syntax highlighting -->
    <xsl:param name="highlight.source" select="1"/>
    <xsl:param name="highlight.default.language" select="xml" />

    <xsl:template match='xslthl:keyword'>
        <fo:inline font-weight="bold" color="#7F0055"><xsl:apply-templates/></fo:inline>
    </xsl:template>

    <xsl:template match='xslthl:comment'>
        <fo:inline font-style="italic" color="#3F5F5F"><xsl:apply-templates/></fo:inline>
    </xsl:template>

    <xsl:template match='xslthl:oneline-comment'>
        <fo:inline font-style="italic" color="#3F5F5F"><xsl:apply-templates/></fo:inline>
    </xsl:template>

    <xsl:template match='xslthl:multiline-comment'>
        <fo:inline font-style="italic" color="#3F5FBF"><xsl:apply-templates/></fo:inline>
    </xsl:template>

    <xsl:template match='xslthl:tag'>
        <fo:inline  color="#3F7F7F"><xsl:apply-templates/></fo:inline>
    </xsl:template>

    <xsl:template match='xslthl:attribute'>
        <fo:inline color="#7F007F"><xsl:apply-templates/></fo:inline>
    </xsl:template>

    <xsl:template match='xslthl:value'>
        <fo:inline color="#2A00FF"><xsl:apply-templates/></fo:inline>
    </xsl:template>

    <xsl:template match='xslthl:string'>
        <fo:inline color="#2A00FF"><xsl:apply-templates/></fo:inline>
    </xsl:template>

    <!--
    ###################################################
       colored and hyphenated links
    ###################################################
    -->

    <xsl:template match="ulink">
        <fo:basic-link external-destination="{@url}"
                       xsl:use-attribute-sets="xref.properties"
                       text-decoration="underline"
                       color="blue">
            <xsl:choose>
                <xsl:when test="count(child::node())=0">
                    <xsl:value-of select="@url" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates />
                </xsl:otherwise>
            </xsl:choose>
        </fo:basic-link>
    </xsl:template>

    <xsl:template match="link">
        <fo:basic-link internal-destination="{@linkend}"
                       xsl:use-attribute-sets="xref.properties"
                       text-decoration="underline"
                       color="blue">
            <xsl:choose>
                <xsl:when test="count(child::node())=0">
                    <xsl:value-of select="@linkend" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates />
                </xsl:otherwise>
            </xsl:choose>
        </fo:basic-link>
    </xsl:template>
</xsl:stylesheet>
