<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
  exclude-result-prefixes="sitemap">

  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Tanay Haldar — XML Sitemap</title>
        <meta name="robots" content="noindex, follow"/>
        <style>
          :root {
            --bg:        #080b14;
            --surface:   #111827;
            --surface2:  #1a2235;
            --border:    rgba(255,255,255,0.08);
            --primary:   #6c63ff;
            --accent:    #22d3ee;
            --gold:      #f59e0b;
            --text:      #f0f4ff;
            --muted:     #94a3b8;
            --dim:       #64748b;
            --green:     #4ade80;
          }

          * { box-sizing: border-box; margin: 0; padding: 0; }

          body {
            font-family: 'Inter', 'Segoe UI', sans-serif;
            background: var(--bg);
            color: var(--text);
            min-height: 100vh;
            -webkit-font-smoothing: antialiased;
          }

          /* ── TOP BAR ── */
          .topbar {
            background: linear-gradient(135deg, #0f172a, #1e1040);
            border-bottom: 1px solid var(--border);
            padding: 0;
          }
          .topbar-inner {
            max-width: 960px;
            margin: 0 auto;
            padding: 20px 24px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 16px;
          }
          .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
          }
          .brand-logo {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            background: linear-gradient(135deg,#6c63ff,#8b5cf6);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.1rem;
            font-weight: 800;
            color: #fff;
            box-shadow: 0 0 20px rgba(108,99,255,.4);
            flex-shrink: 0;
          }
          .brand-text strong {
            display: block;
            font-size: 1.05rem;
            font-weight: 700;
            color: var(--text);
          }
          .brand-text span {
            font-size: 0.78rem;
            color: var(--muted);
          }
          .back-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: rgba(108,99,255,.12);
            border: 1px solid rgba(108,99,255,.25);
            color: #a78bfa;
            padding: 8px 16px;
            border-radius: 100px;
            font-size: 0.82rem;
            font-weight: 500;
            text-decoration: none;
            transition: all .2s;
          }
          .back-link:hover {
            background: rgba(108,99,255,.25);
            color: #fff;
          }

          /* ── HERO ── */
          .hero {
            background: linear-gradient(135deg,rgba(108,99,255,.08),rgba(34,211,238,.04));
            border-bottom: 1px solid var(--border);
            padding: 48px 24px;
            text-align: center;
          }
          .hero-icon { font-size: 3rem; margin-bottom: 12px; }
          .hero h1 {
            font-size: 2rem;
            font-weight: 800;
            background: linear-gradient(135deg,#fff 0%,#a78bfa 60%,#22d3ee 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 8px;
          }
          .hero p {
            color: var(--muted);
            font-size: 0.92rem;
            max-width: 480px;
            margin: 0 auto 20px;
          }
          .stats-row {
            display: flex;
            justify-content: center;
            gap: 32px;
            flex-wrap: wrap;
          }
          .stat {
            text-align: center;
          }
          .stat-num {
            display: block;
            font-size: 1.6rem;
            font-weight: 800;
            background: linear-gradient(135deg,#22d3ee,#6c63ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
          }
          .stat-label {
            font-size: 0.72rem;
            color: var(--dim);
            text-transform: uppercase;
            letter-spacing: .08em;
          }

          /* ── TABLE ── */
          .container {
            max-width: 960px;
            margin: 0 auto;
            padding: 40px 24px 80px;
          }

          .section-label {
            display: inline-block;
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: .15em;
            text-transform: uppercase;
            color: var(--accent);
            background: rgba(34,211,238,.1);
            border: 1px solid rgba(34,211,238,.2);
            padding: 5px 14px;
            border-radius: 100px;
            margin-bottom: 20px;
          }

          table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 16px;
            overflow: hidden;
            background: var(--surface);
            border: 1px solid var(--border);
          }

          thead tr {
            background: linear-gradient(135deg,rgba(108,99,255,.15),rgba(34,211,238,.08));
            border-bottom: 1px solid rgba(108,99,255,.3);
          }

          th {
            padding: 16px 20px;
            text-align: left;
            font-size: 0.72rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: .1em;
            color: var(--accent);
          }

          tbody tr {
            border-bottom: 1px solid var(--border);
            transition: background .15s;
          }
          tbody tr:last-child { border-bottom: none; }
          tbody tr:hover { background: rgba(108,99,255,.05); }

          td {
            padding: 16px 20px;
            font-size: 0.88rem;
            vertical-align: middle;
          }

          .url-cell a {
            color: var(--accent);
            text-decoration: none;
            font-weight: 500;
            word-break: break-all;
            transition: color .15s;
          }
          .url-cell a:hover { color: var(--primary); text-decoration: underline; }

          .url-cell .url-path {
            display: block;
            font-size: 0.75rem;
            color: var(--dim);
            margin-top: 3px;
          }

          .badge {
            display: inline-block;
            padding: 3px 10px;
            border-radius: 100px;
            font-size: 0.72rem;
            font-weight: 600;
          }
          .badge-high   { background:rgba(74,222,128,.12); border:1px solid rgba(74,222,128,.25); color:var(--green); }
          .badge-med    { background:rgba(34,211,238,.1);  border:1px solid rgba(34,211,238,.2);  color:var(--accent); }
          .badge-normal { background:rgba(167,139,250,.1); border:1px solid rgba(167,139,250,.2); color:#a78bfa; }

          .priority-bar-wrap {
            display: flex;
            align-items: center;
            gap: 10px;
          }
          .priority-bar {
            height: 6px;
            border-radius: 3px;
            background: linear-gradient(90deg,#6c63ff,#22d3ee);
            flex-shrink: 0;
          }
          .priority-val {
            font-size: 0.82rem;
            font-weight: 700;
            color: var(--text);
          }

          /* ── FOOTER ── */
          .sitemap-footer {
            border-top: 1px solid var(--border);
            padding: 32px 24px;
            text-align: center;
            color: var(--dim);
            font-size: 0.8rem;
            max-width: 960px;
            margin: 0 auto;
          }
          .sitemap-footer a { color: var(--accent); text-decoration: none; }
          .sitemap-footer a:hover { text-decoration: underline; }

          @media (max-width: 600px) {
            .col-freq, .col-mod { display: none; }
            th, td { padding: 12px 14px; }
            .hero h1 { font-size: 1.4rem; }
          }
        </style>
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&amp;display=swap" rel="stylesheet"/>
      </head>
      <body>

        <!-- TOP BAR -->
        <div class="topbar">
          <div class="topbar-inner">
            <a href="index.html" class="brand">
              <div class="brand-logo">TH</div>
              <div class="brand-text">
                <strong>Tanay Haldar</strong>
                <span>Co-Founder · Quantum Core</span>
              </div>
            </a>
            <a href="index.html" class="back-link">
              ← Back to Portfolio
            </a>
          </div>
        </div>

        <!-- HERO -->
        <div class="hero">
          <div class="hero-icon">🗺️</div>
          <h1>XML Sitemap</h1>
          <p>This sitemap helps search engines like Google discover and index all pages of Tanay Haldar's portfolio.</p>
          <div class="stats-row">
            <div class="stat">
              <span class="stat-num"><xsl:value-of select="count(sitemap:urlset/sitemap:url)"/></span>
              <span class="stat-label">Total URLs</span>
            </div>
            <div class="stat">
              <span class="stat-num">✅</span>
              <span class="stat-label">Google-Ready</span>
            </div>
            <div class="stat">
              <span class="stat-num">🔍</span>
              <span class="stat-label">SEO Indexed</span>
            </div>
          </div>
        </div>

        <!-- TABLE -->
        <div class="container">
          <span class="section-label">All Pages</span>
          <table>
            <thead>
              <tr>
                <th style="width:50%">URL</th>
                <th class="col-mod">Last Modified</th>
                <th class="col-freq">Update Frequency</th>
                <th>Priority</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="sitemap:urlset/sitemap:url">
                <xsl:sort select="sitemap:priority" order="descending" data-type="number"/>
                <tr>
                  <td class="url-cell">
                    <a href="{sitemap:loc}" target="_blank" rel="noopener">
                      <xsl:value-of select="sitemap:loc"/>
                    </a>
                    <span class="url-path">
                      <xsl:variable name="path" select="substring-after(sitemap:loc,'acid-sec.github.io/Tanay-Haldar')"/>
                      <xsl:choose>
                        <xsl:when test="$path = '' or $path = '/'">Homepage · Main Portfolio</xsl:when>
                        <xsl:when test="contains($path,'#about')">About Section</xsl:when>
                        <xsl:when test="contains($path,'#projects')">Projects &amp; Games</xsl:when>
                        <xsl:when test="contains($path,'#experience')">Experience &amp; Timeline</xsl:when>
                        <xsl:when test="contains($path,'#certifications')">Certifications</xsl:when>
                        <xsl:when test="contains($path,'#contact')">Contact</xsl:when>
                        <xsl:otherwise><xsl:value-of select="$path"/></xsl:otherwise>
                      </xsl:choose>
                    </span>
                  </td>
                  <td class="col-mod">
                    <xsl:variable name="freq" select="sitemap:changefreq"/>
                    <xsl:choose>
                      <xsl:when test="sitemap:lastmod">
                        <span class="badge badge-med"><xsl:value-of select="sitemap:lastmod"/></span>
                      </xsl:when>
                      <xsl:otherwise><span style="color:var(--dim)">—</span></xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td class="col-freq">
                    <xsl:choose>
                      <xsl:when test="sitemap:changefreq = 'weekly'">
                        <span class="badge badge-high"><xsl:value-of select="sitemap:changefreq"/></span>
                      </xsl:when>
                      <xsl:when test="sitemap:changefreq = 'monthly'">
                        <span class="badge badge-med"><xsl:value-of select="sitemap:changefreq"/></span>
                      </xsl:when>
                      <xsl:otherwise>
                        <span class="badge badge-normal"><xsl:value-of select="sitemap:changefreq"/></span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td>
                    <div class="priority-bar-wrap">
                      <div class="priority-bar">
                        <xsl:attribute name="style">
                          width:<xsl:value-of select="number(sitemap:priority) * 70"/>px
                        </xsl:attribute>
                      </div>
                      <span class="priority-val"><xsl:value-of select="sitemap:priority"/></span>
                    </div>
                  </td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </div>

        <!-- FOOTER -->
        <div class="sitemap-footer">
          <p>
            Sitemap for <a href="index.html">Tanay Haldar's Portfolio</a> ·
            Generated for <strong>Google Search Console</strong> ·
            <a href="https://www.sitemaps.org" target="_blank" rel="noopener">Sitemaps Protocol</a>
          </p>
        </div>

      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
