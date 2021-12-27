Return-Path: <virtio-comment-return-2468-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 06F05986238
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Dec 2021 09:38:48 +0000 (UTC)
From: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"
	<longpeng2@huawei.com>
Date: Mon, 27 Dec 2021 09:38:41 +0000
Message-ID: <2be7836713cc4d06ba24b86d21d18094@huawei.com>
References: <20211209140543.1876-1-longpeng2@huawei.com>
 <d09a2b0c1cee4d2180b33c452a42794c@huawei.com>
 <20211227031128-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211227031128-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Subject: [virtio-comment] RE: [PATCH] content: reserve virtio device ID for QingTian Box
 devices
Content-Language: zh-CN
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>



> -----Original Message-----
> From: Michael S. Tsirkin [mailto:mst@redhat.com]
> Sent: Monday, December 27, 2021 4:15 PM
> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> <longpeng2@huawei.com>
> Cc: Gonglei (Arei) <arei.gonglei@huawei.com>;
> virtio-comment@lists.oasis-open.org
> Subject: Re: [PATCH] content: reserve virtio device ID for QingTian Box d=
evices
>=20
> On Thu, Dec 23, 2021 at 02:49:25PM +0000, Longpeng (Mike, Cloud Infrastru=
cture
> Service Product Dept.) wrote:
> > Hi Michael,
> >
> > Is there anything else I need to do to reserve the device id?
>=20
> OK, I see the issue was created. I think it makes sense to wait
> until Jan 3 with the vote since lots of people are on
> vacation.
>=20

Ok, thanks.

> Meanwhile - are there plans to add this device to the spec eventually?
> Can you share a bit more of what it does?
>=20

We want to carve out some resources (e.g. vcpu, mem, pci_dev) from the user=
's=20
VM and then use these resources to start a sandbox for the user. The usage=
=20
quite likes the software enclave which Nitro already supported, but we have=
=20
much wider usage, for example, running unikernel + app (e.g. OSV + Redis) i=
n=20
the sandbox, it would provide much better performance than the traditional =
os.


> > > -----Original Message-----
> > > From: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > > Sent: Thursday, December 9, 2021 10:06 PM
> > > To: virtio-comment@lists.oasis-open.org
> > > Cc: Gonglei (Arei) <arei.gonglei@huawei.com>; Longpeng (Mike, Cloud
> > > Infrastructure Service Product Dept.) <longpeng2@huawei.com>
> > > Subject: [PATCH] content: reserve virtio device ID for QingTian Box d=
evices
> > >
> > > From: Longpeng <longpeng2@huawei.com>
> > >
> > > Huawei Cloud is one of the famous public cloud providers, and its
> > > hypervisor is named QingTian. We plan to support the QingTian Box
> > > that provides some guest-aware features ( for high performance,
> > > security, etc. ) in the future, and at least one of them is already
> > > in development. It needs data transmission based on the Virtio, so
> > > we want to reserve a device id ( 43 ) for the QingTian Box.
> > >
> > > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > > ---
> > >  content.tex | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/content.tex b/content.tex
> > > index 899df5f..2a6f9de 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -2893,6 +2893,8 @@ \chapter{Device Types}\label{sec:Device Types}
> > >  \hline
> > >  42         &   RDMA device \\
> > >  \hline
> > > +43         &   QingtianBox \\
> > > +\hline
> > >  \end{tabular}
> > >
> > >  Some of the devices above are unspecified by this document,
> > > --
> > > 1.8.3.1


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

