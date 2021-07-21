Return-Path: <virtio-comment-return-2033-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9CF7C986312
	for <virtio-comment@lists.oasis-open.org>; Wed, 21 Jul 2021 21:00:07 +0000 (UTC)
From: tstark@linux.microsoft.com
Date: Wed, 21 Jul 2021 13:59:38 -0700
Message-Id: <20210721205939.20746-1-tstark@linux.microsoft.com>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH 0/1] virtio-pmem: Support PCI BAR-relative addresses
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: grahamwo@microsoft.com, benhill@microsoft.com, mst@redhat.com, pankaj.gupta@ionos.com, Taylor Stark <tstark@microsoft.com>
List-ID: <virtio-comment.lists.oasis-open.org>

From: Taylor Stark <tstark@microsoft.com>

This patch updates the virtio-pmem spec to add support for describing the p=
mem
region via PCI BARs. This is required to support virtio-pmem in Hyper-V, si=
nce
Hyper-V only allows PCI devices to operate on memory ranges defined via BAR=
s.

As virtio-pmem hasn't been added to the virtio spec yet (see this issue [1]=
),
this patch is based off the RFC spec [2]. The linux driver implementation h=
as
been posted at [3].

[1] https://github.com/oasis-tcs/virtio-spec/issues/78
[2] https://lists.oasis-open.org/archives/virtio-dev/201903/msg00083.html
[3] https://lore.kernel.org/nvdimm/20210715223505.GA29329@linuxonhyperv3.gu=
j3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net

<Apologies for the resend - forgot to subscribe to virtio-comment so my ori=
ginal mail bounced>

Taylor Stark (1):
  virtio_pmem: Support PCI BAR-relative addresses

 virtio-pmem.tex | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

--=20
2.31.0.vfs.0.1


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

