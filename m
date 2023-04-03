Return-Path: <virtio-comment-return-5153-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039AEC76196
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 15:06:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E0A777A0DA
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 15:05:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D8C639863EF
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 15:05:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CB5F59863D6; Mon,  3 Apr 2023 15:05:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 15F0C9865D7
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Apr 2023 15:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: z863sBUVPFmGlz9XUXycqw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680534251;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02YT+TGXB8e2/Yq6IzZnLTmPXxtILh1+Gc+RZ2GFO14=;
        b=7wPExrEaTV02kKbPuXSciOgZw813kRSnmNWM9hxEb74EL4TkLvFj4mSrwEXER5IRD0
         v1VS7+tti82aJbW3/mE7HpJclZHTncIJxj/tu4264Kd5YQaY7tOKUsFrmNSb6KUfhsmQ
         HPnbnwmAW7bNma90qihvpNgEPNDzOF80smc6h4Paj6JM+vKvrm+vwS+WbCGv/TnXNuHm
         4mbNUjDYspmcj0IdnTPp75NxZudTEvgQYKz+wZiq3xrXvBEEaJMe9gRngd/mK71/GNMn
         DLCmBSyTc3tjTD8l2Qo+ayXBacbqQxI1Frna5ssgUikHTx5TRZzyJV53EEfWn6FizPgA
         bLxQ==
X-Gm-Message-State: AAQBX9f6uXK2Xq4djTn9VlwJaZc98JblPJ1MZxHJeDVJbWMBNf06r5A0
	FVPdD8zBKVCJO4YijZjGXBFxi5pwmZ9JPZaIWzuuPyX3+a5JWJTQGWmzp4DUIZoKYZkBrftxf9N
	V4QXzmq08ZaeANJFY+SxFPZGuofUFi801WF6rgNYQXiWvjZwiY4OMvf7Ddku1SNcvLJY4ta1kAP
	2Joz5I9H18LyY8ERzj
X-Received: by 2002:a17:907:8a19:b0:947:fb8a:f2d2 with SMTP id sc25-20020a1709078a1900b00947fb8af2d2mr8811347ejc.62.1680534251006;
        Mon, 03 Apr 2023 08:04:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350aOwy6h7mmToFAK3cPW2hLPCGVAYxn6qzUhgALBkqJkwewr41nDOUi1lHPRuSG1rSrhJl0xJw==
X-Received: by 2002:a17:907:8a19:b0:947:fb8a:f2d2 with SMTP id sc25-20020a1709078a1900b00947fb8af2d2mr8811314ejc.62.1680534250800;
        Mon, 03 Apr 2023 08:04:10 -0700 (PDT)
Date: Mon, 3 Apr 2023 11:04:02 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <b1445cf4f4702f4dbea74a3498e02a85b6cc702b.1680533760.git.mst@redhat.com>
References: <cover.1680533760.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1680533760.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v11 10/10] ccw: document more reserved features

vq reset and shared memory are unsupported, too.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/160
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 1213d48..fca3827 100644
--- a/content.tex
+++ b/content.tex
@@ -2985,6 +2985,8 @@ \subsection{Features reserved for future use}\label{sec:Virtio Transport Options
 \begin{itemize}
 
 \item VIRTIO_F_ADMIN_VQ
+\item VIRTIO_F_RING_RESET
+\item Shared memory regions including VIRTIO_PMEM_F_SHMEM_REGION
 
 \end{itemize}
 
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

