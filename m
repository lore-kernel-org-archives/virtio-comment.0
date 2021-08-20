Return-Path: <virtio-comment-return-2239-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 25B65986497
	for <virtio-comment@lists.oasis-open.org>; Fri, 20 Aug 2021 07:59:39 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 20 Aug 2021 15:59:17 +0800
Message-Id: <20210820075920.42355-1-jasowang@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] [RFC PATCH 0/3] virtio-pci: management device
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
To: virtio-comment@lists.oasis-open.org
Cc: mst@redhat.com, cohuck@redhat.com, stefanha@redhat.com, mgurtovoy@nvidia.com, eperezma@redhat.com, lulu@redhat.com, lingshan.zhu@intel.com, zhengkuan.yh@alibaba-inc.com, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi all:

As promised, I post this series to demonstrate the possibility of
using a transport specific way for implementing the management
device. The main motivation is to achieve hyper scalability and
flexibility. This is an alternative way of transporting the
managed(virtual) device via the admin virtqueue (most of the admin
virtqueue commands proposed there were just a duplication of the
PCI capability).

The idea is simple, introduce a device selector and try to reuse as
much existing virtio-pci capabilities as possible.

In order to make this work, two independent capabilities are
introduced. A new capability for storing MSI-X message is introduced
for per-device MSI-X configuration for the managed device. PASID
capability is also introduced for DMA isolation among the managed
devices.

To be simple, I don't propose device MMU interface in this series. It
could be added in the future since it's not a must if PASID is
supported.

Sending this for early feedback and comments.

Thanks


Jason Wang (3):
  virtio-pci: introduce device specific MSI-X messages store
  virtio-pci: PASID support
  virtio-pci: introduce the management device capability

 content.tex | 202 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

--=20
2.24.3 (Apple Git-128)


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

