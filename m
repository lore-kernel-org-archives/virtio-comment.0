Return-Path: <virtio-comment-return-7567-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6B3E82CA5
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Sep 2023 15:55:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C83DA7BB04
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Sep 2023 15:55:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1CB0C986709
	for <virtio-comment@archiver.kernel.org>; Wed, 27 Sep 2023 15:55:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 083FF9864CC; Wed, 27 Sep 2023 15:55:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E1CC9986894
	for <virtio-comment@lists.oasis-open.org>; Wed, 27 Sep 2023 15:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3OWM2gdaPpKDG0Os_2ly8A-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695830125; x=1696434925;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXze5GTv1c99MGeDMPMpMArTuehJWNWg5PNwz6HOSaE=;
        b=QPTzGty57xIIuOkPh92d1Rwb+OMvgk4GjIBIWlfPaA75j9IefcVqV7MlV2sAFc+HJ0
         80f9p56Js+SRmK63RNtzqNM4AjU9XoKGotD//lV1tItbPSVjThNCq+AAlLe+DMEvzikn
         G6ulGh7IiBxwB/Pm9lEQoHM1yAKKxRMTDb7S+ws5OO6NdCIgec2cX3bfb0vszBdr5JB8
         9zUNt5htzzkDuZTNmqcbJ/LkUpI3JHC1z3s3msAO+5NfnWP2YVI8+PDN+sgRRuiWiCPW
         UhPQqX3LNmgdSuIrMqdTCrGVVqkHPtWmNDIMa4XOl/GFCUAY62moiHL0HESjwNLEEhbt
         R3iw==
X-Gm-Message-State: AOJu0YywWEgzdgDhP82gN6Ixfgy8FF00gbVOF3FKj0gYj2DoD7QPi5QB
	NCG6XWEP3IMN3ID0q/6Y/GXdbWnBdBBvXHqVuhFsWXIUbe4i9jW3YAeJ0O1BH+7tQov+1l2Kyz1
	tN2ZKhgCTGIulkSrstz1w4RDxi8cVcRRffl84NfHaHWhHz+Nxd6VmCQf+t1sFaO79iSh7sflyW8
	AZLD+ziTfW2nY=
X-Received: by 2002:a5d:568e:0:b0:323:2038:944 with SMTP id f14-20020a5d568e000000b0032320380944mr2132833wrv.58.1695830125068;
        Wed, 27 Sep 2023 08:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFhJ2DEyBP/JopeGoVmGB9/7tOFfubT2PSzqeT/AXh9Ye5qs105I9+ZqB533PtZax6SxRzTg==
X-Received: by 2002:a5d:568e:0:b0:323:2038:944 with SMTP id f14-20020a5d568e000000b0032320380944mr2132815wrv.58.1695830124608;
        Wed, 27 Sep 2023 08:55:24 -0700 (PDT)
Date: Wed, 27 Sep 2023 11:55:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
Cc: virtio@lists.oasis-open.org
Message-ID: <f58da8a0fd3a40b24c9643499a2592d3ad38b73c.1695830118.git.mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH] html: add missing enumitem package

makediffhtml.sh currently fails with:

! Missing number, treated as zero.
<to be read again>
                   \c@*
l.25850 \begin{enumerate}[label=\alph*
                                      .]
?
! Emergency stop.
<to be read again>
                   \c@*
l.25850 \begin{enumerate}[label=\alph*
                                      .]

Some web searches turned up suggestions to use enumitem and in fact,
virtio.tex already does this - but virtio-html.tex doesn't.

Adding \usepackage{enumitem} in virtio-html.tex too fixes the issue.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 virtio-html.tex | 1 +
 1 file changed, 1 insertion(+)

diff --git a/virtio-html.tex b/virtio-html.tex
index c822a99..48c633d 100644
--- a/virtio-html.tex
+++ b/virtio-html.tex
@@ -31,6 +31,7 @@
 \usepackage{tabularx}
 \usepackage{underscore}
 \usepackage{xstring}
+\usepackage{enumitem}
 \usepackage{chngcntr}
 \counterwithout{footnote}{chapter}
 
-- 
MST


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

