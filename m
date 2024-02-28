Return-Path: <virtio-comment-return-9161-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8489C47DD9
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Feb 2024 16:16:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3D9C63309B
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Feb 2024 16:16:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2F6529865D1
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Feb 2024 16:16:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 24436986445; Wed, 28 Feb 2024 16:16:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1703D98645C
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Feb 2024 16:16:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 7OEO1SBRNbyHxCeEQG2MDQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709137005; x=1709741805;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpziXaW5dPHg41wml8XM6qs3Ks0aCdVvhynIHd0eY78=;
        b=evjG056hi9hHWkiCvFlX9GOA/j5ojVgnsYlc1bf634esHUfoOz6K2mHN0hLSn/T2gG
         q+zS8iDvkUoYNaelStM+H3ZT1+LSLsiY29VG5rYEkWNrA9msvdLYRMo5hlEiks+wL2vt
         jqYRixpaC86O23C7pVcaAxB68H5UcIGDHqPqdYokkgCCv/Lqk+24A4/L/W1D7OThZ8PS
         rIelSvi+wvPeUtjKrMabvIae+YIHHjscO+HvdnyRjKilAEyMRytcVb6vheK5AECCA21n
         99ndWT66nfE5k1cYlabuPBGcCJyFyQ9ln4KsSOUwytNeXmcf44MMrTvjnH2yDaZ4i/2N
         kPDQ==
X-Gm-Message-State: AOJu0YxcSm9SNaWDyWKkRhojkmRVnOV31FG20uESXoEJCUne7/pDC4d2
	SEtw49IXkyFvtwl7KjN8vBMGCXVq57T+otvTbXRASjfdY2AmBFRHwSPHuXdvrQ3EWhO0Gd0h0Ib
	d3pb4E367T+3M8OeHpfMy+9TZD+EG6xHpb1NrE6Gj9j+CuZYrAiUqDIqRrA/C4dgmBBpKZV498Y
	PysHiQ0BKzjSzN3s41VoE3THOiYC25kyEABvIz0gi2YrBJrhvjr5Fujmw=
X-Received: by 2002:a05:622a:19aa:b0:42e:b226:4842 with SMTP id u42-20020a05622a19aa00b0042eb2264842mr1550330qtc.0.1709137005343;
        Wed, 28 Feb 2024 08:16:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd6Zxn4GfGpxMBvcfTl/Y+BBt0WuRQRwKinze75Ug9QyncO0kGADlTEWOBbi3ETGObs1nepw==
X-Received: by 2002:a05:622a:19aa:b0:42e:b226:4842 with SMTP id u42-20020a05622a19aa00b0042eb2264842mr1550302qtc.0.1709137005050;
        Wed, 28 Feb 2024 08:16:45 -0800 (PST)
Date: Wed, 28 Feb 2024 17:16:42 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.oasis-open.org
Cc: mvaralar@redhat.com, harald.mommer@opensynergy.com
Message-ID: <Zd9cagFpkcJLr/z0@fedora>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH] virtio-can: rephrase notification mechanism

This commit rephrases the notification mechanism.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
* This patch applies on top of virtio-1.4, which has not been released
  yet.
---
 device-types/can/description.tex | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/device-types/can/description.tex b/device-types/can/description.tex
index 2511d9c..2931aa9 100644
--- a/device-types/can/description.tex
+++ b/device-types/can/description.tex
@@ -128,13 +128,12 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
 \end{lstlisting}
 
 If the transition succeeded the \field{result} is VIRTIO_CAN_RESULT_OK
-otherwise it is VIRTIO_CAN_RESULT_NOT_OK. If a status update is
-necessary, the device updates the configuration \field{status} before
-marking the request used. As the configuration \field{status} change is
-caused by a request from the driver the device is allowed to omit the
-configuration change notification here. The device marks the request
-used when the CAN controller has finalized the transition to the
-requested controller mode.
+otherwise it is VIRTIO_CAN_RESULT_NOT_OK. If a status update is necessary, the
+device updates the configuration \field{status} before marking the request
+used. The device may omit the configuration change notification as the
+configuration \field{status} change is requested by the driver. The device
+marks the request used when the CAN controller has finalized the transition to
+the requested controller mode.
 
 On transition to the STOPPED state the device cancels all CAN messages
 already pending for transmission and marks them as used with

base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
-- 
2.41.0


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

