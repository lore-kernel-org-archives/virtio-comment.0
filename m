Return-Path: virtio-comment-return-1019-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99BF6985F8C
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Jan 2020 05:53:44 +0000 (UTC)
Date: Wed, 22 Jan 2020 00:53:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200122005225-mutt-send-email-mst@kernel.org>
References: <21D64D2457144C4AA23D071E2F6A51EC01592F5BFC@MXS01.open-synergy.com>
 <20200120111648-mutt-send-email-mst@kernel.org>
 <20200121160818.GE641751@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200121160818.GE641751@stefanha-x1.localdomain>
Subject: Re: [virtio-comment] Block Device VIRTIO_BLK_F_RO clarification
 needed.
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Damir Shaikhutdinov <Damir.Shaikhutdinov@opensynergy.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jan 21, 2020 at 04:08:18PM +0000, Stefan Hajnoczi wrote:
> On Mon, Jan 20, 2020 at 11:21:36AM -0500, Michael S. Tsirkin wrote:
> > On Mon, Jan 20, 2020 at 11:45:05AM +0000, Damir Shaikhutdinov wrote:
> > > Hello!
> > >=20
> > > While reading section 5.2 of the spec, I found that VIRTIO_BLK_F_RO f=
eature could use
> > > some additional clarification regarding handling requests when it was=
 offered.
> > >=20
> > > This RO feature is described as "Device is read only" (Section 5.2.3)=
. There are some explicit requirements for this feature, but they only desc=
ribe a "write request".
> > >=20
> > > 5.2.5 p3 says "If the VIRTIO_BLK_F_RO feature is set by the device, a=
ny write requests will fail."
> > >=20
> > > 5.2.6 says "The type of the request is either a read (VIRTIO_BLK_T_IN=
), a write (VIRTIO_BLK_T_OUT) ...", so "write request" mentioned in 5.2.5 p=
3 is VIRTIO_BLK_T_OUT.
> > >=20
> > > 5.2.6.2 says "A device MUST set the status byte to VIRTIO_BLK_S_IOERR=
 for a write request if the VIRTIO_BLK_F_RO
> > > feature if offered, and MUST NOT write any data."
> > >=20
> > > What is missing here is a requirement for features and other types of=
 requests in case of VIRTIO_BLK_F_RO:
> > >=20
> > > * config.writeback field (guarded by VIRTIO_BLK_F_CONFIG_WCE feature)
> > > * VIRTIO_BLK_T_ FLUSH (guarded by VIRTIO_BLK_F_FLUSH feature)
> > > * VIRTIO_BLK_T_DISCARD (guarded by VIRTIO_BLK_F_DISCARD feature)
> > > * VIRTIO_BLK_T_WRITE_ZEROES (guarded by VIRTIO_BLK_F_WRITE_ZEROES fea=
ture)
> > >=20
> > > Configuration field, requests and features described above make no se=
nse in presence of VIRTIO_BLK_F_RO.
> > >=20
> > > This can be clarified in several ways, for example:
> > >=20
> > > 1. Device should not offer CONFIG_WCE, FLUSH, DISCARD and WRITE_ZEROE=
S features if it offers RO feature (partially contradicts 5.2.5.2 "Device S=
HOULD always offer VIRTIO_BLK_F_FLUSH")
> > > 2. Device must set the status byte to IOERR for FLUSH, DISCARD and WR=
ITE_ZEROES requests if it offers RO feature.
> > >=20
> > >=20
> > > What do you think about that?
> >=20
> > I guess flush can even be allowed, it's harmless if nothing is written,
> > right?
>=20
> I agree.  There seems to be no benefit in failing it and there's a small
> chance that some drivers could get upset if it fails (typically when a
> common code path submits a flush request and expects it to succeed).
>=20
> > I agree DISCARD and WRITE_ZEROES must fail. And set VIRTIO_BLK_S_IOERR
> > I guess?
>=20
> Yes.
>=20
> > It's too late to disallow configurations such as a combination of VIRTI=
O_BLK_F_CONFIG_WCE
> > and VIRTIO_BLK_F_RO, devices out there might be setting this combinatio=
n.
>=20
> Yes.
>=20
> Stefan

Thanks! Stefan do you have the time to work on a spec patch to fix this?
Damir do you?

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

