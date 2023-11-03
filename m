Return-Path: <virtio-comment-return-8153-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37DDC4332F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 13:33:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0989945B33
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 13:33:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F3595986C47
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 13:33:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E7A04986C3A; Fri,  3 Nov 2023 13:33:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6DEF986C3C
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 13:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: sw8tZPMtOrK9-eD84uWdsg-1
From: Cornelia Huck <cohuck@redhat.com>
To: virtio@lists.oasis-open.org
Cc: virtio-comment@lists.oasis-open.org,
	Cornelia Huck <cohuck@redhat.com>,
	Paul Knight <paul.knight@oasis-open.org>
Date: Fri,  3 Nov 2023 14:33:01 +0100
Message-ID: <20231103133304.681157-3-cohuck@redhat.com>
In-Reply-To: <20231103133304.681157-1-cohuck@redhat.com>
References: <20231103133304.681157-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH 2/3] editorial: update "Computer Language Definitions" URL

Split out from the other fixes for 1.3-csd01 so that we can fixup the
diff.

- In "Status", (fourth paragraph) change the hyperlink under (Computer
Language Definitions) to be "
https://www.oasis-open.org/policies-guidelines/tc-process-2017-05-26/#wpComponentsCompLang
"

Reported-by: Paul Knight <paul.knight@oasis-open.org>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 title.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/title.tex b/title.tex
index f3c8f97a361f..bf08d33d4a52 100644
--- a/title.tex
+++ b/title.tex
@@ -101,7 +101,7 @@
 \input{ipr.tex}
 
 Note that any machine-readable content
-(\href{https://www.oasis-open.org/policies-guidelines/tc-process#wpComponentsCompLang}
+(\href{https://www.oasis-open.org/policies-guidelines/tc-process-2017-05-26/#wpComponentsCompLang}
 {Computer Language Definitions}) declared Normative for this Work
 Product is provided in separate plain text files. In the event of
 a discrepancy between any such plain text file and display
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

