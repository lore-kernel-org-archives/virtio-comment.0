Return-Path: <virtio-comment-return-7586-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9DCE82CDE
	for <virtio-comment@archiver.kernel.org>; Thu,  5 Oct 2023 09:41:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C37407C3CC
	for <virtio-comment@archiver.kernel.org>; Thu,  5 Oct 2023 09:41:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AB81F9867ED
	for <virtio-comment@archiver.kernel.org>; Thu,  5 Oct 2023 09:41:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 897DC986249; Thu,  5 Oct 2023 09:41:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7501C986529
	for <virtio-comment@lists.oasis-open.org>; Thu,  5 Oct 2023 09:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 4Tx-h4B_Pv-l8dizSqKNqw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696498897; x=1697103697;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utI3JCjVwNlvfblubCHcnkEQXA4RVut3exwutNvU9Rs=;
        b=xE8NQ/+G9kLiOoqkoBb7UlSWH666okDAnfdYPQsmJYAHPPf01dG70SzM/Z0Yg1u2TP
         kn8wkxbAZaYZGcQ00gcs/ITSNue5fHkvd+puNVD7VinjvfxKDl/L4pnQM8vMpjZQXFD2
         PkMoITRvPvmf0KxJPHIxvtGWRs/MKSxfKqDsbNL2JncKbrACbhLOj5Jho0RMxe6VuFme
         h1km0POBH82MbdMojwYNO5I1Pi3uD+GlfCkAZAOcCVm8S3D3B+fv7efAywU6acxLKPKR
         Ot2wa4AMgMjA/yb571JEAoe2NaCU9XQVkOSyj/bmGOGqkJZ6wQW3hYfBGUQ09gYg9dUR
         W3mg==
X-Gm-Message-State: AOJu0Yzv1wL2F6fg4Du68k+q8oUkkJFZ8Q1LHd8ner+a81TRM8z3rbX1
	W4aRmGoyl7d8e1YVgJUUIEy2NB1auT9Nr9KTpIZkxZ7TQnzDTSyCmxjjR/8TTROBfgGkyWEkSb2
	FDr5w38RWQ1T0A7IM/HDn0cDyzgsIZ9Ul0x/wqNkFz+Nq2NpwgNG+A+gXL3sFjhTPC+IQz0IbXS
	N4cOUUHR4ucXuvZ4Pzqw==
X-Received: by 2002:a05:620a:f14:b0:76e:f62e:45cc with SMTP id v20-20020a05620a0f1400b0076ef62e45ccmr5348049qkl.32.1696498897588;
        Thu, 05 Oct 2023 02:41:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkXQQcvomEzrdG6cuGk7cbYG+/pR2SN+LVva9wHGFUuKgEQF8Aq4l0A83bXEJsfHiuVS068w==
X-Received: by 2002:a05:620a:f14:b0:76e:f62e:45cc with SMTP id v20-20020a05620a0f1400b0076ef62e45ccmr5348030qkl.32.1696498897186;
        Thu, 05 Oct 2023 02:41:37 -0700 (PDT)
Date: Thu, 5 Oct 2023 11:41:34 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: virtio-comment@lists.oasis-open.org
Cc: anton.yakovlev@opensynergy.com
Message-ID: <ZR6EzpQb6J1TxbM8@fedora>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH] virtio-sound: add latency_bytes definition

This commit aims at providing a better definition of latency_bytes. To
do so, this commit defines latency_bytes as is defined in Crosvm.

Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
---
 device-types/sound/description.tex | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/device-types/sound/description.tex b/device-types/sound/description.tex
index 54c9c8e..1349765 100644
--- a/device-types/sound/description.tex
+++ b/device-types/sound/description.tex
@@ -694,7 +694,10 @@ \subsubsection{PCM I/O Messages}\label{sec:Device Types / Sound Device / Device
 \begin{description}
 \item[\field{status}] contains VIRTIO_SND_S_OK if an operation is successful,
 and VIRTIO_SND_S_IO_ERR otherwise.
-\item[\field{latency_bytes}] indicates the current device latency.
+\item[\field{latency_bytes}] indicates the current device latency. For
+playback, this is the amount of bytes that must be consumed before
+the current request can be played. For capture, this is the latency in terms of
+bytes that the capture buffer was recorded.
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

