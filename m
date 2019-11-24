Return-Path: virtio-comment-return-932-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 06B87985A54
	for <virtio-comment@lists.oasis-open.org>; Sun, 24 Nov 2019 12:17:55 +0000 (UTC)
Date: Sun, 24 Nov 2019 07:17:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20191124071528-mutt-send-email-mst@kernel.org>
References: <2082409902.10853513.1574343487818.JavaMail.zimbra@redhat.com>
 <1094048041.10853770.1574343629558.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1094048041.10853770.1574343629558.JavaMail.zimbra@redhat.com>
Subject: Re: [virtio-comment] Question regarding packed ring Virtio 1.1
 feature
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Yuri Benditovich <ybendito@redhat.com>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Nov 21, 2019 at 08:40:29AM -0500, Yuri Benditovich wrote:
> Hi,
>=20
> From the spec it looks like the device must maintain backward compatibili=
ty
> with Virt 1.0 split queue implementation and use the packed one only when
> negotiated.
> What is the rational of such limitation, especially in case of true hardw=
are
> device?
>=20
> Thanks,
> Yuri Benditovich


I don't think that's intentional. Any device without a split queue
implementation will fail negotiation if PACKED_RING has not been
negotiated. It's more of a SHOULD since split ring support
allows backwards compatibility with deployed software.

--=20
MST


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

