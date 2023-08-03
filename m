Return-Path: <virtio-comment-return-6979-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DF1C001DE
	for <virtio-comment@archiver.kernel.org>; Thu,  3 Aug 2023 02:55:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 4DDD771C8E
	for <virtio-comment@archiver.kernel.org>; Thu,  3 Aug 2023 02:55:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3B9AB9866DC
	for <virtio-comment@archiver.kernel.org>; Thu,  3 Aug 2023 02:55:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3163C9866AE; Thu,  3 Aug 2023 02:55:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1ABB89866AC
	for <virtio-comment@lists.oasis-open.org>; Thu,  3 Aug 2023 02:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: uX3gteNNO9Clvjo8NpgKog-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691031350; x=1691636150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNhVC0yagGvST1LioJ+09BH2OBH8f/Xjrqsr0hdaVHk=;
        b=GN18uKBakIvC7A01LA7HzJLJa3Yq8O/JxWoTQktapThDPCMvRsRhEBPsLzvH+QN/g6
         37KdwTE4YX9G3b/9n2CK5Y8KT7WXhBxAR1I5sqUVK+rGXcTdQmTsO2WCVtenR3EaxJvk
         o4o83gjBuFxg3THUhPNEG5ax4VNaCosGSSmFdBGnBdFECuVx2TrfuyACa0jwJqBWRwMG
         KdPFmidgQ7y7SyjGU9yJr9fuz7aTnQoOqNiH3KeoZltvqL0OSK/wwyz7/anWNci70vPe
         vHd39mgG6fOfAcNiUZicQsSwUXb3vsi/+3UKSe2Jb62dFh5FzGNAO2+klGQShcdlxXGk
         6TYw==
X-Gm-Message-State: ABy/qLaGU9KU83tYqo/u6dnokViwFSVNKohnlzAtw5FlaY5q3i1GTeuz
	u+ke/qmWMp7ZNdc1quUP1w0WC19WcvojAwZZ1NlWuz9kpatoZPza6fBXmjXVk98n4LiX6J7wdth
	ong0QynZO97EgV0/0kJS0UjGnFap8UcXmCmlQxdKjCepcajwtPg==
X-Received: by 2002:a2e:7816:0:b0:2b1:a89a:5f2b with SMTP id t22-20020a2e7816000000b002b1a89a5f2bmr6165326ljc.2.1691031350009;
        Wed, 02 Aug 2023 19:55:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHncPqMP8dnrQB9SNY2Tq6afoESAtd4J3V9Y/TweAGuKT5jWxSRYvb5C5lQV4YPQPdqXh2qIqC72M8tB8+GqPY=
X-Received: by 2002:a2e:7816:0:b0:2b1:a89a:5f2b with SMTP id
 t22-20020a2e7816000000b002b1a89a5f2bmr6165314ljc.2.1691031349608; Wed, 02 Aug
 2023 19:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsDo8dKSwD=Uovo=ekussqQmA8kf90jzuRoDBZs2B-GTw@mail.gmail.com>
 <PH0PR12MB548134EA03AE48ACD6F422CADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvHjAkbQ1D_PNhObpZ00g3P=E7Bzj3RvBPpst6cCFTWcQ@mail.gmail.com> <PH0PR12MB5481ABF25620784987149809DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481ABF25620784987149809DC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 3 Aug 2023 10:55:38 +0800
Message-ID: <CACGkMEseZeT4VX8Ut-7KraxLKNOMKOgFDNxqKofXSFT8yHfg-w@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [virtio] RE: [virtio-comment] proposal: use admin command (and
 aq) of the device to query config space

On Wed, Aug 2, 2023 at 5:57=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, August 2, 2023 3:02 PM
> >
> > On Wed, Aug 2, 2023 at 5:07=E2=80=AFPM Parav Pandit <parav@nvidia.com> =
wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Wednesday, August 2, 2023 2:23 PM
> > > >
> > > > On Tue, Aug 1, 2023 at 3:09=E2=80=AFPM Parav Pandit <parav@nvidia.c=
om> wrote:
> > > > >
> > > > > One line proposal:
> > > > > Let's use new admin command and admin q for all device types to
> > > > > query
> > > > device config space for new fields. (always).
> > > >
> > > > Before we mandate anything to admin command, we need to first inven=
t
> > > > an admin command over MMIO interface otherwise it would always be a=
n
> > > > issue for the nesting.
> > > >
> > > Nesting can be independent requirement in itself.'
> >
> > I don't understand here. If you tie new fields to the DMA interface, it=
 basically
> > means nesting won't get any new features unless:
> >
> > 1) it's a PCI VF
> > 2) SR-IOV emulation is done
> > 3) admin virtqueue emulation is done
> >
> > If you want differ nesting devices from others, it would be a nightmare=
 to
> > maintain.
> >
> New fields for sure are tied to the DMA interface.

This is different from what you've said above

"Let's use the new admin command and admin q for all device types to ..."

I'm simply replying to your proposal to tie new fields to the admin
command(queue).

> And nesting can also get just like how a VQ works in nested mode.

We should consider reuse the existing one like cvq or inventing
lightwight and self contained methods. Admin virtqueue doesn't fit,
admin command may but we need a MMIO interface for admin command.

>
> > > >
> > > > 1) device configuration space is transport independent, some
> > > > transport already use DMA to access the device configuration space
> > > You can say ccw instead of "some". :)
> >
> > Kind of but the transport vq proposal goes in the same way.
> >
> We debated many times that the wording transport vq is wrong as it is _no=
t_ going to transport driver notifications.
> Anyway, there is nothing to discuss here. So focusing on main items below=
.
>
> > >
> > > > 2) device configuration space is not read only, we've already had
> > > > several examples of using it as write
> > > >
> > > It is even worse to have writable.
> >
> > Well, what I meant is that, it's not necessarily read only and not nece=
ssarily a
> > register interface.
> >
> I took PCI as being most common interface and took net, blk as devices wh=
o are experiencing high growth on features and device specific config space=
.
>
> This isn=E2=80=99t really a normative part of the spec. The key takeway t=
o have it, for common things it is read only and its register.

As mentioned in the past, when developing spec, we should look for
what it can be.

My point is to stick to the device configuration space but invent DMA
interface to access them, then we are all fine.

>
> > >
> > > > > It is growing rapidly.
> > > > > Some devices may be even multi-functionality device in coming
> > > > > future such as
> > > > net + clock + rdma device.
> > > > > For a PCI transport implementing such ever-growing capabilities,
> > > > configuration is burdensome as plain registers.
> > > >
> > > > We've already fixed size VIRTIO_PCI_CAP_PCI_CFG. What's wrong with =
that?
> > > >
> > > The wrong part is: it is still and indirect and slow, sub-optimal reg=
ister
> > interface.
> >
> > Do we really care about the performance here?
> When it comes to bulk data transfer, in range of few hundred bytes and lo=
oking for 5+ year period, than yes, reading using indirect register is slow=
.

What kind of configuration requires a few hundred bytes? We should not
duplicate the work of provisioning into device configuration space.

> And after all it is still indirect register which is does not have time v=
ariability part.
> So it is not fulfilling the requirement at all.
>
> > And if it is one of your major
> > concerns, it's better to explain it along with the "ever-growing" conce=
rn.
> >
> I thought it is clear that it is still a register, even slower than curre=
nt one and still have same issues without it.
>
> > > VQ is decoupled from transport already.
> > > So, there is no flexibility broken.
> > > And yet you suggested transport dependent VIRTIO_PCI_CAP_PCI_CFG abov=
e
> > > making it further wrong. :)
> > >
> >
> > The context here is that you want to mandate any new fields to be DMA.
> > DMA is obviously transport specific. There are transports that don't us=
e DMA at
> > all (e.g the shared memory).
> >
>
> VQ is surprisingly does the DMA without being transport specific.
> How net device mandate tx pkts via vq, how a console device mandate recei=
ve and transmit queue,
> How a crypto device mandate a control vq,
>
> What is proposed here is no different...
>
> Shared memory is not for bulk data transfer in virtio spec.
> We don=E2=80=99t see "shared memory" as transport in " Virtio Transport O=
ptions" section.

You can see some examples in the kernel drivers. The DMA mandating
excludes any shared memory proposal in the future.

>
> > > > > 3. A device must be able to choose, starting from which field
> > > > > driver must query such configuration via DMA interface. This fiel=
d
> > > > > offset must be
> > > > greater than currently defined configuration field.
> >
> > [...]
> >
> > > > >
> > > > > d. Any other option?
> > > >
> > > > Transport virtqueue on top of admin virtqueue will address this sea=
mlessly.
> > > >
> > > :)
> > >
> > > Don=E2=80=99t see why one would create few more objects on top of aq =
when aq or
> > cvq itself can fulfil the need.
> > > Can you please elaborate?
> >
> > If cvq can work, there's no need for any other methods.
> Cvq is not present for all the device, at the same time all devices are n=
ot experiencing high growth of config space either.

Adding cvq is much easier than inventing(duplicating) the work of a transpo=
rt.

Thanks

> Hence the discussion here.
> Michael raised the concern to use some generic scheme for all the device =
previously, hence the aq.
>
> I think the practical approach is, whichever device has cvq, they should =
be able to use cvq for config+caps query+set.
> And rest can burn AQ to transport the same command.
>
> > If you care about admin
> > virtqueue then device configuration space is not the only thing that ca=
n be
> > "ever growing", common_cfg is another one.
> The idea is to do minimal bootstrap work from the common config space and=
 switch to the queue.
> So common config shouldn=E2=80=99t be growing either other than minimal b=
ootstrap functionality.
> Hence, common config also to be available via dma command.
>
> > Allowing them to be accessed via a
> > virtqueue (thus DMA in PCI transport) is basically the idea of the tran=
sport
> > virtqueue. Ling shan is rebasing transport virtqueue proposals on top o=
f admin
> > commands, we can see then.
>
> Current proposal doesnt need yet another new transport vq with/without ne=
sting.
> We just need to make choice as _always_admin command or efficiently use c=
vq when available.


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

