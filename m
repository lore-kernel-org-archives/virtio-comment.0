Return-Path: virtio-comment-return-1718-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B1259986087
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Feb 2021 10:47:36 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
Date: Tue, 16 Feb 2021 11:47:28 +0100
Message-Id: <20210216104728.1086055-1-cohuck@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] virtio-ccw: relax device requirement for revision-specific command rejection
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

The device is currently required to reject any command that is
not contained in the negotiated revision. Some implementations
did not actively check for the revision when processing a command;
retroactively changing these implementations can break existing
drivers.

Relaxing the rejection requirement to SHOULD makes these existing
device implementations compliant, and will not have any effect on
drivers that did not send any commands for wrong revisions.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/96

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 content.tex | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/content.tex b/content.tex
index 835f1ea5ebaa..b72bad0dddaa 100644
--- a/content.tex
+++ b/content.tex
@@ -2396,7 +2396,7 @@ \subsubsection{Setting the Virtio Revision}\label{sec=
:Virtio Transport Options /
 and \field{data}, it MUST post a unit check with command reject as well. A
 non-transitional device MUST reject revision id 0.
=20
-A device MUST answer with command reject to any virtio-ccw specific
+A device SHOULD answer with command reject to any virtio-ccw specific
 channel command that is not contained in the revision selected by the
 driver.
=20
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

