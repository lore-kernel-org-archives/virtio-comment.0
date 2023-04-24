Return-Path: <virtio-comment-return-5602-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF87C77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:45:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0B7472B038
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:45:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0311998644C
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:45:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EC73398635B; Mon, 24 Apr 2023 16:45:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2B731986641
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Apr 2023 16:45:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Ncxlm7VMPoyehaxi19cMog-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682354684; x=1684946684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymuSbC5lBp3EuggX5L5kugJ8yYeNSfvsiIW/aXhL6OY=;
        b=MspAvqd4P8qUfQYtwx1uRj1Zqa5Fgs1S7e+c8/lkTJKcF2uBbfFUUyIN9J7hBiK8yT
         ifwVoYlN0T8i+tIVE9s6GAKSOwOixEcX28hHILkzCyEx6oAKewHD1qHqg1XtQA4Sdkas
         Zsk10/Lhb9xPA2ftnGQsNyntakIolg7l7VNvorl9lgmPKCW7oKw/VKb2I/IokHuPeZzl
         sLQ7jgxHUqOxYPnMUDTUVBydDRpiPzsdONUvElTwlRZ7uU9eE47rKGk85QiMe3puCWex
         FnCKQ5RAEN6C6rT7w7HhuBxd2zUVtqjd51jtmjQI4mllhwCGVak5hfj9qhKaxPgwb45v
         1jUw==
X-Gm-Message-State: AAQBX9dNHQ2IjLI+suJ1FoeY9PTkdbbXp00cLXkIPQl+0kUxFT4zYI1B
	3bhhJdqhS3Yf9+OmyReKArEJ3wj07Mxm67mqxWCunGNkgo0ONuK+db0r+5NUFwt/gXl1HKQK9AZ
	SURzopC61V239yTdXlGXQTqPlhLZ/E0phhSz0bO5WPt4hWrsV20a0CLAXDh44smLyQw2TqTAujN
	CyBUlqihd1BZI=
X-Received: by 2002:a7b:c4cd:0:b0:3f1:70a2:ceb5 with SMTP id g13-20020a7bc4cd000000b003f170a2ceb5mr8108543wmk.13.1682354684615;
        Mon, 24 Apr 2023 09:44:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350atvjINdu52RbTOhiJ33lDJEB1C53ZJpjipVRDr5688px2ApiVBga+OX1LUNuc3/84FRUOutg==
X-Received: by 2002:a7b:c4cd:0:b0:3f1:70a2:ceb5 with SMTP id g13-20020a7bc4cd000000b003f170a2ceb5mr8108514wmk.13.1682354684370;
        Mon, 24 Apr 2023 09:44:44 -0700 (PDT)
Date: Mon, 24 Apr 2023 12:44:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <933d619facd5fa184c3afcc7c624f0536ecff060.1682354275.git.mst@redhat.com>
References: <cover.1682354275.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1682354275.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v12 07/10] ccw: document ADMIN_VQ as reserved

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
---
 content.tex | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/content.tex b/content.tex
index 7d6d9c4..07be8cb 100644
--- a/content.tex
+++ b/content.tex
@@ -2979,6 +2979,18 @@ \subsubsection{Resetting Devices}\label{sec:Virtio Transport Options / Virtio ov
 MAY also choose to verify reset completion by reading \field{device status} via
 CCW_CMD_READ_STATUS and checking whether it is 0 afterwards.
 
+\subsection{Features reserved for future use}\label{sec:Virtio Transport Options / Virtio over channel I/O / Features reserved for future use}
+
+At this time, devices and drivers utilizing Virtio over channel I/O
+do not support the following features:
+\begin{itemize}
+
+\item VIRTIO_F_ADMIN_VQ
+
+\end{itemize}
+
+These features are reserved for future use.
+
 \chapter{Device Types}\label{sec:Device Types}
 
 On top of the queues, config space and feature negotiation facilities
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

