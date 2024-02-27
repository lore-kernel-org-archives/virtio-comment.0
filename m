Return-Path: <virtio-comment-return-9146-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD62DC48BF6
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 01:54:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 112762AF89
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 01:54:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F044C9863DE
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 01:54:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DA95E9863AB; Tue, 27 Feb 2024 01:54:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CB0729863B6
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Feb 2024 01:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998847; x=1709603647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ir8KOJyTG35oHOK6cwt0T+Sr/hs8fYARHDnxd5lWN0w=;
        b=L6WrBgGcRedtQ4Q9SFZQ/RGBFsyqVQ5yr7NvC5Vp6KHw/qtSuoRgIwe9/I7IDOAYsy
         LGWcwp/1eWythzF+nSvr8OhsXfJkzlColroGrWMezLXCt/6zjEe29yWKlTiuEuGMdEDp
         aFJowuuJMWdiA+hv8TPGeo1Rngq8Lxv1jllmRl4GZmpUY2fQ3XXatUvlchQUGKOmoxi1
         1Wa3ttJnCBvZ7DVboYmBmpX6SHu8Mk+8PRVVg1jF1l0SucEX9I3KPkZ9vdaUo5vsv0Jx
         wtjCixPzITk/FGF6jyxov7a5yuVyzpqnaTCd+gahpAbvMIfvljTpUKShXQi2WTPuyJ+2
         IplA==
X-Forwarded-Encrypted: i=1; AJvYcCUjveXEukbMSpyjC0//VdqUdA0hyzvfjmsJEU5vuYsnAmg+EIzwOZbJNWivnQbzRqYD8TXPEvHBZfdig2+pEMOtu7oypW0gPycGIZj7oxDnlPVy3g==
X-Gm-Message-State: AOJu0YzMeEEy0+1JZUmtl+5xCq3bh17wOBR24Dum2/PgF3qrDhwIYWrJ
	hfaiEMI0p0/95/sxOVbTUNQ7dXg+bj3+a9gtzy+dRe6ZaBTrU8c4iZcxHFZSfw==
X-Google-Smtp-Source: AGHT+IG1kghKSW/J7cyRPf0d3dYoN5c3ExOUNsJD2LOk9tDJkqkFCDQ3VlsvmxbPm43kC9SJvvtuyw==
X-Received: by 2002:a17:902:ec8b:b0:1db:2ad9:9393 with SMTP id x11-20020a170902ec8b00b001db2ad99393mr11736234plg.48.1708998847242;
        Mon, 26 Feb 2024 17:54:07 -0800 (PST)
From: David Stevens <stevensd@chromium.org>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Cc: parav@nvidia.com,
	David Stevens <stevensd@chromium.org>
Date: Tue, 27 Feb 2024 10:53:44 +0900
Message-ID: <20240227015345.3614965-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v5 0/1] Define a low power mode for devices

The Linux patch [1] added support for suspending virtio devices using
native PCI power management. However, Linux does PCI power management
during the noirq phase of suspend and resume. Without a mechanism to
suspend/resume virtio devices when the driver is suspended/resumed in
the early phase of suspend/late phase of resume, there is a window where
interrupts can be lost.

This revision of the patch tries to reconcile with the similar proposal
[2], which was pulled out of one of a patch series attempting to add
live migration support to virtio [3].

[1] https://lore.kernel.org/lkml/20231208070754.3132339-1-stevensd@chromium.org/
[2] https://lore.kernel.org/all/20240218132306.83456-1-lingshan.zhu@intel.com/
[3] https://lore.kernel.org/all/20231103103437.72784-1-lingshan.zhu@intel.com/

v4 -> v5:
 - Use a device status bit instead of a pci capability.
 - Reconcile differences with [2] by specifying that devices should
   finish processing buffers before suspending and that devices
   shouldn't access virtqueues while suspended.
 - Add more details about state transition acknowledgment.
v3 -> v4:
 - Define virtio-pci specific power management that can be used in
   conjunction with PCI power management.
v2 -> v3:
 - Use different words for some concepts to avoid conflicts with other
   parts of the spec.
 - Rewrite various sentences to improve clarity.
v1 -> v2:
 - Define virtio-pci support on top of PCI power management.
 - Add more conformance requirements.

David Stevens (1):
  Add SUSPEND bit to device status

 content.tex | 89 ++++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 84 insertions(+), 5 deletions(-)

-- 
2.44.0.rc0.258.g7320e95886-goog


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

