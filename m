Return-Path: virtio-comment-return-1010-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F3132985EA2
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Jan 2020 16:21:51 +0000 (UTC)
Date: Mon, 20 Jan 2020 11:21:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200120111648-mutt-send-email-mst@kernel.org>
References: <21D64D2457144C4AA23D071E2F6A51EC01592F5BFC@MXS01.open-synergy.com>
MIME-Version: 1.0
In-Reply-To: <21D64D2457144C4AA23D071E2F6A51EC01592F5BFC@MXS01.open-synergy.com>
Subject: Re: [virtio-comment] Block Device VIRTIO_BLK_F_RO clarification
 needed.
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Damir Shaikhutdinov <Damir.Shaikhutdinov@opensynergy.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jan 20, 2020 at 11:45:05AM +0000, Damir Shaikhutdinov wrote:
> Hello!
>=20
> While reading section 5.2 of the spec, I found that VIRTIO_BLK_F_RO featu=
re could use
> some additional clarification regarding handling requests when it was off=
ered.
>=20
> This RO feature is described as "Device is read only" (Section 5.2.3). Th=
ere are some explicit requirements for this feature, but they only describe=
 a "write request".
>=20
> 5.2.5 p3 says "If the VIRTIO_BLK_F_RO feature is set by the device, any w=
rite requests will fail."
>=20
> 5.2.6 says "The type of the request is either a read (VIRTIO_BLK_T_IN), a=
 write (VIRTIO_BLK_T_OUT) ...", so "write request" mentioned in 5.2.5 p3 is=
 VIRTIO_BLK_T_OUT.
>=20
> 5.2.6.2 says "A device MUST set the status byte to VIRTIO_BLK_S_IOERR for=
 a write request if the VIRTIO_BLK_F_RO
> feature if offered, and MUST NOT write any data."
>=20
> What is missing here is a requirement for features and other types of req=
uests in case of VIRTIO_BLK_F_RO:
>=20
> * config.writeback field (guarded by VIRTIO_BLK_F_CONFIG_WCE feature)
> * VIRTIO_BLK_T_ FLUSH (guarded by VIRTIO_BLK_F_FLUSH feature)
> * VIRTIO_BLK_T_DISCARD (guarded by VIRTIO_BLK_F_DISCARD feature)
> * VIRTIO_BLK_T_WRITE_ZEROES (guarded by VIRTIO_BLK_F_WRITE_ZEROES feature=
)
>=20
> Configuration field, requests and features described above make no sense =
in presence of VIRTIO_BLK_F_RO.
>=20
> This can be clarified in several ways, for example:
>=20
> 1. Device should not offer CONFIG_WCE, FLUSH, DISCARD and WRITE_ZEROES fe=
atures if it offers RO feature (partially contradicts 5.2.5.2 "Device SHOUL=
D always offer VIRTIO_BLK_F_FLUSH")
> 2. Device must set the status byte to IOERR for FLUSH, DISCARD and WRITE_=
ZEROES requests if it offers RO feature.
>=20
>=20
> What do you think about that?

I guess flush can even be allowed, it's harmless if nothing is written,
right? I agree DISCARD and WRITE_ZEROES must fail. And set VIRTIO_BLK_S_IOE=
RR
I guess?

It's too late to disallow configurations such as a combination of VIRTIO_BL=
K_F_CONFIG_WCE
and VIRTIO_BLK_F_RO, devices out there might be setting this combination.

> With best regards,
> Damir Shaikhutdinov
>=20
> Please mind our privacy notice<https://www.opensynergy.com/datenschutzerk=
laerung/privacy-notice-for-business-partners-pursuant-to-article-13-of-the-=
general-data-protection-regulation-gdpr/> pursuant to Art. 13 GDPR. // Unse=
re Hinweise zum Datenschutz gem. Art. 13 DSGVO finden Sie hier.<https://www=
.opensynergy.com/de/datenschutzerklaerung/datenschutzhinweise-fuer-geschaef=
tspartner-gem-art-13-dsgvo/>
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

