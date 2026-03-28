<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/rss">
    <html>
      <head>
        <title><xsl:value-of select="channel/title"/> RSS Feed</title>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <style>
          body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            line-height: 1.6;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background: #f9fafb;
            color: #111827;
          }
          .header {
            background: white;
            padding: 30px;
            border-radius: 12px;
            margin-bottom: 30px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            text-align: center;
          }
          .header h1 {
            margin: 0 0 10px 0;
            font-size: 2rem;
            font-weight: 700;
            color: #3b82f6;
          }
          .header p {
            margin: 0;
            color: #6b7280;
            font-size: 1.1rem;
          }
          .feed-info {
            background: white;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            border-left: 4px solid #3b82f6;
          }
          .feed-info strong {
            color: #111827;
          }
          .items {
            list-style: none;
            padding: 0;
            margin: 0;
          }
          .item {
            background: white;
            margin-bottom: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            overflow: hidden;
          }
          .item:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
          }
          .item-header {
            padding: 25px 30px 15px 30px;
          }
          .item-title {
            margin: 0 0 10px 0;
            font-size: 1.25rem;
            font-weight: 600;
          }
          .item-title a {
            color: #111827;
            text-decoration: none;
            transition: color 0.2s ease;
          }
          .item-title a:hover {
            color: #3b82f6;
          }
          .item-date {
            color: #6b7280;
            font-size: 0.875rem;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.05em;
          }
          .item-description {
            padding: 0 30px 25px 30px;
            color: #4b5563;
            line-height: 1.6;
          }
          .footer {
            text-align: center;
            padding: 30px;
            color: #6b7280;
            font-size: 0.9rem;
          }
          .footer a {
            color: #3b82f6;
            text-decoration: none;
            font-weight: 600;
          }
          .footer a:hover {
            text-decoration: underline;
          }
          @media (max-width: 768px) {
            body {
              padding: 15px;
            }
            .header, .feed-info {
              padding: 20px;
            }
            .item-header, .item-description {
              padding-left: 20px;
              padding-right: 20px;
            }
          }
        </style>
      </head>
      <body>
        <div class="header">
          <h1><xsl:value-of select="channel/title"/></h1>
          <p><xsl:value-of select="channel/description"/></p>
        </div>
        
        <div class="feed-info">
          <strong>About this feed:</strong> This is an RSS feed containing the latest posts from 
          <a target="_blank"><xsl:attribute name="href"><xsl:value-of select="channel/link"/></xsl:attribute><xsl:value-of select="channel/title"/></a>.
          Subscribe using your favorite feed reader or copy the URL to your RSS application.
        </div>
        
        <ul class="items">
          <xsl:for-each select="channel/item">
            <li class="item">
              <div class="item-header">
                <h2 class="item-title">
                  <a target="_blank">
                    <xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
                    <xsl:value-of select="title"/>
                  </a>
                </h2>
                <div class="item-date">
                  <xsl:value-of select="pubDate"/>
                </div>
              </div>
              <div class="item-description">
                <xsl:value-of select="description"/>
              </div>
            </li>
          </xsl:for-each>
        </ul>
        
        <div class="footer">
          <p>
            Powered by <a href="https://jekyllrb.com" target="_blank">Jekyll</a> • 
            Subscribe to this RSS feed using 
            <a href="https://feedly.com" target="_blank">Feedly</a>, 
            <a href="https://inoreader.com" target="_blank">Inoreader</a>, or your favorite RSS reader
          </p>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
