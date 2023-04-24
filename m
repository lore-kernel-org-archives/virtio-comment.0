Return-Path: <virtio-comment-return-5605-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A57C77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:46:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C5CF0EEA16
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:45:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C23B89863E1
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:45:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B6CE298635B; Mon, 24 Apr 2023 16:45:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7D9419866E2
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Apr 2023 16:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5PK3oJwzO6eHWduYpO1lNA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682354696; x=1684946696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EobZNADGc9RGdpDef7rAlYQCuR+CaNuaH2E8TZ/lczU=;
        b=SwJZu/dpd6m2Q7tnxTwsX88hx63nKrTXkEX+jtQxxmGys5G/4WyZ+hgTUYJxNYLq7l
         44tqowDDvC4hvX1yl6MkID2IP7o5U9aDJw0j5kubaWXWy8mLnDQA6GecDwClWKLrxNgD
         bUQwVJkfXWrUvkU4dlEfkMKX0ArcesmL+94hd0XS5p1QptsAnO1Qw+dahUM6eXZBtF8G
         ifUQE7ZUGeCxuEtkpDwfnG2j7t/Dvy6cGlUw5K7KVPXbxkyzI9IP02brfox5p9gDLdjh
         emaWqgxI9PimG4AnSzYW/H343feWboua8mw9NcqL2OVTKV3YQm/Zks3FA9dSLHQz/Fhl
         jhPg==
X-Gm-Message-State: AAQBX9eNSY/qXhqhzoAPnQCmxQnaPApAd5IG0nVWojj8j7zXkWyDcSnv
	eKWdR8nIX2ysbFI5XJXnIGmCruWFMTeITcHg24yjRtUsu4LnZj+jJFdc0blrcrA3TlTw7PdYXjQ
	OS8cZCweZ/nPn17d5Kj+86WziITBJx72bBffnyCbpOSeaQjnCKa5K6L6ITbPVqRdT8NeUPOUVdb
	XHD2I6/hRHZ3w=
X-Received: by 2002:a7b:ce04:0:b0:3f0:f3ee:9e2a with SMTP id m4-20020a7bce04000000b003f0f3ee9e2amr8223435wmc.35.1682354696222;
        Mon, 24 Apr 2023 09:44:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZI1IosDzvVkvuioxGJc58Yq6/Jixuqa346VM3mfDQNZG8Y2ZbItZFloie4FVOtiXmQbf+vpg==
X-Received: by 2002:a7b:ce04:0:b0:3f0:f3ee:9e2a with SMTP id m4-20020a7bce04000000b003f0f3ee9e2amr8223412wmc.35.1682354696002;
        Mon, 24 Apr 2023 09:44:56 -0700 (PDT)
Date: Mon, 24 Apr 2023 12:44:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <db86630b80459e8a40b0f41026473be5bc640763.1682354275.git.mst@redhat.com>
References: <cover.1682354275.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1682354275.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v12 10/10] ccw: document more reserved features

vq reset and shared memory are unsupported, too.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Fixes: https://github.com/oasis-tcs/virtio-spec/issues/160
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Zhu Lingshan <lingshan.zhu@intel.com>

---

changes in v12:
address comment by parav
---
 content.tex | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 1bc9af0..fe032ac 100644
--- a/content.tex
+++ b/content.tex
@@ -2988,11 +2988,13 @@ \subsubsection{Resetting Devices}\label{sec:Virtio Transport Options / Virtio ov
 
 \subsection{Features reserved for future use}\label{sec:Virtio Transport Options / Virtio over channel I/O / Features reserved for future use}
 
-At this time, devices and drivers utilizing Virtio over channel I/O
+Devices and drivers utilizing Virtio over channel I/O
 do not support the following features:
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

