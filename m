Return-Path: <virtio-comment-return-8728-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA30C4167B
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 09:41:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 57BFD1FF8C
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 09:41:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 549939863EF
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Dec 2023 09:41:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 46FDD98408C; Mon,  4 Dec 2023 09:41:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 38BD2986376
	for <virtio-comment@lists.oasis-open.org>; Mon,  4 Dec 2023 09:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682892; x=1702287692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHYsh7OmxZQezOX7dfGh7Q9lPmJ2X1k3LnlsEPSJZwM=;
        b=spkQ8XYE+lNjD5JWsCyb8JqOlYIWaRsFK7qW8otL7QIBrht1oBHXd+7QXGKBN7GD3w
         CnRpAU1WUzBQjLYqIDAOOoYxapMD5nUkvwdRZvOsnB8mhHl1AHtvkWO/lC9abSDP/B8r
         kIkdRkCbVAEpvbXthqEy9GnqyVV2wLO3VXLNi5x0SPH+qaC9Lm87JKhyzXHgnvXuLxfC
         ONOtUywZPzbjmT//DG0rrPkRRqBbTgDeh40JLLB1nafEz2SgVo7wB61CCBCqzevvaVPG
         wJUktkxXvdGwTuQ884+ziYLrSOq1Kap1T6VeZlFwqfKrh7m6ACWuoAwcJWVsaQMIS58V
         FX5Q==
X-Gm-Message-State: AOJu0YxwsqyySCguaceR/xFqCXrOMmM4+Ojdmvcz2/5KyVH9AAMAKBBf
	bWb1p4bb409KToINl6fJDI+8Uw==
X-Google-Smtp-Source: AGHT+IGIEI4bip3e8piTzZqoMd8OgbN+NjU8eQxeMZaml0g985zyVZ9DXfpIRXfgMythZ1JCcu4jfg==
X-Received: by 2002:a05:6a20:7d8f:b0:18c:8ff1:f0b with SMTP id v15-20020a056a207d8f00b0018c8ff10f0bmr2035975pzj.56.1701682892235;
        Mon, 04 Dec 2023 01:41:32 -0800 (PST)
From: David Stevens <stevensd@chromium.org>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Cc: David Stevens <stevensd@chromium.org>
Date: Mon,  4 Dec 2023 18:41:22 +0900
Message-ID: <20231204094123.856214-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v3 0/1] Define low power mode for devices

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

v2 -> v3:
 - Use different words for some concepts to avoid conflicts with other
   parts of the spec.
 - Rewrite various sentences to improve clarity.
v1 -> v2:
 - Define virtio-pci support on top of PCI power management.
 - Add more conformance requirements.

David Stevens (1):
  Define a low power mode for devices

 content.tex       | 61 +++++++++++++++++++++++++++++++++++++++++++++++
 transport-pci.tex |  9 +++++++
 2 files changed, 70 insertions(+)

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

