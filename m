Return-Path: <virtio-comment-return-5601-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC0BC77B78
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:45:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7447C190929
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:45:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6AF5C98644E
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:45:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5FC2898635B; Mon, 24 Apr 2023 16:45:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 813E698669B
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Apr 2023 16:45:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: BF30ezb8PcaAGTYVcwN1hg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682354677; x=1684946677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EddzCnHZXFxYszrFhMDSvIXLk65eRndLFWSDTr4rCCU=;
        b=Pi9IAZaXpN1d/f7RUq3kP8ptx9u/MlYJydsnKvq3ifp0ftCnvtc1jal4Q1IBSym/wu
         x8Po6Kf3hr6WTfCfDbKZ80RExVhJUBL9IzLeOMFYqjlwRE4hShkQTHgmFiuCdyOMcFOL
         kkXwt0+1PoVoU5rUG373nTQMdDu7Bt3KaNWIQqoK16w1BVG0rgDREwptcpZBn2v6b5D/
         zxiXYruP1NzjJl03bhfz9dT6RfmQbLUMHr9yoYVFDZiiVlCa8C/3h8GoQiIqqliK9YGa
         KxR+2Ji36dLPxjmmb2akq4NhjxGHnCOEk298axKNezKUPPu/XCd+Zu4+KwJlXMV9LPYW
         KWFA==
X-Gm-Message-State: AAQBX9fKJkdcIolI7Vi7J9jTGIHNrYuWmE+ElQXqOY/6QMhV1umpe/rW
	+5mLo7Dojai0ljFtujIhYKbNzDzLXDK9tbxuq+yibQ80VcdnE8BzSEQ45ocEoqnYxaD5nTPDuZ3
	lMPSWsgNjvheBpp0FEdWsVQYl/MNr/y1ubRjOa+zl3tfI3u0MMoZBy4ZVHRfZOCLcVS2tRa15dw
	rPF/GXkx6qVgw=
X-Received: by 2002:a05:600c:ac8:b0:3ea:ed4d:38eb with SMTP id c8-20020a05600c0ac800b003eaed4d38ebmr7955226wmr.24.1682354676897;
        Mon, 24 Apr 2023 09:44:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350Ytdk6414+5idDBoLr9eoPYXE4wBZgwGUDBdP6FbaBs3zth8RX1iOTFRHwWgafmMNRh7fanDA==
X-Received: by 2002:a05:600c:ac8:b0:3ea:ed4d:38eb with SMTP id c8-20020a05600c0ac800b003eaed4d38ebmr7955198wmr.24.1682354676548;
        Mon, 24 Apr 2023 09:44:36 -0700 (PDT)
Date: Mon, 24 Apr 2023 12:44:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <8a3435860747eeaa038ece4ff896c1cdd441c185.1682354275.git.mst@redhat.com>
References: <cover.1682354275.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1682354275.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v12 05/10] pci: add admin vq registers to virtio over pci

Add new registers to the PCI common configuration structure.

These registers will be used for querying the indices of the admin
virtqueues of the owner device. To configure, reset or enable the admin
virtqueues, the driver should follow existing queue configuration/setup
sequence.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

---
dropped Max's S.O.B
make queue_num not 0 based

squash! pci: add admin vq registers to virtio over pci

since v11:
	document that admin vqs are not counted with regular vqs
Reviewed-by: Parav Pandit <parav@nvidia.com>
Reviewed-by: Zhu Lingshan <lingshan.zhu@intel.com>
---
 content.tex | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/content.tex b/content.tex
index 2eb15fa..bcbc06d 100644
--- a/content.tex
+++ b/content.tex
@@ -948,6 +948,10 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
         le64 queue_device;              /* read-write */
         le16 queue_notify_data;         /* read-only for driver */
         le16 queue_reset;               /* read-write */
+
+        /* About the administration virtqueue. */
+        le16 admin_queue_index;         /* read-only for driver */
+        le16 admin_queue_num;         /* read-only for driver */
 };
 \end{lstlisting}
 
@@ -974,6 +978,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 
 \item[\field{num_queues}]
         The device specifies the maximum number of virtqueues supported here.
+        This excludes administration virtqueues if any are supported.
 
 \item[\field{device_status}]
         The driver writes the device status here (see \ref{sec:Basic Facilities of a Virtio Device / Device Status Field}). Writing 0 into this
@@ -1033,6 +1038,19 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
         This field exists only if VIRTIO_F_RING_RESET has been
         negotiated. (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
 
+\item[\field{admin_queue_index}]
+        The device uses this to report the index of the first administration virtqueue.
+        This field is valid only if VIRTIO_F_ADMIN_VQ has been negotiated.
+\item[\field{admin_queue_num}]
+	The device uses this to report the number of the
+	supported administration virtqueues.
+	Virtqueues with index
+	between \field{admin_queue_index} and (\field{admin_queue_index} +
+	\field{admin_queue_num} - 1) inclusive serve as administration
+	virtqueues.
+	The value 0 indicates no supported administration virtqueues.
+	This field is valid only if VIRTIO_F_ADMIN_VQ has been
+	negotiated.
 \end{description}
 
 \devicenormative{\paragraph}{Common configuration structure layout}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Common configuration structure layout}
@@ -1119,6 +1137,14 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
 were used before the queue reset.
 (see \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}).
 
+If VIRTIO_F_ADMIN_VQ has been negotiated, and if the driver
+configures any administration virtqueues, the driver MUST
+configure the administration virtqueues using the index
+in the range \field{admin_queue_index} to
+\field{admin_queue_index} + \field{admin_queue_num} - 1 inclusive.
+The driver MAY configure less administration virtqueues than
+supported by the device.
+
 \subsubsection{Notification structure layout}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Notification capability}
 
 The notification location is found using the VIRTIO_PCI_CAP_NOTIFY_CFG
@@ -7686,6 +7712,15 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
   \item[VIRTIO_F_ADMIN_VQ(41)] This feature indicates that the device exposes one or more
   administration virtqueues.
+  At the moment this feature is only supported for devices using
+  \ref{sec:Virtio Transport Options / Virtio Over PCI
+	  Bus}~\nameref{sec:Virtio Transport Options / Virtio Over PCI Bus}
+	  as the transport and is reserved for future use for
+	  devices using other transports (see
+	  \ref{drivernormative:Basic Facilities of a Virtio Device / Feature Bits}
+	and
+	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
+	handling features reserved for future use.
 
 \end{description}
 
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

