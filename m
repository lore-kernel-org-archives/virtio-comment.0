Return-Path: <virtio-comment-return-5815-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32B7C77B7F
	for <virtio-comment@archiver.kernel.org>; Fri,  5 May 2023 15:41:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 888EB339BA
	for <virtio-comment@archiver.kernel.org>; Fri,  5 May 2023 15:41:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 806B89866C9
	for <virtio-comment@archiver.kernel.org>; Fri,  5 May 2023 15:41:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 768989866BC; Fri,  5 May 2023 15:41:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 74AEA98679F
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 May 2023 15:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: a1Nq4QhONQaG2Mkbc9xHOw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683301262; x=1685893262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TBRQFnF9vtLPx3AcrK3IgDuWPAKNdNiqDo5m0n9nBM=;
        b=E6+ktOjLkqf7iouXtJY9xbmP6aFpV3/szVzs0KXKE3rsTTiEYMoWoR+A3nB0pkcXZg
         VR9YD3UMCrZdXIqaD6XC/SsfvUzU53jw6WEorojspIi0+IoJ3p3BFOAocXOKHJEBjZx+
         JP3b13eMXHrqUBy8Rp+ZRqRlUzyksWpfhHLvJM7nZPUw8FQJD3NAcyIVLlCw+LMihd52
         zCHXUDlIndB+7vo1ahxOhQgJLuqFvOGWNTCplW74+wA0E8GR4yNlxR2R4Ta6QpudA15P
         7HTV7vbFVXFmgLMK2PUJi+uGqPoUsb6nSCJjUjNC3cE2009MdbfSaDo+GOdYQsPhr06w
         7E+w==
X-Gm-Message-State: AC+VfDwkODDL+FaOzQY3InErI4UecG0aSmihRZIL0AWUFB0z29L8boUF
	pvv2RLqrOrDTzQS2kZ5jen/ST+bkLfwwfvasdJUe5VN7KwDfDhFPp2YnsqkahEBYTy5tzZnH7/K
	wi55GLZ1Nq9or4cmOY56/PEv7sVVkVpzBbE/ATLXs4wySFh/8tn40na7vBpVRF3EDzyYSUA7ZRn
	TY9yokatB+Z8s=
X-Received: by 2002:a1c:4b0a:0:b0:3ee:96f0:ea31 with SMTP id y10-20020a1c4b0a000000b003ee96f0ea31mr1438030wma.18.1683301262345;
        Fri, 05 May 2023 08:41:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6XiPVd69y9ChGUBLUcw1qf/0y4Gqb0IOfqgTCAMIVgfnFHCnLPwS8rwt/1/iur+LWPGKEUzw==
X-Received: by 2002:a1c:4b0a:0:b0:3ee:96f0:ea31 with SMTP id y10-20020a1c4b0a000000b003ee96f0ea31mr1437998wma.18.1683301261885;
        Fri, 05 May 2023 08:41:01 -0700 (PDT)
Date: Fri, 5 May 2023 11:40:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <879bb769e6cbf52799ee5f6ee8ea003efead61e7.1683301091.git.mst@redhat.com>
References: <cover.1683301091.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1683301091.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v13 07/10] ccw: document ADMIN_VQ as reserved

Adding relevant registers needs more work and it's not
clear what the use-case will be as currently only
the PCI transport is supported. But let's keep the
door open on this.
We already say it's reserved in a central place, but it
does not hurt to remind implementers to mask it.

Note: there are more features to add to this list.
Will be done later with a patch on top.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Zhu Lingshan <lingshan.zhu@intel.com>
Reviewed-by: Max Gurtovoy <mgurtovoy@nvidia.com>

since v12:
	drop "at this time" comment by parav
---
 transport-ccw.tex | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/transport-ccw.tex b/transport-ccw.tex
index c492cb9..d42ec7f 100644
--- a/transport-ccw.tex
+++ b/transport-ccw.tex
@@ -599,3 +599,15 @@ \subsubsection{Resetting Devices}\label{sec:Virtio Transport Options / Virtio ov
 successful conclusion of the CCW_CMD_VDEV_RESET channel command, although it
 MAY also choose to verify reset completion by reading \field{device status} via
 CCW_CMD_READ_STATUS and checking whether it is 0 afterwards.
+
+\subsection{Features reserved for future use}\label{sec:Virtio Transport Options / Virtio over channel I/O / Features reserved for future use}
+
+Devices and drivers utilizing Virtio over channel I/O
+do not support the following features:
+\begin{itemize}
+
+\item VIRTIO_F_ADMIN_VQ
+
+\end{itemize}
+
+These features are reserved for future use.
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

