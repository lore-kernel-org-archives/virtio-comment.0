Return-Path: <virtio-comment-return-8068-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D17C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 00:34:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BCD7B6846F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 00:34:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A4145986BA1
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 00:34:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 99706986B95; Wed,  1 Nov 2023 00:34:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8BAA6986B96
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 00:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: i01iCgP_PvCwAovCoZyvJQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698798845; x=1699403645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4JZ3/4rp89uqz+fun4boqMEGIC6CN6H5+LuLoo8OtEQ=;
        b=dXkwTGL/IwL3JbzWM06apA3RhRIETLQFqZH4AlcN7+w6aBLMvbwj8YQVONuD3ntpof
         4rP5VqKgwP4TE3a6xkFAhMh7f/ezhKCj1ugNkYJGyTRj8caVLfyFx0AYl7ZjPDn8MOEu
         0LKsC6wcYe591J3fSUfJul0CsMnwcD+hvAL0BZqpkswQksCWAY18K/eBM3PjkTPf2VDR
         ydKWBGftC3Nrrh2OVdodV2bGRsycZ35nmmxA9ogbBNqBJE0PWHYk9QSQdXrYSsu2sWfE
         xSAyOPFEjKyFCo95yIRdN/4Wf/OUwdiIYNw1VdNjnwMv2BU6QtlDOTriamvXuEzmV38B
         v6Hw==
X-Gm-Message-State: AOJu0YxnPYBZjAwbSvYJCdWba78AlH6k/vXmMNo9W9xcvdBsOEHGZMgG
	BKad+7WDx2YB/IBexwFvgwp37lvb8NocoHbWxUeA01PtNhdIlA1GRy4eXqFTCFoBA1whLrwdlS4
	ZGDjl63xf2UiVvlcFK9VZU4EK+jpIs3W4+d7vp4ELFQT2q0PIjw==
X-Received: by 2002:a05:6512:2395:b0:509:16c7:346b with SMTP id c21-20020a056512239500b0050916c7346bmr1834910lfv.2.1698798844711;
        Tue, 31 Oct 2023 17:34:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmOplLCHR0pvFBBbOJDAZyqcMtmLWc9vAgrL0lMmdJ45k+6RAq3BBfvZEKwrXHZptkgnQAz9J/S/ANW5PJWU4=
X-Received: by 2002:a05:6512:2395:b0:509:16c7:346b with SMTP id
 c21-20020a056512239500b0050916c7346bmr1834900lfv.2.1698798844407; Tue, 31 Oct
 2023 17:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <DM8PR12MB5480FD897C13FCB2CBE15268DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEuKoamb1bn-9stEsZTA3nHwAw4jrd=jWPS6SGuUzH67FA@mail.gmail.com>
 <PH0PR12MB548175CD39FA20BE2727E5B6DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuJySOAGguGvnBA7ftD0mwwM_M0SO0266M1+7d+XRXQ=g@mail.gmail.com> <PH0PR12MB5481ABD71DAF7D82931D57D2DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481ABD71DAF7D82931D57D2DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 1 Nov 2023 08:33:53 +0800
Message-ID: <CACGkMEu0gfw4zNc9KTLm9ekhuWgsgzHLVya_68HajQZObtr3-w@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Tue, Oct 31, 2023 at 1:30=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, October 31, 2023 7:05 AM
> >
> > On Mon, Oct 30, 2023 at 12:47=E2=80=AFPM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > >
> > > > From: virtio-comment@lists.oasis-open.org
> > > > <virtio-comment@lists.oasis- open.org> On Behalf Of Jason Wang
> > > >
> > > > On Thu, Oct 26, 2023 at 11:45=E2=80=AFAM Parav Pandit <parav@nvidia=
.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Thursday, October 26, 2023 6:16 AM
> > > > > >
> > > > > > On Wed, Oct 25, 2023 at 3:03=E2=80=AFPM Parav Pandit <parav@nvi=
dia.com>
> > wrote:
> > > > > > >
> > > > > > >
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Wednesday, October 25, 2023 6:59 AM
> > > > > > > > > For passthrough PASID assignment vq is not needed.
> > > > > > > >
> > > > > > > > How do you know that?
> > > > > > > Because for passthrough, the hypervisor is not involved in
> > > > > > > dealing with VQ at
> > > > > > all.
> > > > > >
> > > > > > Ok, so if I understand correctly, you are saying your design
> > > > > > can't work for the case of PASID assignment.
> > > > > >
> > > > > No. PASID assignment will happen from the guest for its own use
> > > > > and device
> > > > migration will just work fine because device context will capture t=
his.
> > > >
> > > > It's not about device context. We're discussing "passthrough", no?
> > > >
> > > Not sure, we are discussing same.
> > > A member device is passthrough to the guest, dealing with its own PAS=
IDs and
> > virtio interface for some VQ assignment to PASID.
> > > So VQ context captured by the hypervisor, will have some PASID attach=
ed to
> > this VQ.
> > > Device context will be updated.
> > >
> > > > You want all virtio stuff to be "passthrough", but assigning a PASI=
D
> > > > to a specific virtqueue in the guest must be trapped.
> > > >
> > > No. PASID assignment to a specific virtqueue in the guest must go dir=
ectly
> > from guest to device.
> >
> > This works like setting CR3, you can't simply let it go from guest to h=
ost.
> >
> > Host IOMMU driver needs to know the PASID to program the IO page tables
> > correctly.
> >
> This will be done by the IOMMU.
>
> > > When guest iommu may need to communicate anything for this PASID, it =
will
> > come through its proper IOMMU channel/hypercall.
> >
> > Let's say using PASID X for queue 0, this knowledge is beyond the IOMMU=
 scope
> > but belongs to virtio. Or please explain how it can work when it goes d=
irectly
> > from guest to device.
> >
> We are yet to ever see spec for PASID to VQ assignment.

It has one.

> For ok for theory sake it is there.
>
> Virtio driver will assign the PASID directly from guest driver to device =
using a create_vq(pasid=3DX) command.
> Same process is somehow attached the PASID by the guest OS.
> The whole PASID range is known to the hypervisor when the device is hande=
d over to the guest VM.

How can it know?

> So PASID mapping is setup by the hypervisor IOMMU at this point.

You disallow the PASID to be virtualized here. What's more, such a
PASID passthrough has security implications.

Again, we are talking about different things, I've tried to show you
that there are cases that passthrough can't work but if you think the
only way for migration is to use passthrough in every case, you will
probably fail.

>
> > > Virtio device is not the conduit for this exchange.
> > >
> > > > >
> > > > > > >
> > > > > > > > There are works ongoing to make vPASID work for the guest l=
ike
> > vSVA.
> > > > > > > > Virtio doesn't differ from other devices.
> > > > > > > Passthrough do not run like SVA.
> > > > > >
> > > > > > Great, you find another limitation of "passthrough" by yourself=
.
> > > > > >
> > > > > No. it is not the limitation it is just the way it does not need
> > > > > complex SVA to
> > > > split the device for unrelated usage.
> > > >
> > > > How can you limit the user in the guest to not use vSVA?
> > > >
> > > He he, I am not limiting, again misunderstanding or wrong attribution=
.
> > > I explained that hypervisor for passthrough does not need SVA.
> > > Guest can do anything it wants from the guest OS with the member devi=
ce.
> >
> > Ok, so the point stills, see above.
>
> I don=E2=80=99t think so. The guest owns its PASID space

Again, vPASID to PASID can't be done hardware unless I miss some
recent features of IOMMUs.

> and directly communicates like any other device attribute.
>
> >
> > >
> > > > >
> > > > > > > Each passthrough device has PASID from its own space fully
> > > > > > > managed by the
> > > > > > guest.
> > > > > > > Some cpu required vPASID and SIOV is not going this way anmor=
e.
> > > > > >
> > > > > > Then how to migrate? Invent a full set of something else throug=
h
> > > > > > another giant series like this to migrate to the SIOV thing?
> > > > > > That's a mess for
> > > > sure.
> > > > > >
> > > > > SIOV will for sure reuse most or all parts of this work, almost e=
ntirely as_is.
> > > > > vPASID is cpu/platform specific things not part of the SIOV devic=
es.
> > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > > If at all it is done, it will be done from the guest by
> > > > > > > > > the driver using virtio
> > > > > > > > interface.
> > > > > > > >
> > > > > > > > Then you need to trap. Such things couldn't be passed
> > > > > > > > through to guests
> > > > > > directly.
> > > > > > > >
> > > > > > > Only PASID capability is trapped. PASID allocation and usage
> > > > > > > is directly from
> > > > > > guest.
> > > > > >
> > > > > > How can you achieve this? Assigning a PAISD to a device is
> > > > > > completely
> > > > > > device(virtio) specific. How can you use a general layer withou=
t
> > > > > > the knowledge of virtio to trap that?
> > > > > When one wants to map vPASID to pPASID a platform needs to be
> > involved.
> > > >
> > > > I'm not talking about how to map vPASID to pPASID, it's out of the
> > > > scope of virtio. I'm talking about assigning a vPASID to a specific
> > > > virtqueue or other virtio function in the guest.
> > > >
> > > That can be done in the guest. The key is guest wont know that it is =
dealing
> > with vPASID.
> > > It will follow the same principle from your paper of equivalency, whe=
re virtio
> > software layer will assign PASID to VQ and communicate to device.
> > >
> > > Anyway, all of this just digression from current series.
> >
> > It's not, as you mention that only MSI-X is trapped, I give you another=
 one.
> >
> PASID access from the guest to be done fully by the guest IOMMU.
> Not by virtio devices.
>
> > >
> > > > You need a virtio specific queue or capability to assign a PASID to
> > > > a specific virtqueue, and that can't be done without trapping and
> > > > without virito specific knowledge.
> > > >
> > > I disagree. PASID assignment to a virqueue in future from guest virti=
o driver to
> > device is uniform method.
> > > Whether its PF assigning PASID to VQ of self, Or VF driver in the
> > > guest assigning PASID to VQ.
> > >
> > > All same.
> > > Only IOMMU layer hypercalls will know how to deal with PASID assignme=
nt at
> > platform layer to setup the domain etc table.
> > >
> > > And this is way beyond our device migration discussion.
> > > By any means, if you were implying that somehow vq to PASID assignmen=
t
> > _may_ need trap+emulation, hence whole device migration to depend on so=
me
> > trap+emulation, than surely, than I do not agree to it.
> >
> > See above.
> >
> Yeah, I disagree to such implying.
>
> > >
> > > PASID equivalent in mlx5 world is ODP_MR+PD isolating the guest proce=
ss and
> > all of that just works on efficiency and equivalence principle already =
for a
> > decade now without any trap+emulation.
> > >
> > > > > When virtio passthrough device is in guest, it has all its PASID =
accessible.
> > > > >
> > > > > All these is large deviation from current discussion of this
> > > > > series, so I will keep
> > > > it short.
> > > > >
> > > > > >
> > > > > > > Regardless it is not relevant to passthrough mode as PASID is
> > > > > > > yet another
> > > > > > resource.
> > > > > > > And for some cpu if it is trapped, it is generic layer, that
> > > > > > > does not require virtio
> > > > > > involvement.
> > > > > > > So virtio interface asking to trap something because generic
> > > > > > > facility has done
> > > > > > in not the approach.
> > > > > >
> > > > > > This misses the point of PASID. How to use PASID is totally dev=
ice
> > specific.
> > > > > Sure, and how to virtualize vPASID/pPASID is platform specific as
> > > > > single PASID
> > > > can be used by multiple devices and process.
> > > >
> > > > See above, I think we're talking about different things.
> > > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > > Capabilities of #2 is generic across all pci devices, so
> > > > > > > > > it will be handled by the
> > > > > > > > HV.
> > > > > > > > > ATS/PRI cap is also generic manner handled by the HV and =
PCI
> > device.
> > > > > > > >
> > > > > > > > No, ATS/PRI requires the cooperation from the vIOMMU. You
> > > > > > > > can simply do ATS/PRI passthrough but with an emulated vIOM=
MU.
> > > > > > > And that is not the reason for virtio device to build
> > > > > > > trap+emulation for
> > > > > > passthrough member devices.
> > > > > >
> > > > > > vIOMMU is emulated by hypervisor with a PRI queue,
> > > > > PRI requests arrive on the PF for the VF.
> > > >
> > > > Shouldn't it arrive at platform IOMMU first? The path should be PRI
> > > > -> RC -> IOMMU -> host -> Hypervisor -> vIOMMU PRI -> guest IOMMU.
> > > >
> > > Above sequence seems write.
> > >
> > > > And things will be more complicated when (v)PASID is used. So you
> > > > can't simply let PRI go directly to the guest with the current arch=
itecture.
> > > >
> > > In current architecture of the pci VF, PRI does not go directly to th=
e guest.
> > > (and that is not reason to trap and emulate other things).
> >
> > Ok, so beyond MSI-X we need to trap PRI, and we will probably trap othe=
r
> > things in the future like PASID assignment.
> PRI etc all belong to generic PCI 4K config space region.

It's not about the capability, it's about the whole process of PRI
request handling. We've agreed that the PRI request needs to be
trapped by the hypervisor and then delivered to the vIOMMU.

> Trap+emulation done in generic manner without involving virtio or other d=
evice types.
>
> >
> > >
> > > > >
> > > > > > how can you pass
> > > > > > through a hardware PRI request to a guest directly without trap=
ping it
> > then?
> > > > > > What's more, PCIE allows the PRI to be done in a vendor (virtio=
)
> > > > > > specific way, so you want to break this rule? Or you want to
> > > > > > blacklist ATS/PRI
> > > > for virtio?
> > > > > >
> > > > > I was aware of only pci-sig way of PRI.
> > > > > Do you have a reference to the ECN that enables vendor specific
> > > > > way of PRI? I
> > > > would like to read it.
> > > >
> > > > I mean it doesn't forbid us to build a virtio specific interface fo=
r
> > > > I/O page fault report and recovery.
> > > >
> > > So PRI of PCI does not allow. It is ODP kind of technique you meant a=
bove.
> > > Yes one can build.
> > > Ok. unrelated to device migration, so I will park this good discussio=
n for later.
> >
> > That's fine.
> >
> > >
> > > > > This will be very good to eliminate IOMMU PRI limitations.
> > > >
> > > > Probably.
> > > >
> > > > > PRI will directly go to the guest driver, and guest would interac=
t
> > > > > with IOMMU
> > > > to service the paging request through IOMMU APIs.
> > > >
> > > > With PASID, it can't go directly.
> > > >
> > > When the request consist of PASID in it, it can.
> > > But again these PCI-SIG extensions of PASID are not related to device
> > migration, so I am differing it.
> > >
> > > > > For PRI in vendor specific way needs a separate discussion. It is
> > > > > not related to
> > > > live migration.
> > > >
> > > > PRI itself is not related. But the point is, you can't simply pass
> > > > through ATS/PRI now.
> > > >
> > > Ah ok. the whole 4K PCI config space where ATS/PRI capabilities are l=
ocated
> > are trapped+emulated by hypervisor.
> > > So?
> > > So do we start emulating virito interfaces too for passthrough?
> > > No.
> > > Can one still continue to trap+emulate?
> > > Sure why not?
> >
> > Then let's not limit your proposal to be used by "passthrough" only?
> One can possibly build some variant of the existing virtio member device =
using same owner and member scheme.

It's not about the member/owner, it's about e.g whether the hypervisor
can trap and emulate.

I've pointed out that what you invent here is actually a partial new
transport, for example, a hypervisor can trap and use things like
device context in PF to bypass the registers in VF. This is the idea
of transport commands/q.

> If for that is some admin commands are missing, may be one can add them.

I would then build the device context commands on top of the transport
commands/q, then it would be complete.

> No need to step on toes of use cases as they are different...
>
> > I've shown you that
> >
> > 1) you can't easily say you can pass through all the virtio facilities
> > 2) how ambiguous for terminology like "passthrough"
> >
> It is not, it is well defined in v3, v2.
> One can continue to argue and keep defining the variant and still call it=
 data path acceleration and then claim it as passthrough ...
> But I won't debate this anymore as its just non-technical aspects of leas=
t interest.

You use this terminology in the spec which is all about technical, and
you think how to define it is a matter of non-technical. This is
self-contradictory. If you fail, it probably means it's ambiguous.
Let's don't use that terminology.

> We have technical tasks and more improved specs to update going forward.

It's a burden to do the synchronization.

> Working on extension for device specific contexts to enrich it.

Again, making the proposal to be general is much more beneficial.

Thanks





>
> > Thanks
> >
> > >
> > > Can one use AQ of this proposal to do so?
> > > Sure, why not?
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

