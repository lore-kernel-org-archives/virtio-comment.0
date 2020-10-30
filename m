Return-Path: virtio-comment-return-1493-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E403998615D
	for <virtio-comment@lists.oasis-open.org>; Fri, 30 Oct 2020 16:34:36 +0000 (UTC)
From: Rob Bradford <robert.bradford@intel.com>
Date: Fri, 30 Oct 2020 16:34:15 +0000
Message-Id: <20201030163415.7339-1-robert.bradford@intel.com>
In-Reply-To: <20201029063557-mutt-send-email-mst@kernel.org>
References: <20201029063557-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] content: Reserve virtio-watchdog device ID
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: Rob Bradford <robert.bradford@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Reserve an ID for a watchdog device which may be used to ensure that the
guest is responsive. This is equivalent of a hardware watchdog device
and will trigger the reboot of the guest if the the host does not
periodic ping from the the guest.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/87

Signed-off-by: Rob Bradford <robert.bradford@intel.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index bc26674..6f8ec8f 100644
--- a/content.tex
+++ b/content.tex
@@ -2819,6 +2819,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 33         &   NitroSecureModule \\
 \hline
+35         &   Watchdog \\
+\hline
 \end{tabular}
=20
 Some of the devices above are unspecified by this document,
--=20
2.26.2


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

