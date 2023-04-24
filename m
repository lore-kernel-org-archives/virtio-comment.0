Return-Path: <virtio-comment-return-5604-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85B1C77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:46:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 872BD604CE
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:45:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 903E698668A
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:45:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BE54398664C; Mon, 24 Apr 2023 16:45:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7EBB3986689
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Apr 2023 16:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ur3R_6haO4arW2FUMU13-g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682354680; x=1684946680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cl8TrnJrpxtSXopKqJcHKnxmIqkCMI8G5gGoUiogvco=;
        b=auATHVXKcKi+NuNuC1Yq5d64SeRR5G9MUZk7Bx2fUrWQggc7zQHjvzFSbhvwzUiJcV
         TX6uhJhlNt5Swh5WgSoQMcDDeTvi/w/8ZiiNqawxfwTimS/2y5aLBvFIHloaFZrjzfTc
         7dXKnTzL5MV6rc8Ktb48oOOmcB77uaYovOG7oG90AU6VkBOCvbo3DWsiK75HY61Qg5yB
         SLt609I9haDAJGiilVLsnhxD0x6S7ZSmZfJDNhutPRwiPqLk4u7QWuvDphg/M05En8kR
         A/JUC3s1n2HFImRIBdEkjX2qgDNQtwND/HUIgeP0tIQ6a90/kyXQ23jYREoe/REr0/dT
         ixQA==
X-Gm-Message-State: AAQBX9d8CbIVBEaM3d8JiHLzfb07RCpuZi/MHYxxaE9xFnsuSZcx/86D
	6omSfAVRvMnDCFbKaJSsAGfhst23Rhz939lrMmoLDt3P8aK0ObdAu00d2o+qneAKeIjU6J8bN8F
	XXPNXZi1c5/zYGv48R5p3IKs/vyMs8iHzNyuRJXeuzq/5cQeFfWz8d7kR/cMOJ8jrwdxpDrxj2c
	I/apFMfDVmi0g=
X-Received: by 2002:adf:e347:0:b0:2d3:33d4:1cfb with SMTP id n7-20020adfe347000000b002d333d41cfbmr9250419wrj.36.1682354680738;
        Mon, 24 Apr 2023 09:44:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350bDDfkbkz4WG8aQAC4jY8htgrmWyr7CVjUUamriaiWUZUWUcjMHs0K2st5GxulHERpJ1iT0bg==
X-Received: by 2002:adf:e347:0:b0:2d3:33d4:1cfb with SMTP id n7-20020adfe347000000b002d333d41cfbmr9250393wrj.36.1682354680453;
        Mon, 24 Apr 2023 09:44:40 -0700 (PDT)
Date: Mon, 24 Apr 2023 12:44:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <a67ae1170d9535a98862d01825b2662180d77d82.1682354275.git.mst@redhat.com>
References: <cover.1682354275.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1682354275.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v12 06/10] mmio: document ADMIN_VQ as reserved

Adding relevant registers needs more work and it's not
clear what the use-case will be as currently only
the PCI transport is supported. But let's keep the
door open on this.
We already say it's reserved in a central place, but it
does not hurt to remind implementers to mask it.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

---

changes in v12:
	drop "as of now" to address comment by parav
---
 content.tex | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/content.tex b/content.tex
index bcbc06d..7d6d9c4 100644
--- a/content.tex
+++ b/content.tex
@@ -2365,6 +2365,18 @@ \subsection{Legacy interface}\label{sec:Virtio Transport Options / Virtio Over M
 
 Notification mechanisms did not change.
 
+\subsection{Features reserved for future use}\label{sec:Virtio Transport Options / Virtio Over MMIO / Features reserved for future use}
+
+Devices and drivers utilizing Virtio Over MMIO
+do not support the following features:
+\begin{itemize}
+
+\item VIRTIO_F_ADMIN_VQ
+
+\end{itemize}
+
+These features are reserved for future use.
+
 \section{Virtio Over Channel I/O}\label{sec:Virtio Transport Options / Virtio Over Channel I/O}
 
 S/390 based virtual machines support neither PCI nor MMIO, so a
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

