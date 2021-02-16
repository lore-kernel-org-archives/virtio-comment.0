Return-Path: virtio-comment-return-1719-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B71369860DD
	for <virtio-comment@lists.oasis-open.org>; Tue, 16 Feb 2021 14:42:16 +0000 (UTC)
Date: Tue, 16 Feb 2021 15:42:04 +0100
From: Halil Pasic <pasic@linux.ibm.com>
Message-ID: <20210216154204.29ef3376.pasic@linux.ibm.com>
In-Reply-To: <20210216104728.1086055-1-cohuck@redhat.com>
References: <20210216104728.1086055-1-cohuck@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH] virtio-ccw: relax device requirement for
 revision-specific command rejection
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, 16 Feb 2021 11:47:28 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> The device is currently required to reject any command that is
> not contained in the negotiated revision. Some implementations
> did not actively check for the revision when processing a command;
> retroactively changing these implementations can break existing
> drivers.
>=20
> Relaxing the rejection requirement to SHOULD makes these existing
> device implementations compliant, and will not have any effect on
> drivers that did not send any commands for wrong revisions.
>=20
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/96
>=20
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Halil Pasic <pasic@linux.ibm.com>

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

