Return-Path: <virtio-comment-return-5291-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FACEC76196
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Apr 2023 07:30:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B3FD02AD69
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Apr 2023 07:30:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A62F49865C8
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Apr 2023 07:30:24 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 95AEE9865B7; Thu,  6 Apr 2023 07:30:24 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85A939865B8
	for <virtio-comment@lists.oasis-open.org>; Thu,  6 Apr 2023 07:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680766222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rIykLxwJvksJ7aa8lySC83PQ2q904UW2fGt87LCu1EM=;
        b=S7DkLKbnBKIeeXK1QrDRMIESQBLtNjR29oneyZ28Gp77szf8Erfy0YMRt8vrCGHySC
         tj9FGMVBzpDycowAx6bFj02ciE5QsNAnFjmnpwI6OrSbcz+QVLS/+aiN4el/aQHszIBD
         RpnOog9obqLIpZnwlH54MwF17MLl9kzoNdMTRzBSfqIbfMndz2AIIyJ+tmuic9HKp+8p
         6J1b15ReNtTzH6WtPLEHEK8w7MGv8faaQULGyAibBkdxHmR6/xRAuEQ8iR2pjtNCxSli
         b3zjf3Eo/wCuZHOYrYr5+XLSRI27jaOrJ7ye+bOiPayfuj7eQ0VbIrFXQ+yDRk4e5o91
         XByg==
X-Gm-Message-State: AAQBX9e4lMj+s0sb5n2n1Gc8SuT0Y4KnOOzz+lF7/DIGsavKEWgaWm8g
	umC5+ovsH7YlgS79QQi9vzP8o8HYjYQESqpCVts=
X-Google-Smtp-Source: AKy350ZRCDawwlXh29wCjUcLDp1EJ7LFYcBT8Q5GCHEEawJMjazp9SgWHus/JravLXA4mieZbrOdgQ==
X-Received: by 2002:a17:902:eccd:b0:1a1:b528:9bea with SMTP id a13-20020a170902eccd00b001a1b5289beamr10998309plh.50.1680766222442;
        Thu, 06 Apr 2023 00:30:22 -0700 (PDT)
From: David Stevens <stevensd@chromium.org>
To: virtio-comment@lists.oasis-open.org
Cc: David Stevens <stevensd@chromium.org>
Date: Thu,  6 Apr 2023 16:30:02 +0900
Message-Id: <20230406073002.3642873-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] [RFC] Define a low power state for devices

This RFC defines a low power state for virtio devices, to gives
drivers an option for power management besides simply resetting their
device.

This patch is a draft aimed at starting a discussion, rather than being
a finalized patch.

To provide some context on where this is coming from, I'm working on
reducing the power overhead of ARCVM (virtualized Android running on
ChromeOS). One of the big gaps in ARCVM power management is that it does
not implement Android's partial wake locks - i.e. the (virtualized) CPUs
are always on, even if the (virtualized) screen is off. This means we
can't force apps to stop running when they shouldn't be running, which
can lead to higher power consumption compared to the ChromeOS baseline.

Partial wake locks are built on s2idle, but unfortunately the current
power management of virtio drivers does not let us use s2idle. The fact
that power management is based around resetting the virtio device means
that it doesn't work with stateful devices (e.g. virtio-fs). Even for
stateless devices, re-initializing all of the devices takes longer than
we would like, especially on lower end hardware.

My rough idea for how to address this would be to make the existing
virtio power management targeted at S4 specifically (i.e. the freeze
device callback). For S0/S1/S3 (i.e. the suspend device callback), this
new lighter weight low power state would be used if available -
otherwise it would fall back to the existing S4 power management code.

I have a very rough prototype that seems to work, and I haven't seen
anything that makes me think this approach is fundamentally unworkable.
That said, I would like to get feedback on the approach earlier rather
than later.
---
 content.tex | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/content.tex b/content.tex
index cff548ab9675..01da6f62ef20 100644
--- a/content.tex
+++ b/content.tex
@@ -449,6 +449,28 @@ \section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Expo
 types. It is RECOMMENDED that devices generate version 4
 UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
 
+\section{Low Power Mode}\label{sec:Basic Facilities of a Virtio Device / Low Power Mode}
+
+A virtio device can be put into a low power state when the
+VIRTIO_F_LOW_POWER bit is negotiated. How a driver puts a
+device into a low power state is transport specific.
+
+In general, a virtio device in a low power state should
+avoid initating any communication with the driver. However,
+certain device-specific functionality is exempt from this
+requirement. Such functionality is detailed in the device
+type specifications.
+
+% One example of such functionality would be allowing
+% the virtio-net device to wake up the guest to deliver
+% incoming network packets.
+
+While a virtio device is in a low power state, it should
+maintain any type specific state in such a way that it is
+able to immediately resume functioning upon leaving the low
+power state, without the need for any additional
+communication with the driver.
+
 \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
 
 We start with an overview of device initialization, then expand on the
@@ -803,6 +825,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
   that the driver can reset a queue individually.
   See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}.
 
+  \item[VIRTIO_F_LOW_POWER(41)] This feature indicates
+  that the driver can put the device into a low power mode.
+  See \ref{sec:Basic Facilities of a Virtio Device / Low Power Mode}.
+
 \end{description}
 
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
-- 
2.40.0.348.gf938b09366-goog


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

