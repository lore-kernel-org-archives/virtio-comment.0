Return-Path: <virtio-comment-return-8152-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 272D3C4167B
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 13:33:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 82B953E578
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 13:33:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 70A30986C54
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 13:33:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 650B4986C42; Fri,  3 Nov 2023 13:33:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 49D3E986C3F
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 13:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: QpgA5iFnP9i9QjuMVhVPbA-1
From: Cornelia Huck <cohuck@redhat.com>
To: virtio@lists.oasis-open.org
Cc: virtio-comment@lists.oasis-open.org,
	Cornelia Huck <cohuck@redhat.com>,
	Paul Knight <paul.knight@oasis-open.org>
Date: Fri,  3 Nov 2023 14:33:00 +0100
Message-ID: <20231103133304.681157-2-cohuck@redhat.com>
In-Reply-To: <20231103133304.681157-1-cohuck@redhat.com>
References: <20231103133304.681157-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH 1/3] editorial: various fixes for 1.3-csd01

- Set approval date to 06 October 2023. (applies to front page subtitle,
citation format, PDF page footers)
- Set filenames and URIs to show csd01 instead of wd01 (also PDF footers)
- Set "Previous stage" to "N/A" (don't list a different numbered Version)
- In "Related work", change (3x) text - "Latest version" to "Latest stage"
- In "Notices", set the copyright year to 2023.

- In the first line of Appendix D. Revision History, replace "the previous
version" with "Version 1.2"

- In Section 1.3, apply the current IETF-recommended text:
"The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and
"OPTIONAL" in this document are to be interpreted as described in BCP 14
[[RFC2119](#link)] and [[RFC8174](#link)] when, and only when, they appear
in all capitals, as shown here."
- Also, add the RFC 8174 reference:
[RFC8174]
Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
14, RFC 8174, DOI 10.17487/RFC8174, May 2017,
https://www.rfc-editor.org/info/rfc8174.

Reported-by: Paul Knight <paul.knight@oasis-open.org>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 REVISION         |  2 +-
 REVISION-DATE    |  2 +-
 changelog.tex    |  2 +-
 introduction.tex | 11 +++++++++--
 title.tex        | 13 +++++--------
 5 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/REVISION b/REVISION
index d2c53b5f9201..ba56baf05d69 100644
--- a/REVISION
+++ b/REVISION
@@ -1 +1 @@
-virtio-v1.3-wd01
+virtio-v1.3-csd01
diff --git a/REVISION-DATE b/REVISION-DATE
index 6c68e6b0e8a9..d149b6e782f5 100644
--- a/REVISION-DATE
+++ b/REVISION-DATE
@@ -1 +1 @@
-25 August 2023
+06 October 2023
diff --git a/changelog.tex b/changelog.tex
index 76fbd37693aa..51ca2a68ccf9 100644
--- a/changelog.tex
+++ b/changelog.tex
@@ -1,5 +1,5 @@
 \chapter{Revision History}
-The following changes have been made since the previous version
+The following changes have been made since version 1.2
 of this specification:
 
 \begin{DIFnomarkup}
diff --git a/introduction.tex b/introduction.tex
index 1e39a4b2c529..cfa6633bad81 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -141,6 +141,10 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:TCP}\textbf{[TCP]} &
     TRANSMISSION CONTROL PROTOCOL
 	\newline\url{https://www.rfc-editor.org/rfc/rfc793}\\
+	\phantomsection\label{intro:rfc2119}\textbf{[RFC8174]} &
+    Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
+    14, RFC 8174, DOI 10.17487/RFC8174, May 2017
+        \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
 \end{longtable}
 
 \section{Non-Normative References}
@@ -153,8 +157,11 @@ \section{Non-Normative References}
 
 \section{Terminology}\label{Terminology}
 
-The key words ``MUST'', ``MUST NOT'', ``REQUIRED'', ``SHALL'', ``SHALL NOT'', ``SHOULD'', ``SHOULD NOT'', ``RECOMMENDED'', ``MAY'', and ``OPTIONAL'' in this document are to be interpreted as described in \hyperref[intro:rfc2119]{[RFC2119]}.
-
+The key words ``MUST'', ``MUST NOT'', ``REQUIRED'', ``SHALL'', ``SHALL NOT'',
+``SHOULD'', ``SHOULD NOT'', ``RECOMMENDED'', ``NOT RECOMMENDED'', ``MAY'', and
+``OPTIONAL'' in this document are to be interpreted as described in
+\hyperref[intro:rfc2119]{[RFC2119]} and \hyperref[intro:rfc8174]{[RFC8174]} when,
+and only when, they appear in all capitals, as shown here.
 \subsection{Legacy Interface: Terminology}\label{intro:Legacy
 Interface: Terminology}
 
diff --git a/title.tex b/title.tex
index 23c0a1a39d24..f3c8f97a361f 100644
--- a/title.tex
+++ b/title.tex
@@ -18,10 +18,7 @@
 \end{oasistitlesection}
 
 \begin{oasistitlesection}{Previous stage}
-\url{https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/tex/}
-{}(Authoritative)\newline
-\url{https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.pdf}\newline
-\url{https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html}
+N/A
 \end{oasistitlesection}
 
 \begin{oasistitlesection}{Latest stage}
@@ -57,12 +54,12 @@
 \begin{oasistitlesection}{Related work}
 This specification replaces or supersedes:
 \begin{itemize*}
-	\item Virtual I/O Device (VIRTIO) Version 1.2. Edited by Michael S. Tsirkin and Cornelia Huck. Latest version:\newline
+	\item Virtual I/O Device (VIRTIO) Version 1.2. Edited by Michael S. Tsirkin and Cornelia Huck. Latest stage:\newline
 	\url{https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html}
-	\item Virtual I/O Device (VIRTIO) Version 1.1. Edited by Michael S. Tsirkin and Cornelia Huck. Latest version:\newline
+	\item Virtual I/O Device (VIRTIO) Version 1.1. Edited by Michael S. Tsirkin and Cornelia Huck. Latest stage:\newline
 	\url{https://docs.oasis-open.org/virtio/virtio/v1.1/virtio-v1.1.html}
 	\item Virtual I/O Device (VIRTIO) Version 1.0. Edited by Rusty Russell, Michael S. Tsirkin, Cornelia Huck, and Pawel
- Moll. Latest version:\newline
+ Moll. Latest stage:\newline
 	\url{https://docs.oasis-open.org/virtio/virtio/v1.0/virtio-v1.0.html}
 	\item Virtio PCI Card Specification Version 0.9.5:\newline
 	\url{http://ozlabs.org/~rusty/virtio-spec/virtio-0.9.5.pdf}
@@ -127,7 +124,7 @@
 
 \oasisnoticelabel{Notices}
 
-Copyright © OASIS Open 2022. All Rights Reserved.
+Copyright © OASIS Open 2023. All Rights Reserved.
 
 All capitalized terms in the following text have the meanings assigned
 to them in the OASIS Intellectual Property Rights Policy (the "OASIS
-- 
2.41.0


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

