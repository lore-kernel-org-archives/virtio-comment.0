Return-Path: <virtio-comment-return-2602-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C617D98654E
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Jan 2022 10:47:18 +0000 (UTC)
Date: Thu, 20 Jan 2022 05:47:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20220120054600-mutt-send-email-mst@kernel.org>
References: <20211210125329.72786-1-helei.sig11@bytedance.com>
 <20211210125329.72786-2-helei.sig11@bytedance.com>
 <21FD1647-957D-4841-A54E-7D44EFE638B9@bytedance.com>
 <20220119100712-mutt-send-email-mst@kernel.org>
 <3bc3a06782b943e8a43b07954ba328fd@huawei.com>
 <20220120022531-mutt-send-email-mst@kernel.org>
 <46e69803beeb4741a33c89e2351370ab@huawei.com>
MIME-Version: 1.0
In-Reply-To: <46e69803beeb4741a33c89e2351370ab@huawei.com>
Subject: [virtio-comment] Re: [V3 PATCH 1/1] virtio-crypto: introduce akcipher service
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>
Cc: =?utf-8?B?5L2V56OK?= <helei.sig11@bytedance.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "pizhenwei@bytedance.com" <pizhenwei@bytedance.com>, "xin.zeng@intel.com" <xin.zeng@intel.com>
List-ID: <virtio-comment.lists.oasis-open.org>

On Thu, Jan 20, 2022 at 08:12:49AM +0000, Gonglei (Arei) wrote:
>=20
>=20
> > -----Original Message-----
> > From: Michael S. Tsirkin [mailto:mst@redhat.com]
> > Sent: Thursday, January 20, 2022 3:27 PM
> > To: Gonglei (Arei) <arei.gonglei@huawei.com>
> > Cc: =E4=BD=95=E7=A3=8A <helei.sig11@bytedance.com>; virtio-comment@list=
s.oasis-open.org;
> > pizhenwei@bytedance.com; xin.zeng@intel.com
> > Subject: Re: [V3 PATCH 1/1] virtio-crypto: introduce akcipher service
> >=20
> > On Thu, Jan 20, 2022 at 05:48:09AM +0000, Gonglei (Arei) wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Michael S. Tsirkin [mailto:mst@redhat.com]
> > > > Sent: Wednesday, January 19, 2022 11:17 PM
> > > > To: =E4=BD=95=E7=A3=8A <helei.sig11@bytedance.com>
> > > > Cc: virtio-comment@lists.oasis-open.org; pizhenwei@bytedance.com;
> > > > xin.zeng@intel.com; Gonglei (Arei) <arei.gonglei@huawei.com>
> > > > Subject: Re: [V3 PATCH 1/1] virtio-crypto: introduce akcipher
> > > > service
> > > >
> > > > On Tue, Jan 11, 2022 at 11:14:27AM +0800, =E4=BD=95=E7=A3=8A wrote:
> > > > > Hello virtio community,
> > > > >
> > > > >         I=E2=80=99d like to request the TC vote on resolving the =
follow issue:
> > > > > =09Enhancement: https://github.com/oasis-tcs/virtio-spec/issues/1=
29
> > > >
> > > > Does not look like we have a lot of response with this, and it seem=
s
> > > > risky to add this now since spec freeze is imminent.
> > > > I think the right way to do it is to submit the supporting patches
> > > > to the linux kernel and probably qemu.
> > > > A bunch of crypto experts on the linux mailing list.
> > > >
> > > > In particular I note that virtio crypto already has a ton of
> > > > features that don't seem to be supported by the linux driver or
> > > > qemu.  Kind of reluctant to add more without some review from devel=
opers
> > implementing this.
> > > >
> > > >
> > > Hi Michael,
> > >
> > > I can't agree more with you. Eg. the virtio crypto doesn't support
> > > stateless mode currently in linux and qemu upstream lthough this
> > > virtio crypto spec already supports. If we expand the specification i=
n firstly, it
> > may make it more difficult to maintain in the future.
> > >
> > > Regards,
> > > -Gonglei
> >=20
> >=20
> > So what's the plan with stateless btw? why isn't it used? is it complet=
ely useless?
> > why do we have it in the spec?
> >=20
>=20
> The stateless mode is valuable in short connection encryption scenarios.=
=20
> It does not need to create sessions which is proposed by Stefan IIRC.=20
>=20
> Actually, we completed a demo before, but the demo was not pushed to the =
community=20
> due to other arrangements in the company projects. When we find a gap, we=
'll push it again. :)
>=20
> Regards,
> -Gonglei

Right. IOW it was added to spec too early. Can you review the
akcipher spec proposal meanwhile?

--=20
MST


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

