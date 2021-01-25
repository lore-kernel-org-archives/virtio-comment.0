Return-Path: virtio-comment-return-1672-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BA60C9861C0
	for <virtio-comment@lists.oasis-open.org>; Mon, 25 Jan 2021 11:08:37 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
Date: Mon, 25 Jan 2021 12:08:23 +0100
Message-Id: <20210125110823.591104-1-cohuck@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH v3] clarify device reset
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Jason Wang <jasowang@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Properly specify that the method for the driver to request a
device reset is transport specific, and some action the device
has to take.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---

RFC v2 -> v3:
  - re-worded the "must not send notifications" clause to avoid guessing
  - added a driver conformance clause on how a driver should find out
    when reset is complete
RFC -> RFC v2:
  - moved reset spec to basic facilities

---
 conformance.tex |  2 ++
 content.tex     | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/conformance.tex b/conformance.tex
index eb3324053080..21fe89ccd937 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -60,6 +60,7 @@ \section{Conformance Targets}\label{sec:Conformance / Con=
formance Targets}
 \begin{itemize}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device St=
atus Field}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Feature B=
its}
+\item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Re=
set}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Device Co=
nfiguration Space}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Virtqueue=
s}
 \item \ref{drivernormative:Basic Facilities of a Virtio Device / Message F=
raming}
@@ -271,6 +272,7 @@ \section{Conformance Targets}\label{sec:Conformance / C=
onformance Targets}
 \begin{itemize}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device St=
atus Field}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Feature B=
its}
+\item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Re=
set}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Device Co=
nfiguration Space}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Message F=
raming}
 \item \ref{devicenormative:Basic Facilities of a Virtio Device / Virtqueue=
s / The Virtqueue Descriptor Table}
diff --git a/content.tex b/content.tex
index 620c0e28c9a7..9cdefe16509e 100644
--- a/content.tex
+++ b/content.tex
@@ -193,6 +193,25 @@ \section{Notifications}\label{sec:Basic Facilities of =
a Virtio Device
 terminology. Occasionally, the term event is used to refer to
 a notification or a receipt of a notification.
=20
+\section{Device Reset}\label{sec:Basic Facilities of a Virtio Device / Dev=
ice Reset}
+
+The driver may initiate a device reset at various times; notably, during
+device initialization and device cleanup.
+
+The mechanism used by the driver to initiate the reset is transport specif=
ic.
+
+\devicenormative{\subsection}{Device Reset}{Basic Facilities of a Virtio D=
evice / Device Reset}
+
+A device MUST reinitialize device status to 0 after receiving a reset.
+
+A device MUST NOT send notifications after indicating completion of
+the reset by reinitializing the device status to 0.
+
+\drivernormative{\subsection}{Device Reset}{Basic Facilities of a Virtio D=
evice / Device Reset}
+
+The driver SHOULD consider a driver-initiated reset complete when it
+reads the device status as 0.
+
 \section{Device Configuration Space}\label{sec:Basic Facilities of a Virti=
o Device / Device Configuration Space}
=20
 Device configuration space is generally used for rarely-changing or
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

