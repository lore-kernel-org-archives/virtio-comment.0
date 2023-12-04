Return-Path: <virtio-comment-return-8729-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811F2C4167B
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 09:41:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 04772429B1
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 09:41:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE68A9866A2
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 09:41:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E354F9863EF; Mon,  4 Dec 2023 09:41:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D5AE598639D
	for <virtio-comment@lists.oasis-open.org>; Mon,  4 Dec 2023 09:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682896; x=1702287696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NHMmTO9rzKbfdTR1rog0HpWRFw3rdJXsIgxcc6nBgIY=;
        b=ewTWt4PyP+5LhcAoXE5gQV7bXxkfvpYbCume2s0H3VWNILo1AagSwErATfu3LKgKgA
         gAN+2egqyvc1V5usihDF6mOKsTU7Tuseb/kNg/smHIFCihZZwkXCRQ1FN8CZY/NKvP0b
         lP9J8Axb5xVJ097URDivk/cC1Aow3YxVVoZ8GYhPiWx8q+2a1Uj/Rz1DVykuo4JA8NyB
         Qop7B8Og7qUpfRgrYeHybiq9HwC1vYjpEORfKbV7bYZ6NW5Mk3PrEqN/P+LMbAAz0TPV
         dLUyYlWY9DVQs5Uz3NdGjtwozfLxBQxD7+LtZmUd1CeS7SIyHAGM9BKb3Wh7IYJWrkgO
         6aAA==
X-Gm-Message-State: AOJu0Ywjq826Ymz1XiE5kA2T9KSN5E+t+DT3A3hI3Y5B0hhymY0Wvd8Z
	RzgEi6WwuOr1yYSuguZm9ZMtZA==
X-Google-Smtp-Source: AGHT+IEbRmuBsJJF9gBz1SAp3bxSrBIDI+ksWhqWzy1JnW4AELmHLM/6QW3KWfLoITxlsGZlz8QIEg==
X-Received: by 2002:a05:6a20:c130:b0:18f:97c:8a51 with SMTP id bh48-20020a056a20c13000b0018f097c8a51mr4164607pzb.124.1701682896142;
        Mon, 04 Dec 2023 01:41:36 -0800 (PST)
From: David Stevens <stevensd@chromium.org>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Cc: David Stevens <stevensd@chromium.org>
Date: Mon,  4 Dec 2023 18:41:23 +0900
Message-ID: <20231204094123.856214-2-stevensd@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231204094123.856214-1-stevensd@chromium.org>
References: <20231204094123.856214-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 1/1] Define a low power mode for devices

Define a low power mode for virtio devices where the devices are
expected to maintain their state. This gives drivers an option for power
management besides simply resetting their device. In the virtualization
use case, this allows the guest to be suspended even with stateful
virtio devices like gpu and fs.

Low power mode is primarily defined at the transport layer. The only
part that depends on device-type specific details is whether a given
virtqueue is device driven or driver driven.

This change only defines the transport-specific implementation for
Virtio over PCI.
---
 content.tex       | 61 +++++++++++++++++++++++++++++++++++++++++++++++
 transport-pci.tex |  9 +++++++
 2 files changed, 70 insertions(+)

diff --git a/content.tex b/content.tex
index 0a62dce5f65f..c1ff542bbe2c 100644
--- a/content.tex
+++ b/content.tex
@@ -502,6 +502,67 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
 types. It is RECOMMENDED that devices generate version 4
 UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
 
+\section{Low Power Mode}\label{sec:Basic Facilities of a Virtio Device / Low Power Mode}
+
+Devices and drivers can implement a low power mode: in this mode,
+device state is maintained but the driver does not access the device,
+allowing the device to reduce its power consumption. While in low
+power mode, after a device sends a notification, it generates a wakeup
+signal to inform the driver of the pending notification. While the
+device is in low power mode, the driver only needs to check for
+notifications after receiving a wakeup signal. How a device is put
+into and taken out of low power mode is transport specific, as is how
+wakeup signals are implemented.
+
+To give the driver a chance to respond to external input, the device
+is expected to send a wakeup signal after sending a notification
+resulting from such input. To achieve this, the device is expected to
+send wakeup signals after sending configuration change notifications.
+For used buffer notifications, device queues can be split into two
+categories: device led queues and driver led queues. Device led queues
+are queues where the device holds onto buffers that have been made
+available by the driver for an indeterminate period of time, until
+some device-side event occurs (e.g. event queues, rx queues). Driver
+led queues are queues where the device processes available buffers and
+adds them to used queue within a bounded time (e.g. command queues, tx
+queues). The device is expected to send wakeup signals after sending
+used buffer notifications for device led queues, but not for driver
+led queues.
+
+\devicenormative{\subsection}{Low Power Mode}{Basic Facilities of a Virtio
+Device / Low Power Mode}
+
+A device in low power mode MUST maintain its state such that all
+driver visible state after exiting low power mode exactly matches
+driver visible state before entering low power mode.
+
+A device in low power mode MUST continue to operate device led queues.
+After sending a used buffer notification for such a queue, the device
+MUST generate a wakeup signal.
+
+A device in low power mode MUST continue to send configuration change
+notifications. After sending a configuration change notification, the
+device MUST generate a wakeup signal.
+
+A device in low power mode SHOULD NOT generate wakeup signal for
+driver driven queues. A device SHOULD stop sending used buffer
+notifications for such queues until after exiting the low power state.
+
+A device in low power mode SHOULD minimize its resource usage,
+although what steps to take are specific to a particular device
+implementation.
+
+\drivernormative{\subsection}{Low Power Mode}{Basic Facilities of a Virtio
+Device / Low Power Mode}
+
+A driver MUST not interact with a device in low power mode except
+to take the device out of low power mode or to recieve and
+acknowledge a wakeup signal generated by the device, all of which are
+done in a transport-specific way.
+
+A driver MAY use wakeup signals as a trigger to take the device out of
+low power mode, but it MAY also ignore wakeup signals.
+
 \input{admin.tex}
 
 \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
diff --git a/transport-pci.tex b/transport-pci.tex
index a5c6719ea871..932f3299dbab 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -1212,3 +1212,12 @@ \subsubsection{Driver Handling Interrupts}\label{sec:Virtio Transport Options /
         re-examine the configuration space to see what changed.
     \end{itemize}
 \end{itemize}
+
+\subsubsection{Low Power Mode}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Low Power Mode}
+
+Devices can implement support for low power mode (see \ref{sec:Basic
+Facilities of a Virtio Device / Low Power Mode}).  Low power mode
+corresponds to the device power management state
+D3\textsubscript{Hot}. A device advertises support for low power mode
+by presenting the PCI Power Management Capability. Wakeup events are
+implemented as PCI Power Management Events (PMEs).
-- 
2.43.0.rc2.451.g8631bc7472-goog


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

