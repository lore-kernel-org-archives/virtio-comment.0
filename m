Return-Path: virtio-comment-return-1388-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BE2E3984A05
	for <virtio-comment@lists.oasis-open.org>; Mon, 10 Aug 2020 14:34:49 +0000 (UTC)
Date: Mon, 10 Aug 2020 10:34:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200810103421-mutt-send-email-mst@kernel.org>
References: <20200527090707.75747-1-epetre@amazon.com>
 <dbca5c9e-8809-f121-1e08-441b4800ab09@amazon.com>
 <20200720130948-mutt-send-email-mst@kernel.org>
 <b55091ce-686f-02ac-42d0-b794a95e1c63@amazon.com>
 <97eafeaa-7897-39b7-10fb-5ffed2298b00@amazon.de>
MIME-Version: 1.0
In-Reply-To: <97eafeaa-7897-39b7-10fb-5ffed2298b00@amazon.de>
Subject: Re: [virtio-comment] Re: [PATCH v2] content: Reserve virtio-nsm
 device ID
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
To: Alexander Graf <graf@amazon.de>
Cc: "Eftime, Petre" <epetre@amazon.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Aug 10, 2020 at 04:06:26PM +0200, Alexander Graf wrote:
>=20
>=20
> On 21.07.20 13:23, Eftime, Petre wrote:
> > On 2020-07-20 20:10, Michael S. Tsirkin wrote:
> > > On Wed, Jun 10, 2020 at 04:17:25PM +0300, Eftime, Petre wrote:
> > > > On 2020-05-27 12:07, Petre Eftime wrote:
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 The NitroSecureModule is a device with a v=
ery stripped down
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 Trusted Platform Module functionality, whi=
ch is used in the
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 context of a Nitro Enclave (see
> > > > https://lkml.org/lkml/2020/4/21/1020)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 to provide boot time measurement and attes=
tation.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 Since this device provides some critical c=
ryptographic operations,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 there are a series of operations which are=
 required to have
> > > > guarantees
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 of atomicity, ordering and consistency: op=
erations fully
> > > > succeed or fully
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 fail, including when some external events =
might interfere in the
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 process: live migration, crashes, etc; any=
 failure in the critical
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 section requires termination of the enclav=
e it is attached to, so
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 the device needs to be as resilient as pos=
sible, simplicity is
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 strongly desired.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 To account for that, the device and driver=
 are made to have
> > > > very few
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 error cases in the critical path and the o=
perations
> > > > themselves can be
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 rolled back and retried if events happen o=
utside the critical
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 area, while processing a request. The driv=
er itself can be
> > > > made very
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 simple and thus is easily portable.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 Since the requests can be handled directly=
 in the virtio
> > > > queue, serving
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 most requests requires no additional buffe=
ring or memory
> > > > allocations
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 on the host side.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Petre Eftime <epetre@amazon=
.com>
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 ---
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 content.tex | 2 ++
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 file changed, 2 insertions(+)
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 diff --git a/content.tex b/content.tex
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 index 91735e3..66c8f2b 100644
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 --- a/content.tex
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 +++ b/content.tex
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 @@ -2801,6 +2801,8 @@ \chapter{Device
> > > > Types}\label{sec:Device Types}
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \hline
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &=C2=A0=C2=A0 Video decoder device \\
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \hline
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 +33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &=C2=A0=C2=A0 NitroSecureModule \\
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 +\hline
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \end{tabular}
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Some of the devices above are unspec=
ified by this document,
> > > >=20
> > > > Hi all,
> > > >=20
> > > > I've opened a corresponding issue on Github.
> > > >=20
> > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/81
> > > >=20
> > > > Thank you,
> > > > Petre Eftime
> > >=20
> > > Looks like no one minds. Do you want the TC to vote on this?
> > >=20
> > Yes, would help us get started towards upstreaming the Linux driver for
> > this.
>=20
> So what is the next step to get the vote happening? :)
>=20
>=20
> Alex
>=20

Missed the answer, sorry.  Started vote now.

>=20
> Amazon Development Center Germany GmbH
> Krausenstr. 38
> 10117 Berlin
> Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
> Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
> Sitz: Berlin
> Ust-ID: DE 289 237 879
>=20
>=20


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

