Return-Path: <virtio-comment-return-5600-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9AFC77B61
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:45:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1B9B260347
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:45:09 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1342298640F
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 16:45:09 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 08BDA986350; Mon, 24 Apr 2023 16:45:09 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE836986364
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Apr 2023 16:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: fJ3dXBDoMRiEtKtKzheNGQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682354673; x=1684946673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bxdRqX+6xowy9izNPy6dXnHAjVRS4NyQel6oenghPOA=;
        b=Jjek99NzsUJeqDQKHVRPhtM4Ly17d2KIrAWCr7YC1eQToRuE8ZH20RwrOOVRoidrHt
         Hpm+OybkqUYMMqQk95sHOeZSYOrIi/CcFaONkDp7l5/QaU6bSfrUbaqAhkmfS6JMDaMo
         yuMfyFbTS4kWoATe7iAb7GfAJbzihM4Od5dn3/iOFhQWNtQjf6RRHoBWOHXurU/xvenv
         V5Ba6tqDR9J+n3RjtIGDuk7kJ8oTI4x3iy4R0CbWx2ov0u88UB7CIjtfhgV25rx4TfG7
         fSmwWDeIl82bGQaojcP7nHx87UmnHiJywN2W49fNRd7N+DFxl6qTAgKrIi3uSLaetc7b
         Fn6g==
X-Gm-Message-State: AAQBX9c2dhKgHt2I/7D8ZtbyNa0dFoiD3VwqOL3CiJ0ooSZ5WiGG9AuA
	LOQ4Nk68o8P/3/b3EvSn6Y1rZDBPMVQBnMlpWgrtwlDLlzJixh0qzSkDP9253G7NUSe5QoRSel7
	YdsT5qD15x01dQgbKB6/5a8qrHEWlMrQRqYr2OlsAxdCb5NRq+stxq1P8KXB4LlAv0pWS9F+/BB
	uJXC7fUBsac0U=
X-Received: by 2002:a7b:c8c4:0:b0:3ee:1084:aa79 with SMTP id f4-20020a7bc8c4000000b003ee1084aa79mr7325180wml.20.1682354673156;
        Mon, 24 Apr 2023 09:44:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350YPTg3vJn8u47pvHLGAIpaKz4j10PcVsh5mmsWx8cIVtGlxdRUhdgc727NCLKRjMShee1gu8Q==
X-Received: by 2002:a7b:c8c4:0:b0:3ee:1084:aa79 with SMTP id f4-20020a7bc8c4000000b003ee1084aa79mr7325154wml.20.1682354672671;
        Mon, 24 Apr 2023 09:44:32 -0700 (PDT)
Date: Mon, 24 Apr 2023 12:44:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com,
	sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com,
	Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio@lists.oasis-open.org, Jiri Pirko <jiri@nvidia.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>, pasic@linux.ibm.com,
	Shahaf Shuler <shahafs@nvidia.com>, Parav Pandit <parav@nvidia.com>,
	Max Gurtovoy <mgurtovoy@nvidia.com>
Message-ID: <2334f663f1fd0f11e79235425c6dcf9aa8fa8c1c.1682354275.git.mst@redhat.com>
References: <cover.1682354275.git.mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cover.1682354275.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v12 04/10] admin: introduce virtio admin virtqueues

The admin virtqueues will be the first interface used to issue admin commands.

Currently the virtio specification defines control virtqueue to manipulate
features and configuration of the device it operates on:
virtio-net, virtio-scsi, etc all have existing control virtqueues. However,
control virtqueue commands are device type specific, which makes it very
difficult to extend for device agnostic commands.

Keeping the device-specific virtqueue separate from the admin virtqueue
is simpler and has fewer potential problems. I don't think creating
common infrastructure for device-specific control virtqueues across
device types worthwhile or within the scope of this patch series.

To support this requirement in a more generic way, this patch introduces
a new admin virtqueue interface.
The admin virtqueue can be seen as the virtqueue analog to a transport.
The admin queue thus does nothing device type-specific (net, scsi, etc)
and instead focuses on transporting the admin commands.

We also support more than one admin virtqueue, for QoS and
scalability requirements.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

---

changes since v11:
	ack by stefan
	queues->enqueues to address comment by parav

changes since v10:

explain ordering of commands as suggested by Stefan
dropped Max's S.O.B
reword commit log as suggested by David
minor wording fixes suggested by David
---
 admin.tex   | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 content.tex |  7 +++--
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/admin.tex b/admin.tex
index d6042e4..91e0cba 100644
--- a/admin.tex
+++ b/admin.tex
@@ -182,3 +182,78 @@ \subsection{Group administration commands}\label{sec:Basic Facilities of a Virti
 \field{command_specific_data} and \field{command_specific_result}
 depends on these structures and is described separately or is
 implicit in the structure description.
+
+\section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Administration Virtqueues}
+
+An administration virtqueue of an owner device is used to submit
+group administration commands. An owner device can have more
+than one administration virtqueue.
+
+If VIRTIO_F_ADMIN_VQ has been negotiated, an owner device exposes one
+or more adminstration virtqueues. The number and locations of the
+administration virtqueues are exposed by the owner device in a transport
+specific manner.
+
+The driver enqueues requests to an arbitrary administration
+virtqueue, and they are used by the device on that same
+virtqueue. It is the responsibility of the driver to ensure
+strict request ordering for commands, because they will be
+consumed with no order constraints.  For example, if consistency
+is required then the driver can wait for the processing of a
+first command by the device to be completed before submitting
+another command depending on the first one.
+
+Administration virtqueues are used as follows:
+\begin{itemize}
+\item The driver submits the command using the \field{struct virtio_admin_cmd}
+structure using a buffer consisting of two parts: a device-readable one followed by a
+device-writable one.
+\item the device-readable part includes fields from \field{opcode}
+through \field{command_specific_data}.
+\item the device-writeable buffer includes fields from \field{status}
+through \field{command_specific_result} inclusive.
+\end{itemize}
+
+For each command, this specification describes a distinct
+format structure used for \field{command_specific_data} and
+\field{command_specific_result}, the length of these fields
+depends on the command.
+
+However, to ensure forward compatibility
+\begin{itemize}
+\item drivers are allowed to submit buffers that are longer
+than the device expects
+(that is, longer than the length of
+\field{opcode} through \field{command_specific_data}).
+This allows the driver to maintain
+a single format structure even if some structure fields are
+unused by the device.
+\item drivers are allowed to submit buffers that are shorter
+than what the device expects
+(that is, shorter than the length of \field{status} through
+\field{command_specific_result}). This allows the device to maintain
+a single format structure even if some structure fields are
+unused by the driver.
+\end{itemize}
+
+The device compares the length of each part (device-readable and
+device-writeable) of the buffer as submitted by driver to what it
+expects and then silently truncates the structures to either the
+length submitted by the driver, or the length described in this
+specification, whichever is shorter.  The device silently ignores
+any data falling outside the shorter of the two lengths. Any
+missing fields are interpreted as set to zero.
+
+Similarly, the driver compares the used buffer length
+of the buffer to what it expects and then silently
+truncates the structure to the used buffer length.
+The driver silently ignores any data falling outside
+the used buffer length reported by the device.  Any missing
+fields are interpreted as set to zero.
+
+This simplifies driver and device implementations since the
+driver/device can simply maintain a single large structure (such
+as a C structure) for a command and its result. As new versions
+of the specification are designed, new fields can be added to the
+tail of a structure, with the driver/device using the full
+structure without concern for versioning.
diff --git a/content.tex b/content.tex
index 04592fb..2eb15fa 100644
--- a/content.tex
+++ b/content.tex
@@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
 \begin{description}
 \item[0 to 23, and 50 to 127] Feature bits for the specific device type
 
-\item[24 to 40] Feature bits reserved for extensions to the queue and
+\item[24 to 41] Feature bits reserved for extensions to the queue and
   feature negotiation mechanisms
 
-\item[41 to 49, and 128 and above] Feature bits reserved for future extensions.
+\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
 \end{description}
 
 \begin{note}
@@ -7684,6 +7684,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
   that the driver can reset a queue individually.
   See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}.
 
+  \item[VIRTIO_F_ADMIN_VQ(41)] This feature indicates that the device exposes one or more
+  administration virtqueues.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
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

