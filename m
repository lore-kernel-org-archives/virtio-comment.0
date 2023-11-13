Return-Path: <virtio-comment-return-8339-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81CAC4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 06:20:31 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CEB192B07C
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 06:20:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AB6969867EC
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 06:20:30 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 950E09865E0; Mon, 13 Nov 2023 06:20:30 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6D90C9865EE
	for <virtio-comment@lists.oasis-open.org>; Mon, 13 Nov 2023 06:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699856403; x=1700461203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=40AnNMTnTA5JbfUmtrf6+OxPtYqdB23qjRlhAiosjOY=;
        b=Vd1C8yZJLx7zbL6gF9SjHlQlSWyB4wI/SkUgRf4X6bRb+3ViOu+hoc1k4G6hEwLPtW
         8T9wkesqwPyRqUwSUcU1c/8vmkR48JUH+PT5wLOLfvHEClHtuWxhNOwBaToEsTip45LQ
         VwF4lDRsF7ZAe/cOMPXzDoZqMQSQlMk5JmWWOhRDKiA1EdXBTXlH4B1vQRBQznQot/Pp
         NIFpATuGbz40/0Irp/EzCMGySnEJyigMB2sjvNqsUXjKsHa5B50ZZreqXduF2u3J3pqi
         umWuwq9dSa4WDdXYOnANOF15SocP6iemDjqAVa4c5cUsvUqJeFOtvrtrxeUoRZbjZp4y
         uQ6A==
X-Gm-Message-State: AOJu0YyrKXnTCcO5Y9UmvZVPiuuCUrHxPr/VPn0jj/1et37cqySAOIxP
	x6QL60cxLua4Q6T5CLtyBOnAa3V9ZKIHF6m7Msk=
X-Google-Smtp-Source: AGHT+IHlesSrSlmMAd1ftZsjf/KL7ghDnrOyNKQB+bYvggaRRlH84Bu6koiwR2GphIkoOQXXsaFGKA==
X-Received: by 2002:a05:6358:6f1d:b0:169:a9d4:3faf with SMTP id r29-20020a0563586f1d00b00169a9d43fafmr6164780rwn.11.1699856402953;
        Sun, 12 Nov 2023 22:20:02 -0800 (PST)
From: David Stevens <stevensd@chromium.org>
To: virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Cc: David Stevens <stevensd@chromium.org>
Date: Mon, 13 Nov 2023 15:19:49 +0900
Message-ID: <20231113061950.122683-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v2 0/1] Define low power mode for devices

The virtio spec currently does not include the concept of device power
management. The lack means that there is no good action drivers can take
when they are requested to put the device into a low power state (e.g.
when a guest is entering a system-wide low power state like S0ix/S3).
Stateless devices can be handled - albeit inefficiently - by resetting
and reinitialzing the device. However, stateful devices cannot support
this situation. This patch defines a low power mode for devices that can
be used in this situation.

Low power mode is mostly defined at the transport layer, and all
device-side power optimizations are optional. This avoids the need for
invasive device-by-device definitions. It also pushes the requirement
onto the device side, to simplify what driver side changes are
necessary to just [1].

I believe this patch may address the virtio-gpu issue which [2] is
trying to address by avoiding the reset altogether when the guest enters
S3.

[1] https://lore.kernel.org/lkml/20231113055138.117392-1-stevensd@chromium.org/
[2] https://lore.kernel.org/lkml/20230919114242.2283646-1-Jiqian.Chen@amd.com/

v1 -> v2:
 - Define virtio-pci support on top of PCI power management.
 - Add more conformance requirements.

David Stevens (1):
  Define a low power mode for devices

 content.tex       | 45 +++++++++++++++++++++++++++++++++++++++++++++
 transport-pci.tex |  7 +++++++
 2 files changed, 52 insertions(+)

-- 
2.42.0.869.gea05f2083d-goog


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

