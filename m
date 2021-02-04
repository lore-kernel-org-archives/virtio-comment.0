Return-Path: virtio-comment-return-1712-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B5DEA98660B
	for <virtio-comment@lists.oasis-open.org>; Thu,  4 Feb 2021 07:56:49 +0000 (UTC)
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
Date: Wed,  3 Feb 2021 23:46:00 -0800
Message-Id: <20210204074600.1926789-1-vivek.kasireddy@intel.com>
In-Reply-To: <20210203111532.69ee4033.cohuck@redhat.com>
References: <20210203111532.69ee4033.cohuck@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] content: Request to reserve device ID 37 for Dmabuf device
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>, Dongwon Kim <dongwon.kim@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

The Dmabuf device can be used to share a dmabuf created in the Guest
with the Host.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 1ca24c1..c1ba683 100644
--- a/content.tex
+++ b/content.tex
@@ -2846,6 +2846,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 35         &   Watchdog \\
 \hline
+37         &   Dmabuf device \\
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

