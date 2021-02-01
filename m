Return-Path: virtio-comment-return-1702-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 01BEF9865D5
	for <virtio-comment@lists.oasis-open.org>; Mon,  1 Feb 2021 16:10:49 +0000 (UTC)
Date: Mon, 1 Feb 2021 17:10:38 +0100
From: Cornelia Huck <cohuck@redhat.com>
Message-ID: <20210201171038.29abfc1f.cohuck@redhat.com>
In-Reply-To: <a2b3d5e8-63ce-dbe9-0197-155f469a00e9@redhat.com>
References: <20210125055202.29001-1-jasowang@redhat.com>
	<20210127035117-mutt-send-email-mst@kernel.org>
	<e752ecaa-e04c-ecdc-3921-470942a71276@redhat.com>
	<20210129115737.77ea06c5.cohuck@redhat.com>
	<a2b3d5e8-63ce-dbe9-0197-155f469a00e9@redhat.com>
MIME-Version: 1.0
Subject: [virtio-comment] Re: [PATCH V2] virtio-net: introduce admin control virtqueue
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, 1 Feb 2021 11:42:31 +0800
Jason Wang <jasowang@redhat.com> wrote:

> On 2021/1/29 =E4=B8=8B=E5=8D=886:57, Cornelia Huck wrote:
> > On Thu, 28 Jan 2021 10:58:49 +0800
> > Jason Wang <jasowang@redhat.com> wrote:
> > =20
> >> On 2021/1/27 =E4=B8=8B=E5=8D=886:59, Michael S. Tsirkin wrote: =20
> >>> Thus, an idea. How about controlling features instead?
> >>>
> >>> And with that, the interface becomes generic and applicable
> >>> to all devices not just net ... =20
> >>
> >> Yes, so I think we probably need more than this e.g I had plan to
> >> introduce a general admin virtqueue which could be use to replace the
> >> transport specific way to configure/probe virtual devices. I think we
> >> can add this new features controlling command via that virtqueue.
> >>
> >> So if this makes sense. I will drop the trust command in this patch an=
d
> >> let admin cvq go first. Then I can post general admin virtqueue patch.
> >>
> >> Does this make sense? =20
> > So, you'd introduce a generic admin virtqueue and give individual
> > device types the possibility to use it for device type specific
> > commands? =20
>=20
>=20
> This is mainly for the trust command. The idea is to have a admin=20
> virtqueue that is used to manage the features that belongs to a virtual=
=20
> device. And in the admin virtqueue, we can introduce a command like:
>=20
> VIRTIO_ADMIN_CTRL_DEV_FEATURES
>=20
> that is used to control the features set of a specific virtual device.=20
> Then there's no need for a specialized trust command in the admin=20
> control vq for virtio-net.
>=20
> E.g we can filter out VIRTIO_NET_F_CTRL_MAC_ADDR if we don't want to set=
=20
> mac address via control virtqueue, then the virtual device can't see=20
> this feature via cvq (or admin cvq).

Ok, I think I have to see the result, but it seems workable.


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

