Return-Path: <virtio-comment-return-3455-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 683D098653D
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Oct 2022 07:45:46 +0000 (UTC)
From: Baptiste Afsa <baptiste.afsa@harman.com>
Date: Thu, 13 Oct 2022 09:45:13 +0200
Message-ID: <20221013074513.25141-1-baptiste.afsa@harman.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH] Introduce VIRTIO_F_ISOLATE_INDIRECT_DESC feature
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: Baptiste Afsa <baptiste.afsa@harman.com>
List-ID: <virtio-comment.lists.oasis-open.org>

When negotiated, this feature bit serves two purposes:

  - It instructs the driver to allocate every indirect descriptor on its
    own dedicated memory pages. A single memory page must only hold data
    for exactly one indirect descriptor.

  - It allows the host to unmap these pages from the guest address space
    while the indirect descriptor is available to the device.

This feature may cause extra memory consumption on the guest side but is
particularly helpful to support the memory isolation scheme described
below. However, note that this feature is not limited to this specific
use case and other applications may be considered.

The main idea is to keep the memory of the VM that runs the driver
isolated from the memory that runs the device, while still allowing
zero-copy transfers between the two domains. The virtio buffers are
mapped dynamically in the host address space by the hypervisor.

In this model, the virtqueues shared with the device are not the
original virtqueues allocated by the driver but a copy maintained by the
hypervisor. The hypervisor copies the descriptors from the driver
virtqueues to these second virtqueues when the descriptors are made
available to the device, along with mapping the I/O buffers to the
device VM address space.

The use of this second set of virtqueues avoids the device the need to
verify that the buffers are actually accessible to the device since the
driver cannot update these copies.

Dealing with indirect descriptors in this model brings additional issues
because the hypervisor needs to grant the device access to both the
indirect descriptor table and all the I/O buffers pointed to by this
table. However, a compromised guest can modify the table while the
device is using it, which may lead to faults in the device.

This problem could be solved by creating a copy of the indirect
descriptor table as it is done with other descriptors but this approach
requires some sort of dynamic memory allocation in the hypervisor, which
might be problematic depending on the situation.

Using the VIRTIO_F_ISOLATE_INDIRECT_DESC feature allows the hypervisor
to unmap the indirect descriptor table from the guest address space
while the indirect descriptor is on the device side and guarantees that
it will not be modified while the device is using it.
---
 content.tex | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/content.tex b/content.tex
index e863709..20e17b7 100644
--- a/content.tex
+++ b/content.tex
@@ -6944,6 +6944,23 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved F=
eature Bits}
   that the driver can reset a queue individually.
   See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueu=
e Reset}.
=20
+  \item[VIRTIO_F_ISOLATE_INDIRECT_DESC(41)] This feature indicates that th=
e
+  device requires the driver to allocate each indirect descriptor on its o=
wn
+  dedicated memory pages which MUST NOT hold any other data than this indi=
rect
+  descriptor.
+
+  This allows the host to unmap these pages from the guest address space w=
hile
+  the indirect descriptors are available to the device. The device
+  implementation is therefore guaranteed that the driver cannot tampered w=
ith an
+  indirect descriptor table while the device is using it.
+
+  This mechanism notably allows to implement a memory isolation scheme whe=
re the
+  virtio buffers are shared dynamically between the host and the guest as =
they
+  are exchanged through the virtqueues. It permits the host to share indir=
ect
+  descriptor tables and all the associated buffers as is, without the need=
 for
+  the device to verify that the buffers referenced in an indirect descript=
or
+  table are actually accessible to the device.
+
 \end{description}
=20
 \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
@@ -6980,6 +6997,12 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved F=
eature Bits}
=20
 A driver SHOULD accept VIRTIO_F_NOTIF_CONFIG_DATA if it is offered.
=20
+A driver SHOULD accept VIRTIO_F_ISOLATE_INDIRECT_DESC if it is offered. If
+VIRTIO_F_ISOLATE_INDIRECT_DESC has been negotiated, a driver MUST NOT acce=
ss the
+memory pages that contain an indirect descriptor after the indirect descri=
ptor
+has been made available to the device and before it is returned as used,
+otherwise the resulting behavior is undefined.
+
 \devicenormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
=20
 A device MUST offer VIRTIO_F_VERSION_1.  A device MAY fail to operate furt=
her
@@ -7009,6 +7032,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Fe=
ature Bits}
 and presents a PCI SR-IOV capability structure, otherwise
 it MUST NOT offer VIRTIO_F_SR_IOV.
=20
+A device MAY fail to operate further if VIRTIO_F_ISOLATE_INDIRECT_DESC is =
not
+accepted.
+
 \section{Legacy Interface: Reserved Feature Bits}\label{sec:Reserved Featu=
re Bits / Legacy Interface: Reserved Feature Bits}
=20
 Transitional devices MAY offer the following:
--=20
2.38.0


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

