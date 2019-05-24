Return-Path: virtio-comment-return-734-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DDD27985FC8
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 May 2019 03:40:02 +0000 (UTC)
Date: Thu, 23 May 2019 23:39:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190523233937-mutt-send-email-mst@kernel.org>
References: <1556d65b-a036-491d-dae9-360e14fb5eb4@univention.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1556d65b-a036-491d-dae9-360e14fb5eb4@univention.de>
Subject: Re: [virtio-comment] [ERRATUM?] 5.5.6.3 Memory Statistics: 6 -> 10
 byte
To: Philipp Hahn <hahn@univention.de>
Cc: virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, May 23, 2019 at 02:51:48PM +0200, Philipp Hahn wrote:
> Hello,
>=20
> quoting
> <https://docs.oasis-open.org/virtio/virtio/v1.1/cs01/virtio-v1.1-cs01.htm=
l#x1-2930003>:
>=20
> > Within the buffer, statistics are an array of 6-byte entries.=20
>                                                 ^
> > Each statistic consists of a 16 bit tag and a 64 bit value.
> ...
> > struct virtio_balloon_stat {=20
> ...
> >         le16 tag;=20
> >         le64 val;=20
> > } __attribute__((packed));
>=20
> If my calculation is right that is a (16 + 64) =3D 80 bits which is a
> 10-byte sized entry - not 6-byte.
>=20
> Philipp


Agreed. Want to open a github issue?

> --=20
> Philipp Hahn
> Open Source Software Engineer
>=20
> Univention GmbH
> be open.
> Mary-Somerville-Str. 1
> D-28359 Bremen
> Tel.: +49 421 22232-0
> Fax : +49 421 22232-99
> hahn@univention.de
>=20
> http://www.univention.de/
> Gesch=E4ftsf=FChrer: Peter H. Ganten
> HRB 20755 Amtsgericht Bremen
> Steuer-Nr.: 71-597-02876
>=20
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>=20
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>=20
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/

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

