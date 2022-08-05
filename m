Return-Path: <virtio-comment-return-3326-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E44998649D
	for <virtio-comment@lists.oasis-open.org>; Fri,  5 Aug 2022 10:02:30 +0000 (UTC)
From: Zhu Lingshan <lingshan.zhu@intel.com>
Date: Fri,  5 Aug 2022 17:53:39 +0800
Message-Id: <20220805095343.486546-1-lingshan.zhu@intel.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH V3 RESEND 0/4] Introduce virtio transport virtqueue
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: jasowang@redhat.com, mst@redhat.com, cohuck@redhat.com, sgarzare@redhat.com, stefanha@redhat.com, nrupal.jani@intel.com, Piotr.Uminski@intel.com, hang.yuan@intel.com
Cc: virtio-comment@lists.oasis-open.org, Zhu Lingshan <lingshan.zhu@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

This series introduces virtio transport virtqueue as a new
transport layer for virtio devices.

This series defines the concepts of virtio management device
and virtio managed devices.

This series also defines a commands set over the transport virtqueue,
including:
The command to query available resources of the management device
The commands to create / destroy the managed devices.
The commands to config the managed devices.
The commands to config virtqueues of the managed devices.

Changes from V2:
1)Drop Feature bit VIRTIO_F_TRANSPT_VQ_MDEV (Michael)
2)Extend the feature bits to 128 bits as required in section 2.2 Feature Bi=
ts (Michael)
3)Explicit describes the feature bit VIRTIO_F_TRANSPT_VQ should be negotiat=
ed with the management device for the commands (Michael)
4)Removed MSI mask / unmask commands (Michael)
5)Add commands to get MSI entries of vqs and config space (Michael)
6)Add a description on the behaviors when disable a MSI (Michael)
7)Removed the section =E2=80=9CManagement device discovery=E2=80=9D (Michae=
l)
8)Remove pre-created managed devices, it is totally depending on the HW imp=
lementation (Michael)
9)Detailed descriptions for VIRITO DEVICE ID in the creation command (Micha=
el)
10)Better device requirements for the device config space generation (Micha=
el)
11)Re-use struct transportq_ctrl_packed_vq_state{} for both packed vq state=
 set/get (Michael)

Changes form V1:
1)Add a command to set per-vq asid(Jason)
2)Add a command to reset a virtqueue(Jason)
3)Add support for packed virtqueue state(Jason)
4)Allow nested managed devices(Jason)
5)Provides device feature bits in the provisioning(Jason)
6)Removed most of the error codes, only left OK and ERR(Jason)
7)=E2=80=9Cvirtual devices=E2=80=9D is renamed to =E2=80=9Cmanaged devices=
=E2=80=9D, to be more general(Jason)

Zhu Lingshan (4):
  Introduce virito transport virtqueue
  Introduce the commands set of the transport vq
  Describe the process to present a managed device
  Add transport vq number for virtio blk and net

 content.tex      | 760 +++++++++++++++++++++++++++++++++++++++++++++++
 introduction.tex |   3 +
 2 files changed, 763 insertions(+)

--=20
2.35.3


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

