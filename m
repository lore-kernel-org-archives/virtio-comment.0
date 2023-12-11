Return-Path: <virtio-comment-return-8772-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC1DC4167B
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 10:52:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A3D90F3F4A
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 10:52:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 777EA986513
	for <virtio-comment@archiver.kernel.org>; Mon, 11 Dec 2023 10:52:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4AB559841A2; Mon, 11 Dec 2023 10:52:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A87B986471
	for <virtio-comment@lists.oasis-open.org>; Mon, 11 Dec 2023 10:52:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DOybB0X_Pj-reIY81n0eQg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702291920; x=1702896720;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uhllqskYkZ/s1fb9Ge76OI21FU95CxniRcmJ9dZ2ieI=;
        b=Cij2Gm5/VycWhzLpMg7HXa7QR6pO/JiYHC7zb1KHivzTr2rgIx/sNVdQutdPtrHF7z
         neucKJJVHBhwuXgsBq7SNW6iGYNY6dpj8Iu9EG/ynhSgI3bUyLk2ooWVi31x8gGs/bZY
         eLfAIM6fJzuh+bbP0MqESgaRXxa2jY3352S8CAn68sf4lZll4q1hUBi5rJC3NIG96Z1T
         1EVXuHovDp/1RRGSdYNLLMs9awOffCgDKar+X5wvuGjQCDKJ0z1Z+erkH21awTvNRFJa
         G0ONsYtn2y8sce4Fq+/oeGt3Gx7Z40klM8h4hgGD5ugS2IGaOjrhv5Ke9LS7URJ3JFWq
         OQuQ==
X-Gm-Message-State: AOJu0Yz77lVJU7aps3IJ3H7aFOWQOjDeLcfG3Lt1vKe+R/Mh1qozcFct
	GWaRSIS/WZldbf8DBIeM736r4ahNckTKrz4HjBqCCmvTFajD1nFO0LY5aODLYzerASO3qujf3Jh
	2uo3enCLRoqpDK5i4kyXotkbAGPPfkHEcB+gMBPljP3ztGRczrWSfjRy1ZJMHv7GiDQi42KyOJk
	rAQFFwInSxdcE8wjm1oA==
X-Received: by 2002:a0c:fbd0:0:b0:67a:a721:7829 with SMTP id n16-20020a0cfbd0000000b0067aa7217829mr4769170qvp.78.1702291919996;
        Mon, 11 Dec 2023 02:51:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVNBqzVpIWEv7Fv61NBUov0TE9YZ2aMjGEaTHGWh5qFzeeDu3kG4WyS2DNQCrzAQUtUQNnDQ==
X-Received: by 2002:a0c:fbd0:0:b0:67a:a721:7829 with SMTP id n16-20020a0cfbd0000000b0067aa7217829mr4769163qvp.78.1702291919684;
        Mon, 11 Dec 2023 02:51:59 -0800 (PST)
Date: Mon, 11 Dec 2023 11:51:56 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.oasis-open.org
Cc: anton.yakovlev@opensynergy.com, mvaralar@redhat.com
Message-ID: <ZXbpzOFix95Pfeoc@fedora>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH v1] virtio-sound: add latency_bytes definition

This commit aims at providing a better definition of latency_bytes. To
do so, this commit defines latency_bytes as is defined in Crosvm.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
Changelog:
v0 -> v1:
 * specify that the delay is due to the device implementation.
---
 device-types/sound/description.tex | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
index 54c9c8e..a138e5b 100644
--- a/device-types/sound/description.tex
+++ b/device-types/sound/description.tex
@@ -694,7 +694,10 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
 \begin{description}
 \item[\field{status}] contains VIRTIO_SND_S_OK if an operation is successful,
 and VIRTIO_SND_S_IO_ERR otherwise.
-\item[\field{latency_bytes}] indicates the current device latency.
+\item[\field{latency_bytes}] indicates the current additional delay caused by
+the device's implementation. For playback, this is the amount of bytes that
+must be consumed before the current request can be played. For capture, this is
+the latency in terms of bytes that the capture buffer was recorded.
 \end{description}
 
 Since all buffers in the queue (with one exception) should be of the size
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

