<?xml version="1.0" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <table id="wineMenu" border="1" class="indent">
            <thead>
                <tr>
                    <th colspan="6">Wine List</th>
                </tr>
                <tr>
                    <th>Select</th>
                    <th>Name</th>
                    <th>Country</th>
                    <th>Region</th>
                    <th>Price</th>
                    <th>Year</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="/wine_list/section">
                    <tr>
                        <td colspan="6">
                            <xsl:value-of select="@type" />
                        </td>
                    </tr>
                    <xsl:for-each select="reserve">
                        <tr id="{position()}">
                            <xsl:attribute name="wineReserve">
                                <xsl:value-of select="boolean(@wineReserve)" />
                            </xsl:attribute>
                            <td align="center">
                                <input name="item" type="checkbox" />
                            </td>
                            <td>
                                <xsl:value-of select="wine/name" />
                            </td>
                            <td>
                                <xsl:value-of select="wine/country" />
                            </td>
                            <td>
                                <xsl:value-of select="wine/region" />
                            </td>
                            <td>
                                <xsl:value-of select="wine/price" />
                            </td>
                            <td>
                                <xsl:value-of select="wine/year" />
                            </td>
                        </tr>
                    </xsl:for-each>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>