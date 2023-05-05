Return-Path: <virtio-comment-return-5813-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DE3C77B7F
	for <virtio-comment@archiver.kernel.org>; Fri,  5 May 2023 15:41:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 085172AC62
	for <virtio-comment@archiver.kernel.org>; Fri,  5 May 2023 15:41:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9E0BA986754
	for <virtio-comment@archiver.kernel.org>; Fri,  5 May 2023 15:41:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6A679986701; Fri,  5 May 2023 15:41:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0AB0D9866C9
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 May 2023 15:41:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: BfSYYJQ9MiO13hbp4AEyjg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683301272; x=1685893272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEzgzJ6HQKCK/6lbKy7eKs8xzZ5sGhCjG+sMXBShGuo=;
        b=N+KQf3AXEHlvdrgPm9CdXLlOkcaDbAzN0uj1js2Vf00X/zuGgLsb0DQd2ACTh2/DSz
         uPlNdpDuzKToc8bdJlMuvfbMkWeDrlBGBHPLuwAreZhnjf3JybRDbOuWtf6R7HJWJ/xY
         Gup3XLbH7/CGNkuAhGj7CPEqAidCSg6XAn6Chs50BC7Aig1uQ6Y1qbnfHxDg5sd6DdEU
         twzxuYt+ckJNb9ctE+1RNELxSbaKN3AUm6cqIpqOLradI4bFEnNiao7luoVZHx8tF4XV
         jkC3uWXDcJTI/2QswcmWstvzuppQEdrOEwhzQUsMPuhu7KJBGA5fEvMqbwHMN/4ewNhe
         gCWg==
X-Gm-Message-State: AC+VfDwjL350ewPdtwJdId38mjklZcUJtvjei9SaHDIslIABatljyfym
	LmaZXGfaZh6uV9f2HdhX9Dnv9um2cNE1Mrtyy4PCBdVBYJbnfMA87rQs//k0r1eo8w6q0DeqB5a
	2zIO8jxegQFcwAQZBW+lfg9bFDhdWWUiMYfWj2r/og1rNaqALmSCGS5qZr0pE4FnzKBQ77DfhoB
	TPLuFLGNEYu9Q=
X-Received: by 2002:adf:fd83:0:b0:305:f2d5:2a12 with SMTP id d3-20020adffd83000000b00305f2d52a12mr1747989wrr.21.1683301272555;
        Fri, 05 May 2023 08:41:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Tduz4DerNUqvVZt0wkJGu6+YBeVReCZLJ6Mo3BskPZgspSh0NxzrhFxyHkMG1UrKnvMONHg==
X-Received: by 2002:adf:fd83:0:b0:305:f2d5:2a12 with SMTP id d3-20020adffd83000000b00305f2d52a12mr1747961wrr.21.1683301272288;
        Fri, 05 May 2023 08:41:12 -0700 (PDT)
Date: Fri, 5 May 2023 11:41:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <f4a163a843456c339dad4287c518a1e24cc47f82.1683301091.git.mst@redhat.com>
References: <cover.1683301091.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1683301091.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v13 10/10] ccw: document more reserved features

vq reset and shared memory are unsupported, too.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/160
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Zhu Lingshan <lingshan.zhu@intel.com>

---

changes in v12:
address comment by parav
---
 transport-ccw.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/transport-ccw.tex b/transport-ccw.tex
index d42ec7f..afb354e 100644
--- a/transport-ccw.tex
+++ b/transport-ccw.tex
@@ -607,6 +607,8 @@ \subsection{Features reserved for future use}\label{sec:Virtio Transport Options
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

