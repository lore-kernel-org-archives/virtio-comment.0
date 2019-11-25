Return-Path: virtio-comment-return-948-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9965F985CB0
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Nov 2019 10:21:00 +0000 (UTC)
From: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 25 Nov 2019 11:20:48 +0100
Message-Id: <20191125102048.10061-1-johannes@sipsolutions.net>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] reserve device ID for hwsim wireless simulation
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Johannes Berg <johannes.berg@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

From: Johannes Berg <johannes.berg@intel.com>

The Linux mac80211-hwsim module currently allows simulation of
multiple wireless radios on a shared medium, and has an existing
API for this to work through a userspace implementation of the
medium simulation (e.g. implemented by wmediumd).

In order to simplify working with virtual machines and to enable
(time-compressed) simulation use cases, allocate a virtio device
ID to allow carrying this protocol over virtio in addition to
the current netlink sockets.

Since device ID 28 was previously requested, use 29.

Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
There's an existing allocation of ID 10 for "mac80211 wlan" that
has - to my knowledge as the maintainer of mac80211 - never been
used anywhere, and I'm not familiar with the allocation for it.

It seems pretty safe to use that number here, if that's better?
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 06bb4ca43d67..1703e97e0a81 100644
--- a/content.tex
+++ b/content.tex
@@ -2795,6 +2795,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 27         &   PMEM device \\
 \hline
+29         &   mac80211 hwsim wireless simulation device \\
+\hline
 \end{tabular}
=20
 Some of the devices above are unspecified by this document,
--=20
2.20.1


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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

