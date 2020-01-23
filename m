Return-Path: virtio-comment-return-1026-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 91CEE986037
	for <virtio-comment@lists.oasis-open.org>; Thu, 23 Jan 2020 11:08:34 +0000 (UTC)
From: Damir Shaikhutdinov <Damir.Shaikhutdinov@opensynergy.com>
Date: Thu, 23 Jan 2020 11:08:27 +0000
Message-ID: <21D64D2457144C4AA23D071E2F6A51EC01592FAF68@MXS02.open-synergy.com>
References: <21D64D2457144C4AA23D071E2F6A51EC01592F5BFC@MXS01.open-synergy.com>
 <20200120111648-mutt-send-email-mst@kernel.org>
 <20200121160818.GE641751@stefanha-x1.localdomain>
 <20200122005225-mutt-send-email-mst@kernel.org>,<20200122101214.GA655761@stefanha-x1.localdomain>
In-Reply-To: <20200122101214.GA655761@stefanha-x1.localdomain>
Content-Language: en-US
MIME-Version: 1.0
Subject: RE: [virtio-comment] Block Device VIRTIO_BLK_F_RO clarification
 needed.
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

Hi Stefan and Michael!

I have time to prepare the spec patch and will work on it.

Damir Shaikhutdinov
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin

Phone: +49 30 60 98 54 0.
Fax:      +49 30 60 98 54 0 -99
EMail:   damir.shaikhutdinov@opensynergy.com

www.opensynergy.com

Handelsregister/Commercial Registry: Amtsgericht Charlottenburg, HRB 108616=
B
Gesch=E4ftsf=FChrer/Managing Director: Regis Adjamah

________________________________________
From: Stefan Hajnoczi [stefanha@redhat.com]
Sent: Wednesday, January 22, 2020 11:12 AM
To: Michael S. Tsirkin
Cc: Damir Shaikhutdinov; virtio-comment@lists.oasis-open.org
Subject: Re: [virtio-comment] Block Device VIRTIO_BLK_F_RO clarification ne=
eded.

On Wed, Jan 22, 2020 at 12:53:37AM -0500, Michael S. Tsirkin wrote:
> On Tue, Jan 21, 2020 at 04:08:18PM +0000, Stefan Hajnoczi wrote:
> > On Mon, Jan 20, 2020 at 11:21:36AM -0500, Michael S. Tsirkin wrote:
> > > On Mon, Jan 20, 2020 at 11:45:05AM +0000, Damir Shaikhutdinov wrote:
> > > > Hello!
> > > >
> > > > While reading section 5.2 of the spec, I found that VIRTIO_BLK_F_RO=
 feature could use
> > > > some additional clarification regarding handling requests when it w=
as offered.
> > > >
> > > > This RO feature is described as "Device is read only" (Section 5.2.=
3). There are some explicit requirements for this feature, but they only de=
scribe a "write request".
> > > >
> > > > 5.2.5 p3 says "If the VIRTIO_BLK_F_RO feature is set by the device,=
 any write requests will fail."
> > > >
> > > > 5.2.6 says "The type of the request is either a read (VIRTIO_BLK_T_=
IN), a write (VIRTIO_BLK_T_OUT) ...", so "write request" mentioned in 5.2.5=
 p3 is VIRTIO_BLK_T_OUT.
> > > >
> > > > 5.2.6.2 says "A device MUST set the status byte to VIRTIO_BLK_S_IOE=
RR for a write request if the VIRTIO_BLK_F_RO
> > > > feature if offered, and MUST NOT write any data."
> > > >
> > > > What is missing here is a requirement for features and other types =
of requests in case of VIRTIO_BLK_F_RO:
> > > >
> > > > * config.writeback field (guarded by VIRTIO_BLK_F_CONFIG_WCE featur=
e)
> > > > * VIRTIO_BLK_T_ FLUSH (guarded by VIRTIO_BLK_F_FLUSH feature)
> > > > * VIRTIO_BLK_T_DISCARD (guarded by VIRTIO_BLK_F_DISCARD feature)
> > > > * VIRTIO_BLK_T_WRITE_ZEROES (guarded by VIRTIO_BLK_F_WRITE_ZEROES f=
eature)
> > > >
> > > > Configuration field, requests and features described above make no =
sense in presence of VIRTIO_BLK_F_RO.
> > > >
> > > > This can be clarified in several ways, for example:
> > > >
> > > > 1. Device should not offer CONFIG_WCE, FLUSH, DISCARD and WRITE_ZER=
OES features if it offers RO feature (partially contradicts 5.2.5.2 "Device=
 SHOULD always offer VIRTIO_BLK_F_FLUSH")
> > > > 2. Device must set the status byte to IOERR for FLUSH, DISCARD and =
WRITE_ZEROES requests if it offers RO feature.
> > > >
> > > >
> > > > What do you think about that?
> > >
> > > I guess flush can even be allowed, it's harmless if nothing is writte=
n,
> > > right?
> >
> > I agree.  There seems to be no benefit in failing it and there's a smal=
l
> > chance that some drivers could get upset if it fails (typically when a
> > common code path submits a flush request and expects it to succeed).
> >
> > > I agree DISCARD and WRITE_ZEROES must fail. And set VIRTIO_BLK_S_IOER=
R
> > > I guess?
> >
> > Yes.
> >
> > > It's too late to disallow configurations such as a combination of VIR=
TIO_BLK_F_CONFIG_WCE
> > > and VIRTIO_BLK_F_RO, devices out there might be setting this combinat=
ion.
> >
> > Yes.
> >
> > Stefan
>
> Thanks! Stefan do you have the time to work on a spec patch to fix this?
> Damir do you?

Damir, you can find instructions for contributing to the virtio
specification here:

https://github.com/oasis-tcs/virtio-spec/

If you don't have time to write a patch please let me know.

Stefan

Please mind our privacy notice<https://www.opensynergy.com/datenschutzerkla=
erung/privacy-notice-for-business-partners-pursuant-to-article-13-of-the-ge=
neral-data-protection-regulation-gdpr/> pursuant to Art. 13 GDPR. // Unsere=
 Hinweise zum Datenschutz gem. Art. 13 DSGVO finden Sie hier.<https://www.o=
pensynergy.com/de/datenschutzerklaerung/datenschutzhinweise-fuer-geschaefts=
partner-gem-art-13-dsgvo/>


[tech_days_munchen]

OpenSynergy TechDay M=FCnchen

am 11. Februar 2020, ab 12:00Uhr, im Studio Balan, Moosacherstr. 86.

Anmeldung bitte hier<mailto:sabine.mutumba@opensynergy.com>

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

