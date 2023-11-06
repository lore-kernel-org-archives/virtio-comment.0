Return-Path: <virtio-comment-return-8185-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F3DC4167B
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 06:35:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0E9DF33580
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 06:35:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A617986CCA
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 06:35:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8533098670A; Mon,  6 Nov 2023 06:35:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5607C986705
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 06:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: AIEGtkkXORSlNYtG5RHQDg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699252503; x=1699857303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYdcCJq6DYs36Oex523iEYLJkh9aunEmRUSdv8giM2c=;
        b=ZXsjyxEvssoPo0vVaNUcNqZREHoB8zoFAtKxw6BSTT2fTm9Ef6PjMa+qN6mFWO/8Va
         3FsgTR++Sz6HnkqzksQxpIx6GVRX490fT77pUU9kR1gIbDu6ODgDkZ7kXhiTNsupX8YF
         NF5SWM2vtShZXwbB6ALnEYOqs03aNw7oLKwefmspxKdHlzQgur1HrybQEu8Xyrq9pwGU
         9ac0rh/j0k5nCmvqSnCotLxGJx77/QY9pop6IoULgPimWypqbayi18xj8d0U3VjQq8Kq
         lFnYuBV2jiWxv3jhJpyrI5OkQP0CMZMOhP0Nf+7UTsUeVf3Bd0ixWYfNEZEk5y4RdEo6
         kLVw==
X-Gm-Message-State: AOJu0YwGU6cLf7bIkjiEGWnOBAlOXyAiL+wYOzbRpZNRtAwt2Ht6WxVg
	aCzuy0aXNbUJY0KRx/xn28RIM/aD4P5BAHTqagEDneNdz6Wl89VU1rWCoiMU5e5shCymVMjFnjn
	gEtiomWTCITcit010Tkc4CN56mQKjcn5cF2mLdQm0axnIewZ/tA==
X-Received: by 2002:a19:f713:0:b0:507:a6b6:d3c1 with SMTP id z19-20020a19f713000000b00507a6b6d3c1mr21657228lfe.20.1699252502947;
        Sun, 05 Nov 2023 22:35:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhOlpvF8pjHWFuTDni7mj3GhejQAIBuGzkddOUGyExniyAfI0mi4VWq46qcANgewPgEmB0pPd8zSvHDd78J/8=
X-Received: by 2002:a19:f713:0:b0:507:a6b6:d3c1 with SMTP id
 z19-20020a19f713000000b00507a6b6d3c1mr21657214lfe.20.1699252502429; Sun, 05
 Nov 2023 22:35:02 -0800 (PST)
MIME-Version: 1.0
References: <DM8PR12MB5480FD897C13FCB2CBE15268DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEuKoamb1bn-9stEsZTA3nHwAw4jrd=jWPS6SGuUzH67FA@mail.gmail.com>
 <PH0PR12MB548175CD39FA20BE2727E5B6DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuJySOAGguGvnBA7ftD0mwwM_M0SO0266M1+7d+XRXQ=g@mail.gmail.com>
 <PH0PR12MB5481ABD71DAF7D82931D57D2DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu0gfw4zNc9KTLm9ekhuWgsgzHLVya_68HajQZObtr3-w@mail.gmail.com>
 <DM8PR12MB54808B71AA9C0A945D0A3226DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com> <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 6 Nov 2023 14:34:51 +0800
Message-ID: <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
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

On Thu, Nov 2, 2023 at 2:10=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, November 2, 2023 9:56 AM
> >
> > On Wed, Nov 1, 2023 at 11:32=E2=80=AFAM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Wednesday, November 1, 2023 6:04 AM
> > > >
> > > > On Tue, Oct 31, 2023 at 1:30=E2=80=AFPM Parav Pandit <parav@nvidia.=
com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Tuesday, October 31, 2023 7:05 AM
> > > > > >
> > > > > > On Mon, Oct 30, 2023 at 12:47=E2=80=AFPM Parav Pandit <parav@nv=
idia.com>
> > wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > From: virtio-comment@lists.oasis-open.org
> > > > > > > > <virtio-comment@lists.oasis- open.org> On Behalf Of Jason
> > > > > > > > Wang
> > > > > > > >
> > > > > > > > On Thu, Oct 26, 2023 at 11:45=E2=80=AFAM Parav Pandit
> > > > > > > > <parav@nvidia.com>
> > > > wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > Sent: Thursday, October 26, 2023 6:16 AM
> > > > > > > > > >
> > > > > > > > > > On Wed, Oct 25, 2023 at 3:03=E2=80=AFPM Parav Pandit
> > > > > > > > > > <parav@nvidia.com>
> > > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > Sent: Wednesday, October 25, 2023 6:59 AM
> > > > > > > > > > > > > For passthrough PASID assignment vq is not needed=
.
> > > > > > > > > > > >
> > > > > > > > > > > > How do you know that?
> > > > > > > > > > > Because for passthrough, the hypervisor is not
> > > > > > > > > > > involved in dealing with VQ at
> > > > > > > > > > all.
> > > > > > > > > >
> > > > > > > > > > Ok, so if I understand correctly, you are saying your
> > > > > > > > > > design can't work for the case of PASID assignment.
> > > > > > > > > >
> > > > > > > > > No. PASID assignment will happen from the guest for its
> > > > > > > > > own use and device
> > > > > > > > migration will just work fine because device context will c=
apture this.
> > > > > > > >
> > > > > > > > It's not about device context. We're discussing "passthroug=
h", no?
> > > > > > > >
> > > > > > > Not sure, we are discussing same.
> > > > > > > A member device is passthrough to the guest, dealing with its
> > > > > > > own PASIDs and
> > > > > > virtio interface for some VQ assignment to PASID.
> > > > > > > So VQ context captured by the hypervisor, will have some PASI=
D
> > > > > > > attached to
> > > > > > this VQ.
> > > > > > > Device context will be updated.
> > > > > > >
> > > > > > > > You want all virtio stuff to be "passthrough", but assignin=
g
> > > > > > > > a PASID to a specific virtqueue in the guest must be trappe=
d.
> > > > > > > >
> > > > > > > No. PASID assignment to a specific virtqueue in the guest mus=
t
> > > > > > > go directly
> > > > > > from guest to device.
> > > > > >
> > > > > > This works like setting CR3, you can't simply let it go from gu=
est to host.
> > > > > >
> > > > > > Host IOMMU driver needs to know the PASID to program the IO pag=
e
> > > > > > tables correctly.
> > > > > >
> > > > > This will be done by the IOMMU.
> > > > >
> > > > > > > When guest iommu may need to communicate anything for this
> > > > > > > PASID, it will
> > > > > > come through its proper IOMMU channel/hypercall.
> > > > > >
> > > > > > Let's say using PASID X for queue 0, this knowledge is beyond
> > > > > > the IOMMU scope but belongs to virtio. Or please explain how it
> > > > > > can work when it goes directly from guest to device.
> > > > > >
> > > > > We are yet to ever see spec for PASID to VQ assignment.
> > > >
> > > > It has one.
> > > >
> > > > > For ok for theory sake it is there.
> > > > >
> > > > > Virtio driver will assign the PASID directly from guest driver to
> > > > > device using a
> > > > create_vq(pasid=3DX) command.
> > > > > Same process is somehow attached the PASID by the guest OS.
> > > > > The whole PASID range is known to the hypervisor when the device
> > > > > is handed
> > > > over to the guest VM.
> > > >
> > > > How can it know?
> > > >
> > > > > So PASID mapping is setup by the hypervisor IOMMU at this point.
> > > >
> > > > You disallow the PASID to be virtualized here. What's more, such a
> > > > PASID passthrough has security implications.
> > > >
> > > No. virtio spec is not disallowing. At least for sure, this series is=
 not the one.
> > > My main point is, virtio device interface will not be the source of h=
ypercall to
> > program IOMMU in the hypervisor.
> > > It is something to be done by IOMMU side.
> >
> > So unless vPASID can be used by the hardware you need to trap the mappi=
ng
> > from a PASID to a virtqueue. Then you need virtio specific knowledge.
> >
> vPASID by hardware is unlikely to be used by hw PCI EP devices at least i=
n any near term future.
> This requires either vPASID to pPASID table in device or in IOMMU.

So we are on the same page.

Claiming a method that can only work for passthrough or emulation is
not good. We all know virtualization is passthrough + emulation.

>
> > >
> > > > Again, we are talking about different things, I've tried to show yo=
u
> > > > that there are cases that passthrough can't work but if you think
> > > > the only way for migration is to use passthrough in every case, you=
 will
> > probably fail.
> > > >
> > > I didn't say only way for migration is passthrough.
> > > Passthrough is clearly one way.
> > > Other ways may be possible.
> > >
> > > > >
> > > > > > > Virtio device is not the conduit for this exchange.
> > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > There are works ongoing to make vPASID work for the
> > > > > > > > > > > > guest like
> > > > > > vSVA.
> > > > > > > > > > > > Virtio doesn't differ from other devices.
> > > > > > > > > > > Passthrough do not run like SVA.
> > > > > > > > > >
> > > > > > > > > > Great, you find another limitation of "passthrough" by =
yourself.
> > > > > > > > > >
> > > > > > > > > No. it is not the limitation it is just the way it does
> > > > > > > > > not need complex SVA to
> > > > > > > > split the device for unrelated usage.
> > > > > > > >
> > > > > > > > How can you limit the user in the guest to not use vSVA?
> > > > > > > >
> > > > > > > He he, I am not limiting, again misunderstanding or wrong att=
ribution.
> > > > > > > I explained that hypervisor for passthrough does not need SVA=
.
> > > > > > > Guest can do anything it wants from the guest OS with the
> > > > > > > member
> > > > device.
> > > > > >
> > > > > > Ok, so the point stills, see above.
> > > > >
> > > > > I don=E2=80=99t think so. The guest owns its PASID space
> > > >
> > > > Again, vPASID to PASID can't be done hardware unless I miss some
> > > > recent features of IOMMUs.
> > > >
> > > Cpu vendors have different way of doing vPASID to pPASID.
> >
> > At least for the current version of major IOMMU vendors, such translati=
on (aka
> > PASID remapping) is not implemented in the hardware so it needs to be t=
rapped
> > first.
> >
> Right. So it is really far in future, atleast few years away.
>
> > > It is still an early space for virtio.
> > >
> > > > > and directly communicates like any other device attribute.
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > > Each passthrough device has PASID from its own space
> > > > > > > > > > > fully managed by the
> > > > > > > > > > guest.
> > > > > > > > > > > Some cpu required vPASID and SIOV is not going this w=
ay
> > anmore.
> > > > > > > > > >
> > > > > > > > > > Then how to migrate? Invent a full set of something els=
e
> > > > > > > > > > through another giant series like this to migrate to th=
e SIOV
> > thing?
> > > > > > > > > > That's a mess for
> > > > > > > > sure.
> > > > > > > > > >
> > > > > > > > > SIOV will for sure reuse most or all parts of this work,
> > > > > > > > > almost entirely
> > > > as_is.
> > > > > > > > > vPASID is cpu/platform specific things not part of the SI=
OV devices.
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > > If at all it is done, it will be done from the
> > > > > > > > > > > > > guest by the driver using virtio
> > > > > > > > > > > > interface.
> > > > > > > > > > > >
> > > > > > > > > > > > Then you need to trap. Such things couldn't be
> > > > > > > > > > > > passed through to guests
> > > > > > > > > > directly.
> > > > > > > > > > > >
> > > > > > > > > > > Only PASID capability is trapped. PASID allocation an=
d
> > > > > > > > > > > usage is directly from
> > > > > > > > > > guest.
> > > > > > > > > >
> > > > > > > > > > How can you achieve this? Assigning a PAISD to a device
> > > > > > > > > > is completely
> > > > > > > > > > device(virtio) specific. How can you use a general laye=
r
> > > > > > > > > > without the knowledge of virtio to trap that?
> > > > > > > > > When one wants to map vPASID to pPASID a platform needs t=
o
> > > > > > > > > be
> > > > > > involved.
> > > > > > > >
> > > > > > > > I'm not talking about how to map vPASID to pPASID, it's out
> > > > > > > > of the scope of virtio. I'm talking about assigning a vPASI=
D
> > > > > > > > to a specific virtqueue or other virtio function in the gue=
st.
> > > > > > > >
> > > > > > > That can be done in the guest. The key is guest wont know tha=
t
> > > > > > > it is dealing
> > > > > > with vPASID.
> > > > > > > It will follow the same principle from your paper of
> > > > > > > equivalency, where virtio
> > > > > > software layer will assign PASID to VQ and communicate to devic=
e.
> > > > > > >
> > > > > > > Anyway, all of this just digression from current series.
> > > > > >
> > > > > > It's not, as you mention that only MSI-X is trapped, I give you=
 another
> > one.
> > > > > >
> > > > > PASID access from the guest to be done fully by the guest IOMMU.
> > > > > Not by virtio devices.
> > > > >
> > > > > > >
> > > > > > > > You need a virtio specific queue or capability to assign a
> > > > > > > > PASID to a specific virtqueue, and that can't be done
> > > > > > > > without trapping and without virito specific knowledge.
> > > > > > > >
> > > > > > > I disagree. PASID assignment to a virqueue in future from
> > > > > > > guest virtio driver to
> > > > > > device is uniform method.
> > > > > > > Whether its PF assigning PASID to VQ of self, Or VF driver in
> > > > > > > the guest assigning PASID to VQ.
> > > > > > >
> > > > > > > All same.
> > > > > > > Only IOMMU layer hypercalls will know how to deal with PASID
> > > > > > > assignment at
> > > > > > platform layer to setup the domain etc table.
> > > > > > >
> > > > > > > And this is way beyond our device migration discussion.
> > > > > > > By any means, if you were implying that somehow vq to PASID
> > > > > > > assignment
> > > > > > _may_ need trap+emulation, hence whole device migration to
> > > > > > depend on some
> > > > > > trap+emulation, than surely, than I do not agree to it.
> > > > > >
> > > > > > See above.
> > > > > >
> > > > > Yeah, I disagree to such implying.
> > > > >
> > > > > > >
> > > > > > > PASID equivalent in mlx5 world is ODP_MR+PD isolating the
> > > > > > > guest process and
> > > > > > all of that just works on efficiency and equivalence principle
> > > > > > already for a decade now without any trap+emulation.
> > > > > > >
> > > > > > > > > When virtio passthrough device is in guest, it has all it=
s
> > > > > > > > > PASID
> > > > accessible.
> > > > > > > > >
> > > > > > > > > All these is large deviation from current discussion of
> > > > > > > > > this series, so I will keep
> > > > > > > > it short.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > Regardless it is not relevant to passthrough mode as
> > > > > > > > > > > PASID is yet another
> > > > > > > > > > resource.
> > > > > > > > > > > And for some cpu if it is trapped, it is generic
> > > > > > > > > > > layer, that does not require virtio
> > > > > > > > > > involvement.
> > > > > > > > > > > So virtio interface asking to trap something because
> > > > > > > > > > > generic facility has done
> > > > > > > > > > in not the approach.
> > > > > > > > > >
> > > > > > > > > > This misses the point of PASID. How to use PASID is
> > > > > > > > > > totally device
> > > > > > specific.
> > > > > > > > > Sure, and how to virtualize vPASID/pPASID is platform
> > > > > > > > > specific as single PASID
> > > > > > > > can be used by multiple devices and process.
> > > > > > > >
> > > > > > > > See above, I think we're talking about different things.
> > > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > > Capabilities of #2 is generic across all pci
> > > > > > > > > > > > > devices, so it will be handled by the
> > > > > > > > > > > > HV.
> > > > > > > > > > > > > ATS/PRI cap is also generic manner handled by the
> > > > > > > > > > > > > HV and PCI
> > > > > > device.
> > > > > > > > > > > >
> > > > > > > > > > > > No, ATS/PRI requires the cooperation from the vIOMM=
U.
> > > > > > > > > > > > You can simply do ATS/PRI passthrough but with an
> > > > > > > > > > > > emulated
> > > > vIOMMU.
> > > > > > > > > > > And that is not the reason for virtio device to build
> > > > > > > > > > > trap+emulation for
> > > > > > > > > > passthrough member devices.
> > > > > > > > > >
> > > > > > > > > > vIOMMU is emulated by hypervisor with a PRI queue,
> > > > > > > > > PRI requests arrive on the PF for the VF.
> > > > > > > >
> > > > > > > > Shouldn't it arrive at platform IOMMU first? The path shoul=
d
> > > > > > > > be PRI
> > > > > > > > -> RC -> IOMMU -> host -> Hypervisor -> vIOMMU PRI -> guest
> > IOMMU.
> > > > > > > >
> > > > > > > Above sequence seems write.
> > > > > > >
> > > > > > > > And things will be more complicated when (v)PASID is used.
> > > > > > > > So you can't simply let PRI go directly to the guest with
> > > > > > > > the current
> > > > architecture.
> > > > > > > >
> > > > > > > In current architecture of the pci VF, PRI does not go direct=
ly to the
> > guest.
> > > > > > > (and that is not reason to trap and emulate other things).
> > > > > >
> > > > > > Ok, so beyond MSI-X we need to trap PRI, and we will probably
> > > > > > trap other things in the future like PASID assignment.
> > > > > PRI etc all belong to generic PCI 4K config space region.
> > > >
> > > > It's not about the capability, it's about the whole process of PRI
> > > > request handling. We've agreed that the PRI request needs to be
> > > > trapped by the hypervisor and then delivered to the vIOMMU.
> > > >
> > >
> > > > > Trap+emulation done in generic manner without involving virtio or
> > > > > Trap+other
> > > > device types.
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > how can you pass
> > > > > > > > > > through a hardware PRI request to a guest directly
> > > > > > > > > > without trapping it
> > > > > > then?
> > > > > > > > > > What's more, PCIE allows the PRI to be done in a vendor
> > > > > > > > > > (virtio) specific way, so you want to break this rule?
> > > > > > > > > > Or you want to blacklist ATS/PRI
> > > > > > > > for virtio?
> > > > > > > > > >
> > > > > > > > > I was aware of only pci-sig way of PRI.
> > > > > > > > > Do you have a reference to the ECN that enables vendor
> > > > > > > > > specific way of PRI? I
> > > > > > > > would like to read it.
> > > > > > > >
> > > > > > > > I mean it doesn't forbid us to build a virtio specific
> > > > > > > > interface for I/O page fault report and recovery.
> > > > > > > >
> > > > > > > So PRI of PCI does not allow. It is ODP kind of technique you=
 meant
> > above.
> > > > > > > Yes one can build.
> > > > > > > Ok. unrelated to device migration, so I will park this good
> > > > > > > discussion for
> > > > later.
> > > > > >
> > > > > > That's fine.
> > > > > >
> > > > > > >
> > > > > > > > > This will be very good to eliminate IOMMU PRI limitations=
.
> > > > > > > >
> > > > > > > > Probably.
> > > > > > > >
> > > > > > > > > PRI will directly go to the guest driver, and guest would
> > > > > > > > > interact with IOMMU
> > > > > > > > to service the paging request through IOMMU APIs.
> > > > > > > >
> > > > > > > > With PASID, it can't go directly.
> > > > > > > >
> > > > > > > When the request consist of PASID in it, it can.
> > > > > > > But again these PCI-SIG extensions of PASID are not related t=
o
> > > > > > > device
> > > > > > migration, so I am differing it.
> > > > > > >
> > > > > > > > > For PRI in vendor specific way needs a separate
> > > > > > > > > discussion. It is not related to
> > > > > > > > live migration.
> > > > > > > >
> > > > > > > > PRI itself is not related. But the point is, you can't
> > > > > > > > simply pass through ATS/PRI now.
> > > > > > > >
> > > > > > > Ah ok. the whole 4K PCI config space where ATS/PRI
> > > > > > > capabilities are located
> > > > > > are trapped+emulated by hypervisor.
> > > > > > > So?
> > > > > > > So do we start emulating virito interfaces too for passthroug=
h?
> > > > > > > No.
> > > > > > > Can one still continue to trap+emulate?
> > > > > > > Sure why not?
> > > > > >
> > > > > > Then let's not limit your proposal to be used by "passthrough" =
only?
> > > > > One can possibly build some variant of the existing virtio member
> > > > > device
> > > > using same owner and member scheme.
> > > >
> > > > It's not about the member/owner, it's about e.g whether the
> > > > hypervisor can trap and emulate.
> > > >
> > > > I've pointed out that what you invent here is actually a partial ne=
w
> > > > transport, for example, a hypervisor can trap and use things like
> > > > device context in PF to bypass the registers in VF. This is the ide=
a of
> > transport commands/q.
> > > >
> > > I will not mix transport commands which are mainly useful for actual =
device
> > operation for SIOV only for backward compatibility that too optionally.
> > > One may still choose to have virtio common and device config in MMIO
> > ofcourse at lower scale.
> > >
> > > Anyway, mixing migration context with actual SIOV specific thing is n=
ot correct
> > as device context is read/write incremental values.
> >
> > SIOV is transport level stuff, the transport virtqueue is designed in a=
 way that is
> > general enough to cover it. Let's not shift concepts.
> >
> Such TVQ is only for backward compatible vPCI composition.
> For ground up work such TVQ must not be done through the owner device.

That's the idea actually.

> Each SIOV device to have its own channel to communicate directly to the d=
evice.
>
> > One thing that you ignore is that, hypervisor can use what you invented=
 as a
> > transport for VF, no?
> >
> No. by design,

It works like hypervisor traps the virito config and forwards it to
admin virtqueue and starts the device via device context.

> it is not good idea to overload management commands with actual run time =
guest commands.
> The device context read writes are largely for incremental updates.

It doesn't matter if it is incremental or not but

1) the function is there
2) hypervisor can use that function if they want and virtio (spec)
can't forbid that

>
> For VF driver it has own direct channel via its own BAR to talk to the de=
vice. So no need to transport via PF.
> For SIOV for backward compat vPCI composition, it may be needed.
> Hard to say, if that can be memory mapped as well on the BAR of the PF.
> We have seen one device supporting it outside of the virtio.
> For scale anyway, one needs to use the device own cvq for complex configu=
ration.

That's the idea but I meant your current proposal overlaps those functions.

>
> > >
> > > > > If for that is some admin commands are missing, may be one can ad=
d
> > them.
> > > >
> > > > I would then build the device context commands on top of the
> > > > transport commands/q, then it would be complete.
> > > >
> > > > > No need to step on toes of use cases as they are different...
> > > > >
> > > > > > I've shown you that
> > > > > >
> > > > > > 1) you can't easily say you can pass through all the virtio
> > > > > > facilities
> > > > > > 2) how ambiguous for terminology like "passthrough"
> > > > > >
> > > > > It is not, it is well defined in v3, v2.
> > > > > One can continue to argue and keep defining the variant and still
> > > > > call it data
> > > > path acceleration and then claim it as passthrough ...
> > > > > But I won't debate this anymore as its just non-technical aspects
> > > > > of least
> > > > interest.
> > > >
> > > > You use this terminology in the spec which is all about technical,
> > > > and you think how to define it is a matter of non-technical. This i=
s
> > > > self-contradictory. If you fail, it probably means it's ambiguous.
> > > > Let's don't use that terminology.
> > > >
> > > What it means is described in theory of operation.
> > >
> > > > > We have technical tasks and more improved specs to update going
> > forward.
> > > >
> > > > It's a burden to do the synchronization.
> > > We have discussed this.
> > > In current proposed the member device is not bifurcated,
> >
> > It is. Part of the functions were carried via the PCI interface, some a=
re carried
> > via owner. You end up with two drivers to drive the devices.
> >
> Nop.
> All admin work of device migration is carried out via the owner device.
> All guest triggered work is carried out using VF itself.

Guests don't (or can't) care about how the hypervisor is structured.
So we're discussing the view of device, member devices needs to server
for

1) request from the transport (it's guest in your context)
2) request from the owner

Thanks


>
> > Thanks
> >
> >
> > > so it implements the necessary pieces.
> > > Feature !=3D burden.
> > >
> > > >
> > > > > Working on extension for device specific contexts to enrich it.
> > > >
> > > > Again, making the proposal to be general is much more beneficial.
> > >
> > > Yes, it is general and like any other device-type, each has their ext=
ensions.
> > > Infrastructure covers in v3.
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

