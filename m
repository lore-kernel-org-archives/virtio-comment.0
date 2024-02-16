Return-Path: <virtio-comment-return-9114-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C26DC48BEB
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Feb 2024 08:24:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 495051CA265
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Feb 2024 08:24:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C2D9B98695E
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Feb 2024 08:24:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 855639866F9; Fri, 16 Feb 2024 08:24:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5B8EE986973
	for <virtio-comment@lists.oasis-open.org>; Fri, 16 Feb 2024 08:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708071882; x=1708676682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xYACjPWkkgOpI/tB7l8FQsUwj5cHnCmM6DknQTodTk=;
        b=HBFy3EbhGvSOIoGbzHdh354OH9rTIb+DeHtzIsnHbEkT15ufsPUfBT1171M1elPHW2
         n2Cu3feoS//69TI3rp/oy40RHP/uPwIvEi9DkXhOzH7o1IuIwKrk7yoed321AjnXOEnN
         w/u7CZUqd/Fb/an7qn+cH7GwDZYyhzlbWZ0ddl5WN+Z9LDTuINpvyYraURSPNJactFem
         QcsvXdxG9FeU/jwH2TJ2pSBjAtVTiDMqyYIBvuFFJSCkiy6SNVfTUQ4qWCLR2fl5uKoD
         UaDCjxb7mm2Hv2MEtAGW3UCR0qIDOUT0C0yHs653PxHv2coWrGL50pK0i/wsNkpHCH4r
         l/cw==
X-Forwarded-Encrypted: i=1; AJvYcCV0/kFO8vkm/dA8XU38pZCgNR7BaCes9km+5a6ukQcIk7YW0nKXylYvpTapWi8GhZBWquMg1wruwYYNhPyEy0vHO3w6EBkXAkEJ350qI41J7ik5+Q==
X-Gm-Message-State: AOJu0Yy7be2XeiUvpBqRqn0kAlvSeP8qw/t6khZUtTlonWiuPpgmWRH9
	IL2t+YpF4AOqXBbWwrgKwVnN1Mg3VW+ffhsiTgOWynvL/CVEsCNrFSWi9Bs4rA==
X-Google-Smtp-Source: AGHT+IEPTEh5AsW/CjpM/SdLOPLI18oY3up9l/pRZM9f37+AJl6bvYqznQGVEgzgo7WcVTJos2ln/g==
X-Received: by 2002:a05:6358:8187:b0:17a:fa59:bb87 with SMTP id r7-20020a056358818700b0017afa59bb87mr4206297rwk.16.1708071882439;
        Fri, 16 Feb 2024 00:24:42 -0800 (PST)
From: David Stevens <stevensd@chromium.org>
To: "Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org
Cc: parav@nvidia.com,
	David Stevens <stevensd@chromium.org>
Date: Fri, 16 Feb 2024 17:24:31 +0900
Message-ID: <20240216082432.709956-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [PATCH v4 0/1] Define a low power mode for devices

The Linux patch [1] added support for suspending virtio devices using
native PCI power management. However, Linux does PCI power management
during the noirq phase of suspend and resume. Without a mechanism to
suspend/resume virtio devices when the driver is suspended/resumed in
the early phase of suspend/late phase of resume, there is a window where
interrupts can be lost.

[1] https://lore.kernel.org/lkml/20231208070754.3132339-1-stevensd@chromium.org/

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
  Add suspend support for virtio PCI devices

 transport-pci.tex | 51 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

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

