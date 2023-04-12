Return-Path: <virtio-comment-return-5440-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37285C77B6E
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:38:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 97BDC26A5A
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:38:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7AC0E986512
	for <virtio-comment@archiver.kernel.org>; Wed, 12 Apr 2023 05:38:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 72CFD986509; Wed, 12 Apr 2023 05:38:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 609DD98650E
	for <virtio-comment@lists.oasis-open.org>; Wed, 12 Apr 2023 05:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: TWHmTRZPNh-gkyhWoPefUw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681277891; x=1683869891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMwLQDRAHGf++cJcJ+1K7gQL0+Ucp6U72qMsCb3eKxg=;
        b=7/CwZ/c242MqOlOkIy585zO7skFkQlHSa390GZ7VKiAku1iIUu46hj+UGG5PTHbjR1
         AItWMmWS6bIb93O0GPZY4vuCiPUvPMfvnABTI/mq+YA39GGptldQAbQp9PMYvF3kIkNV
         +sOq0PV4caiHVHvHfko3uYFeckRv3J2oKXGR8v/9zoujOu7a06maL9G0tChgf44MqLN4
         jkfeGXvi+doiSMOHWJ/fk0VcTU42Y2wANgDYvV2xliW6z+1e3TnViSXaDWSh7SwGWLk4
         s+vLQg6U4PSv6OXTG3ztwqcLKzgPmJcubCMP1OEQQ2fOdPTjFFQ+uap0qy/gBFPwD62s
         g6FQ==
X-Gm-Message-State: AAQBX9f0I5BFYBWw4j6Vfwoa8WfEKJHYXstg/tu+TkPzCYxYiIBGYqVW
	Yxu5Ukkpb7msvaotXe0px59GUSzbOHOz+ENggqsoIaaZO0bycUhWFVX+C0PexWXNbXnOcU8Yi7L
	oq6GfhJjs1upKo6QNLFlVA+rHzF0MmeqlaoS+k/USD+AzVdUapQ==
X-Received: by 2002:aca:2105:0:b0:37f:ab56:ff42 with SMTP id 5-20020aca2105000000b0037fab56ff42mr1295136oiz.9.1681277891326;
        Tue, 11 Apr 2023 22:38:11 -0700 (PDT)
X-Google-Smtp-Source: AKy350b3RtNrRrmrlXKpuQK6FqwWrL8TbPgPSZk2+gG9kuoWZrKAD5v3wZm3VSn6LZsYtSmF6/6OpBNMCdU87YY6UAU=
X-Received: by 2002:aca:2105:0:b0:37f:ab56:ff42 with SMTP id
 5-20020aca2105000000b0037fab56ff42mr1295129oiz.9.1681277891065; Tue, 11 Apr
 2023 22:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230330225834.506969-1-parav@nvidia.com> <20230330225834.506969-9-parav@nvidia.com>
 <CACGkMEtMOy4B-O-52ka+9P3OBQ_hs1KvdjWodNYg-XKLff+giw@mail.gmail.com>
 <307a9f8f-6184-0403-97ab-1b1c16d4fd3c@nvidia.com> <CACGkMEucOwwFDMqyWA+DgYV7X=9f5-P4Ba_AP=5kTsjna=n+7A@mail.gmail.com>
 <PH0PR12MB548194B46A3E32329C10D00EDC9A9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230411172207-mutt-send-email-mst@kernel.org> <CACGkMEsSxnn0+T6ng99HV-PwA3kEe6J050GNDKJjcjBQfQxbfA@mail.gmail.com>
 <20230412001803-mutt-send-email-mst@kernel.org> <CACGkMEtfFsiNVesHU=TWWPgDBzXw_49xrYujb42egMJPZg8__Q@mail.gmail.com>
 <20230412012356-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230412012356-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 12 Apr 2023 13:37:59 +0800
Message-ID: <CACGkMEuFtgw4E3ZORp+cKEZi_sf8m99Vn-JTeX=XuY3P7oNt9w@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>, 
	Satananda Burla <sburla@marvell.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [virtio-dev] [PATCH 08/11] transport-pci:
 Introduce virtio extended capability

On Wed, Apr 12, 2023 at 1:25=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Wed, Apr 12, 2023 at 12:53:52PM +0800, Jason Wang wrote:
> > On Wed, Apr 12, 2023 at 12:20=E2=80=AFPM Michael S. Tsirkin <mst@redhat=
.com> wrote:
> > >
> > > On Wed, Apr 12, 2023 at 12:07:26PM +0800, Jason Wang wrote:
> > > > On Wed, Apr 12, 2023 at 5:25=E2=80=AFAM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > >
> > > > > On Tue, Apr 11, 2023 at 07:01:16PM +0000, Parav Pandit wrote:
> > > > > >
> > > > > > > From: virtio-dev@lists.oasis-open.org <virtio-dev@lists.oasis=
-open.org> On
> > > > > > > Behalf Of Jason Wang
> > > > > > > Sent: Monday, April 10, 2023 11:29 PM
> > > > > >
> > > > > > > > However, it is not backward compatible, if the device place=
 them in
> > > > > > > > extended capability, it will not work.
> > > > > > > >
> > > > > > >
> > > > > > > It is kind of intended since it is only used for new PCI-E fe=
atures:
> > > > > > >
> > > > > > New fields in new extended pci cap area is fine.
> > > > > > Migrating old fields to be present in the new extended pci cap,=
 is not your intention. Right?
> > > > > >
> > > > > > > "
> > > > > > > +The location of the virtio structures that depend on the PCI=
 Express
> > > > > > > +capability are specified using a vendor-specific extended ca=
pabilities
> > > > > > > +on the extended capabilities list in PCI Express extended co=
nfiguration
> > > > > > > +space of the device.
> > > > > > > "
> > > > > > >
> > > > > > > > To make it backward compatible, a device needs to expose ex=
isting
> > > > > > > > structure in legacy area. And extended structure for same c=
apability
> > > > > > > > in extended pci capability region.
> > > > > > > >
> > > > > > > > In other words, it will have to be a both places.
> > > > > > >
> > > > > > > Then we will run out of config space again?
> > > > > > No.
> > > > > > Only currently defined caps to be placed in two places.
> > > > > > New fields don=E2=80=99t need to be placed in PCI cap, because =
no driver is looking there.
> > > > > >
> > > > > > We probably already discussed this in previous email by now.
> > > > > >
> > > > > > > Otherwise we need to deal with the
> > > > > > > case when existing structures were only placed at extended ca=
pability. Michael
> > > > > > > suggest to add a new feature, but the driver may not negotiat=
e the feature
> > > > > > > which requires more thought.
> > > > > > >
> > > > > > Not sure I understand feature bit.
> > > > >
> > > > > This is because we have a concept of dependency between
> > > > > features but not a concept of dependency of feature on
> > > > > capability.
> > > > >
> > > > > > PCI transport fields existence is usually not dependent on uppe=
r layer protocol.
> > > > > >
> > > > > > > > We may need it even sooner than this because the AQ patch i=
s expanding
> > > > > > > > the structure located in legacy area.
> > > > > > >
> > > > > > > Just to make sure I understand this, assuming we have adminq,=
 any reason a
> > > > > > > dedicated pcie ext cap is required?
> > > > > > >
> > > > > > No. it was my short sight. I responded right after above text t=
hat AQ doesn=E2=80=99t need cap extension.
> > > > >
> > > > >
> > > > >
> > > > > You know, thinking about this, I begin to feel that we should
> > > > > require that if at least one extended config exists then
> > > > > all caps present in the regular config are *also*
> > > > > mirrored in the extended config. IOW extended >=3D regular.
> > > > > The reason is that extended config can be emulated more efficient=
ly
> > > > > (2x less exits).
> > > >
> > > > Any reason for it to get less exits?
> > >
> > > For a variety of reasons having to do with buggy hardware e.g. linux
> > > likes to use cf8/cfc for legacy ranges. 2 accesses are required for e=
ach
> > > read/write.  extended space is just 1.
> > >
> >
> > Ok.
> >
> > >
> > > > At least it has not been done in
> > > > current Qemu's emulation. (And do we really care about the performa=
nce
> > > > of config space access?)
> > > >
> > > > Thanks
> > >
> > > For boot speed, yes. Not minor 5% things but 2x, sure.
> >
> > If we care about boot speed we should avoid using the PCI layer in the
> > guest completely.
> >
> > Thanks
>
> Woa. And do what? Add a ton of functionality in a PV way to MMIO?

Probably, we have microVM already. And hyperv drops PCI since Gen2.

> NUMA, MSI, power management .... the list goes on and on.
> If you have pci on the host it is way easier to pass that
> through to guest than do a completely different thing.

It's a balance. If you want functionality, PCI is probably a must. But
if you care about only the boot speed, the boot speed is not slowed
down by a single device but the whole PCI layer.

Thanks

>
> --
> MST
>


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
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

