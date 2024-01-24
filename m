Return-Path: <virtio-comment-return-9005-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D08BC48260
	for <virtio-comment@archiver.kernel.org>; Wed, 24 Jan 2024 11:16:05 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C7A5C2B06C
	for <virtio-comment@archiver.kernel.org>; Wed, 24 Jan 2024 11:16:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3BF59867F1
	for <virtio-comment@archiver.kernel.org>; Wed, 24 Jan 2024 11:16:04 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 963E29867D7; Wed, 24 Jan 2024 11:16:04 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 81DDB9867E6
	for <virtio-comment@lists.oasis-open.org>; Wed, 24 Jan 2024 11:16:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: SFbn8I4AMFa7hTXRxcaywQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706094959; x=1706699759;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GwiE2/yz8VhnNvodkElUD2FNEZjMCAX4OtwMgtRG1vQ=;
        b=GA4q5dHaWM2E8oR+xe4FBFThdVj5UyC0Mi2o8IiMXZi7ZtMLsTb26RTHyMoW0fi7Tn
         AfAaJTdnheBkpGtZX2aVUzaT42WdBcdxh+P6+6uCmYc5xl5yfB6qXR12FIJfbp218G5G
         iLoKH8r7C+S9pMfBBHAztor/dfLZouBvcTv7nFk1eioKRa91wjffA8CRISd00gFi2xWo
         F/JQiyrDRxkz6vmunZSktMx4wM8XGygjanpNChN22t4T969gaMVF7wCWlbFs3TaT7TS6
         2WOT2p9cQ5rqMzhZG87fgmuX8qv9pIBH74ahXsI4CaF3Grx2Noj25RJXjUQD/sSGlLs/
         vZ+A==
X-Gm-Message-State: AOJu0YyFRxAplwEVaBHOAYl7Wb8fckN1WDPHpypy8wofC2GS77PMeNj9
	4FcmZUvhp9Y8OcwbxI+uUJYwqrC1AZoy75/8I4B4N7KaVskDLPmDF40H5LPQIN1fxMYikHwqYeb
	Cvxk35NIyK2+O2chK6/4sjhxEbGk76r1KlejxPFnxFOmDgSufBZ4Iu/3zUgjADPTSHnfcCdYw5X
	JW7d1Zo0q5FJQ4oG8HFTiWLIIVSSAU3yztMbhQDOhZ/8mxSeJB
X-Received: by 2002:a19:645a:0:b0:50e:6cce:f83 with SMTP id b26-20020a19645a000000b0050e6cce0f83mr2928872lfj.41.1706094959078;
        Wed, 24 Jan 2024 03:15:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTRHEN8mFK5cqzvzp8Sx8nWHspL6QOzlqLGQIiWfe0VnIgfOIIq4y7deU8ObGip8FGIoxIZQ==
X-Received: by 2002:a19:645a:0:b0:50e:6cce:f83 with SMTP id b26-20020a19645a000000b0050e6cce0f83mr2928861lfj.41.1706094958581;
        Wed, 24 Jan 2024 03:15:58 -0800 (PST)
Date: Wed, 24 Jan 2024 06:15:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
Cc: virtio@lists.oasis-open.org
Message-ID: <ff9a6d805e7d510cde77b9989bef90aa21ffe4b4.1706094950.git.mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] [PATCH] virtio-net: clarify error handling for coalescing

This is not a huge deal since it's a SHOULD anyway,
so make the new requirement SHOULD too.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 device-types/net/description.tex | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index aff5e08..d1d25fe 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -1792,7 +1792,11 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
 
 The device MUST ignore \field{reserved}.
 
-The device SHOULD respond to VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and VIRTIO_NET_CTRL_NOTF_COAL_RX_SET commands with VIRTIO_NET_ERR if it was not able to change the parameters.
+The device SHOULD respond to VIRTIO_NET_CTRL_NOTF_COAL_TX_SET and
+VIRTIO_NET_CTRL_NOTF_COAL_RX_SET commands with VIRTIO_NET_ERR if
+it was not able to change coalescing parameters. In this case,
+the parameters SHOULD remain unchanged, for all VQs.
+
 
 The device MUST respond to the VIRTIO_NET_CTRL_NOTF_COAL_VQ_SET command with VIRTIO_NET_ERR if it was not able to change the parameters.
 
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

