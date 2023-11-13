Return-Path: <virtio-comment-return-8334-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A06C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:33:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 9FDC82A893
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:33:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9098D9867DD
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:33:14 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 83E0B9865BA; Mon, 13 Nov 2023 03:33:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 74BB19865BD
	for <virtio-comment@lists.oasis-open.org>; Mon, 13 Nov 2023 03:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: KgoSTR0ZPEO6W-3WLj6DfQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699846388; x=1700451188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SylQM26F7H7VCGVCZD3vwNsUve2ZusP/P0MxRnAqDFg=;
        b=H169CGXaBzh0So/4KFVKlUE330VHpEIx3f2w9Fr/qXWaDSKOZrCx5inwmmOS4WejCH
         6X/VhNBwsAFdDobRNCwKenELyFOQHwks355tWW2DfU6KDYut8ZOXBydr/FOeVAfvynl8
         QvYy9/zzr0vW+OFaUvIQ54hicL9lr8kxFYAvi5f6IIuwVSFlQ3QS+4bm9Faysn+206tI
         ZEEGBzstRmvEBZfCA2Z87Myz0gp3dbMCkpRJ20RSdK5eNjqH1ifQGDeje1EEKXHRQq4e
         d11aYerSm99Ssu2UW7djNJoavMVkuK+ANs6U0HehzjjcFosa6E6GojhnZHsFmE5nXBZY
         2i9g==
X-Gm-Message-State: AOJu0Yyeo0bfOzQWdKUgtEdKxa0zgFn4EJSP0/pqSBrDkywtp0uBt+lE
	ea0Y/Ybn/s+4Jftx+jP4hl+w6XUHjeMn5s/0HEPJrpkas3FkvA6Kqky5vocvVtB93DO1sklEvad
	qt/bCI+5j+K9QR7mpU8vj8buSRS0gZ8W2lZBdlW30uijRfP5JfP4c/hwetg==
X-Received: by 2002:a19:6750:0:b0:504:4165:54ab with SMTP id e16-20020a196750000000b00504416554abmr3514631lfj.56.1699846388241;
        Sun, 12 Nov 2023 19:33:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8cXo/elTRCJSTrVbv/7IJzt/fD3LirMabIUXyKD8JT2pDQ91bNyswCRV2/VDjNRGLjpfI6RdTr4c4Onzl/oA=
X-Received: by 2002:a19:6750:0:b0:504:4165:54ab with SMTP id
 e16-20020a196750000000b00504416554abmr3514616lfj.56.1699846387613; Sun, 12
 Nov 2023 19:33:07 -0800 (PST)
MIME-Version: 1.0
References: <DM8PR12MB5480FD897C13FCB2CBE15268DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEuKoamb1bn-9stEsZTA3nHwAw4jrd=jWPS6SGuUzH67FA@mail.gmail.com>
 <PH0PR12MB548175CD39FA20BE2727E5B6DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuJySOAGguGvnBA7ftD0mwwM_M0SO0266M1+7d+XRXQ=g@mail.gmail.com>
 <PH0PR12MB5481ABD71DAF7D82931D57D2DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu0gfw4zNc9KTLm9ekhuWgsgzHLVya_68HajQZObtr3-w@mail.gmail.com>
 <DM8PR12MB54808B71AA9C0A945D0A3226DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com> <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 13 Nov 2023 11:32:55 +0800
Message-ID: <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
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

On Thu, Nov 9, 2023 at 2:25=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, November 7, 2023 9:35 AM
> >
> > On Mon, Nov 6, 2023 at 3:05=E2=80=AFPM Parav Pandit <parav@nvidia.com> =
wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Monday, November 6, 2023 12:05 PM
> > > >
> > > > On Thu, Nov 2, 2023 at 2:10=E2=80=AFPM Parav Pandit <parav@nvidia.c=
om> wrote:
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Thursday, November 2, 2023 9:56 AM
> > > > > >
> > > > > > On Wed, Nov 1, 2023 at 11:32=E2=80=AFAM Parav Pandit <parav@nvi=
dia.com>
> > wrote:
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Wednesday, November 1, 2023 6:04 AM
> > > > > > > >
> > > > > > > > On Tue, Oct 31, 2023 at 1:30=E2=80=AFPM Parav Pandit
> > > > > > > > <parav@nvidia.com>
> > > > wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > Sent: Tuesday, October 31, 2023 7:05 AM
> > > > > > > > > >
> > > > > > > > > > On Mon, Oct 30, 2023 at 12:47=E2=80=AFPM Parav Pandit
> > > > > > > > > > <parav@nvidia.com>
> > > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > From: virtio-comment@lists.oasis-open.org
> > > > > > > > > > > > <virtio-comment@lists.oasis- open.org> On Behalf Of
> > > > > > > > > > > > Jason Wang
> > > > > > > > > > > >
> > > > > > > > > > > > On Thu, Oct 26, 2023 at 11:45=E2=80=AFAM Parav Pand=
it
> > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > > > Sent: Thursday, October 26, 2023 6:16 AM
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Wed, Oct 25, 2023 at 3:03=E2=80=AFPM Parav P=
andit
> > > > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > > > wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > > > > > Sent: Wednesday, October 25, 2023 6:59 AM
> > > > > > > > > > > > > > > > > For passthrough PASID assignment vq is no=
t needed.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > How do you know that?
> > > > > > > > > > > > > > > Because for passthrough, the hypervisor is no=
t
> > > > > > > > > > > > > > > involved in dealing with VQ at
> > > > > > > > > > > > > > all.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Ok, so if I understand correctly, you are sayin=
g
> > > > > > > > > > > > > > your design can't work for the case of PASID as=
signment.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > No. PASID assignment will happen from the guest
> > > > > > > > > > > > > for its own use and device
> > > > > > > > > > > > migration will just work fine because device contex=
t
> > > > > > > > > > > > will capture
> > > > this.
> > > > > > > > > > > >
> > > > > > > > > > > > It's not about device context. We're discussing
> > > > > > > > > > > > "passthrough",
> > > > no?
> > > > > > > > > > > >
> > > > > > > > > > > Not sure, we are discussing same.
> > > > > > > > > > > A member device is passthrough to the guest, dealing
> > > > > > > > > > > with its own PASIDs and
> > > > > > > > > > virtio interface for some VQ assignment to PASID.
> > > > > > > > > > > So VQ context captured by the hypervisor, will have
> > > > > > > > > > > some PASID attached to
> > > > > > > > > > this VQ.
> > > > > > > > > > > Device context will be updated.
> > > > > > > > > > >
> > > > > > > > > > > > You want all virtio stuff to be "passthrough", but
> > > > > > > > > > > > assigning a PASID to a specific virtqueue in the
> > > > > > > > > > > > guest must be
> > > > trapped.
> > > > > > > > > > > >
> > > > > > > > > > > No. PASID assignment to a specific virtqueue in the
> > > > > > > > > > > guest must go directly
> > > > > > > > > > from guest to device.
> > > > > > > > > >
> > > > > > > > > > This works like setting CR3, you can't simply let it go
> > > > > > > > > > from guest to
> > > > host.
> > > > > > > > > >
> > > > > > > > > > Host IOMMU driver needs to know the PASID to program th=
e
> > > > > > > > > > IO page tables correctly.
> > > > > > > > > >
> > > > > > > > > This will be done by the IOMMU.
> > > > > > > > >
> > > > > > > > > > > When guest iommu may need to communicate anything for
> > > > > > > > > > > this PASID, it will
> > > > > > > > > > come through its proper IOMMU channel/hypercall.
> > > > > > > > > >
> > > > > > > > > > Let's say using PASID X for queue 0, this knowledge is
> > > > > > > > > > beyond the IOMMU scope but belongs to virtio. Or please
> > > > > > > > > > explain how it can work when it goes directly from gues=
t to
> > device.
> > > > > > > > > >
> > > > > > > > > We are yet to ever see spec for PASID to VQ assignment.
> > > > > > > >
> > > > > > > > It has one.
> > > > > > > >
> > > > > > > > > For ok for theory sake it is there.
> > > > > > > > >
> > > > > > > > > Virtio driver will assign the PASID directly from guest
> > > > > > > > > driver to device using a
> > > > > > > > create_vq(pasid=3DX) command.
> > > > > > > > > Same process is somehow attached the PASID by the guest O=
S.
> > > > > > > > > The whole PASID range is known to the hypervisor when the
> > > > > > > > > device is handed
> > > > > > > > over to the guest VM.
> > > > > > > >
> > > > > > > > How can it know?
> > > > > > > >
> > > > > > > > > So PASID mapping is setup by the hypervisor IOMMU at this=
 point.
> > > > > > > >
> > > > > > > > You disallow the PASID to be virtualized here. What's more,
> > > > > > > > such a PASID passthrough has security implications.
> > > > > > > >
> > > > > > > No. virtio spec is not disallowing. At least for sure, this
> > > > > > > series is not the
> > > > one.
> > > > > > > My main point is, virtio device interface will not be the
> > > > > > > source of hypercall to
> > > > > > program IOMMU in the hypervisor.
> > > > > > > It is something to be done by IOMMU side.
> > > > > >
> > > > > > So unless vPASID can be used by the hardware you need to trap
> > > > > > the mapping from a PASID to a virtqueue. Then you need virtio
> > > > > > specific
> > > > knowledge.
> > > > > >
> > > > > vPASID by hardware is unlikely to be used by hw PCI EP devices at
> > > > > least in any
> > > > near term future.
> > > > > This requires either vPASID to pPASID table in device or in IOMMU=
.
> > > >
> > > > So we are on the same page.
> > > >
> > > > Claiming a method that can only work for passthrough or emulation i=
s not
> > good.
> > > > We all know virtualization is passthrough + emulation.
> > > Again, I agree but I wont generalize it here.
> > >
> > > >
> > > > >
> > > > > > >
> > > > > > > > Again, we are talking about different things, I've tried to
> > > > > > > > show you that there are cases that passthrough can't work
> > > > > > > > but if you think the only way for migration is to use
> > > > > > > > passthrough in every case, you will
> > > > > > probably fail.
> > > > > > > >
> > > > > > > I didn't say only way for migration is passthrough.
> > > > > > > Passthrough is clearly one way.
> > > > > > > Other ways may be possible.
> > > > > > >
> > > > > > > > >
> > > > > > > > > > > Virtio device is not the conduit for this exchange.
> > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > There are works ongoing to make vPASID work
> > > > > > > > > > > > > > > > for the guest like
> > > > > > > > > > vSVA.
> > > > > > > > > > > > > > > > Virtio doesn't differ from other devices.
> > > > > > > > > > > > > > > Passthrough do not run like SVA.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Great, you find another limitation of
> > > > > > > > > > > > > > "passthrough" by
> > > > yourself.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > No. it is not the limitation it is just the way i=
t
> > > > > > > > > > > > > does not need complex SVA to
> > > > > > > > > > > > split the device for unrelated usage.
> > > > > > > > > > > >
> > > > > > > > > > > > How can you limit the user in the guest to not use =
vSVA?
> > > > > > > > > > > >
> > > > > > > > > > > He he, I am not limiting, again misunderstanding or
> > > > > > > > > > > wrong
> > > > attribution.
> > > > > > > > > > > I explained that hypervisor for passthrough does not =
need SVA.
> > > > > > > > > > > Guest can do anything it wants from the guest OS with
> > > > > > > > > > > the member
> > > > > > > > device.
> > > > > > > > > >
> > > > > > > > > > Ok, so the point stills, see above.
> > > > > > > > >
> > > > > > > > > I don=E2=80=99t think so. The guest owns its PASID space
> > > > > > > >
> > > > > > > > Again, vPASID to PASID can't be done hardware unless I miss
> > > > > > > > some recent features of IOMMUs.
> > > > > > > >
> > > > > > > Cpu vendors have different way of doing vPASID to pPASID.
> > > > > >
> > > > > > At least for the current version of major IOMMU vendors, such
> > > > > > translation (aka PASID remapping) is not implemented in the
> > > > > > hardware so it needs to be trapped first.
> > > > > >
> > > > > Right. So it is really far in future, atleast few years away.
> > > > >
> > > > > > > It is still an early space for virtio.
> > > > > > >
> > > > > > > > > and directly communicates like any other device attribute=
.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > > Each passthrough device has PASID from its ow=
n
> > > > > > > > > > > > > > > space fully managed by the
> > > > > > > > > > > > > > guest.
> > > > > > > > > > > > > > > Some cpu required vPASID and SIOV is not goin=
g
> > > > > > > > > > > > > > > this way
> > > > > > anmore.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Then how to migrate? Invent a full set of
> > > > > > > > > > > > > > something else through another giant series lik=
e
> > > > > > > > > > > > > > this to migrate to the SIOV
> > > > > > thing?
> > > > > > > > > > > > > > That's a mess for
> > > > > > > > > > > > sure.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > SIOV will for sure reuse most or all parts of thi=
s
> > > > > > > > > > > > > work, almost entirely
> > > > > > > > as_is.
> > > > > > > > > > > > > vPASID is cpu/platform specific things not part o=
f
> > > > > > > > > > > > > the SIOV
> > > > devices.
> > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > If at all it is done, it will be done fro=
m
> > > > > > > > > > > > > > > > > the guest by the driver using virtio
> > > > > > > > > > > > > > > > interface.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Then you need to trap. Such things couldn't
> > > > > > > > > > > > > > > > be passed through to guests
> > > > > > > > > > > > > > directly.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Only PASID capability is trapped. PASID
> > > > > > > > > > > > > > > allocation and usage is directly from
> > > > > > > > > > > > > > guest.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > How can you achieve this? Assigning a PAISD to =
a
> > > > > > > > > > > > > > device is completely
> > > > > > > > > > > > > > device(virtio) specific. How can you use a
> > > > > > > > > > > > > > general layer without the knowledge of virtio t=
o trap that?
> > > > > > > > > > > > > When one wants to map vPASID to pPASID a platform
> > > > > > > > > > > > > needs to be
> > > > > > > > > > involved.
> > > > > > > > > > > >
> > > > > > > > > > > > I'm not talking about how to map vPASID to pPASID,
> > > > > > > > > > > > it's out of the scope of virtio. I'm talking about
> > > > > > > > > > > > assigning a vPASID to a specific virtqueue or other
> > > > > > > > > > > > virtio function in the
> > > > guest.
> > > > > > > > > > > >
> > > > > > > > > > > That can be done in the guest. The key is guest wont
> > > > > > > > > > > know that it is dealing
> > > > > > > > > > with vPASID.
> > > > > > > > > > > It will follow the same principle from your paper of
> > > > > > > > > > > equivalency, where virtio
> > > > > > > > > > software layer will assign PASID to VQ and communicate =
to
> > device.
> > > > > > > > > > >
> > > > > > > > > > > Anyway, all of this just digression from current seri=
es.
> > > > > > > > > >
> > > > > > > > > > It's not, as you mention that only MSI-X is trapped, I
> > > > > > > > > > give you another
> > > > > > one.
> > > > > > > > > >
> > > > > > > > > PASID access from the guest to be done fully by the guest=
 IOMMU.
> > > > > > > > > Not by virtio devices.
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > You need a virtio specific queue or capability to
> > > > > > > > > > > > assign a PASID to a specific virtqueue, and that
> > > > > > > > > > > > can't be done without trapping and without virito s=
pecific
> > knowledge.
> > > > > > > > > > > >
> > > > > > > > > > > I disagree. PASID assignment to a virqueue in future
> > > > > > > > > > > from guest virtio driver to
> > > > > > > > > > device is uniform method.
> > > > > > > > > > > Whether its PF assigning PASID to VQ of self, Or VF
> > > > > > > > > > > driver in the guest assigning PASID to VQ.
> > > > > > > > > > >
> > > > > > > > > > > All same.
> > > > > > > > > > > Only IOMMU layer hypercalls will know how to deal wit=
h
> > > > > > > > > > > PASID assignment at
> > > > > > > > > > platform layer to setup the domain etc table.
> > > > > > > > > > >
> > > > > > > > > > > And this is way beyond our device migration discussio=
n.
> > > > > > > > > > > By any means, if you were implying that somehow vq to
> > > > > > > > > > > PASID assignment
> > > > > > > > > > _may_ need trap+emulation, hence whole device migration
> > > > > > > > > > to depend on some
> > > > > > > > > > trap+emulation, than surely, than I do not agree to it.
> > > > > > > > > >
> > > > > > > > > > See above.
> > > > > > > > > >
> > > > > > > > > Yeah, I disagree to such implying.
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > PASID equivalent in mlx5 world is ODP_MR+PD isolating
> > > > > > > > > > > the guest process and
> > > > > > > > > > all of that just works on efficiency and equivalence
> > > > > > > > > > principle already for a decade now without any trap+emu=
lation.
> > > > > > > > > > >
> > > > > > > > > > > > > When virtio passthrough device is in guest, it ha=
s
> > > > > > > > > > > > > all its PASID
> > > > > > > > accessible.
> > > > > > > > > > > > >
> > > > > > > > > > > > > All these is large deviation from current
> > > > > > > > > > > > > discussion of this series, so I will keep
> > > > > > > > > > > > it short.
> > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Regardless it is not relevant to passthrough
> > > > > > > > > > > > > > > mode as PASID is yet another
> > > > > > > > > > > > > > resource.
> > > > > > > > > > > > > > > And for some cpu if it is trapped, it is
> > > > > > > > > > > > > > > generic layer, that does not require virtio
> > > > > > > > > > > > > > involvement.
> > > > > > > > > > > > > > > So virtio interface asking to trap something
> > > > > > > > > > > > > > > because generic facility has done
> > > > > > > > > > > > > > in not the approach.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > This misses the point of PASID. How to use PASI=
D
> > > > > > > > > > > > > > is totally device
> > > > > > > > > > specific.
> > > > > > > > > > > > > Sure, and how to virtualize vPASID/pPASID is
> > > > > > > > > > > > > platform specific as single PASID
> > > > > > > > > > > > can be used by multiple devices and process.
> > > > > > > > > > > >
> > > > > > > > > > > > See above, I think we're talking about different th=
ings.
> > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > Capabilities of #2 is generic across all
> > > > > > > > > > > > > > > > > pci devices, so it will be handled by the
> > > > > > > > > > > > > > > > HV.
> > > > > > > > > > > > > > > > > ATS/PRI cap is also generic manner handle=
d
> > > > > > > > > > > > > > > > > by the HV and PCI
> > > > > > > > > > device.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > No, ATS/PRI requires the cooperation from t=
he
> > vIOMMU.
> > > > > > > > > > > > > > > > You can simply do ATS/PRI passthrough but
> > > > > > > > > > > > > > > > with an emulated
> > > > > > > > vIOMMU.
> > > > > > > > > > > > > > > And that is not the reason for virtio device
> > > > > > > > > > > > > > > to build
> > > > > > > > > > > > > > > trap+emulation for
> > > > > > > > > > > > > > passthrough member devices.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > vIOMMU is emulated by hypervisor with a PRI
> > > > > > > > > > > > > > queue,
> > > > > > > > > > > > > PRI requests arrive on the PF for the VF.
> > > > > > > > > > > >
> > > > > > > > > > > > Shouldn't it arrive at platform IOMMU first? The
> > > > > > > > > > > > path should be PRI
> > > > > > > > > > > > -> RC -> IOMMU -> host -> Hypervisor -> vIOMMU PRI
> > > > > > > > > > > > -> -> guest
> > > > > > IOMMU.
> > > > > > > > > > > >
> > > > > > > > > > > Above sequence seems write.
> > > > > > > > > > >
> > > > > > > > > > > > And things will be more complicated when (v)PASID i=
s used.
> > > > > > > > > > > > So you can't simply let PRI go directly to the gues=
t
> > > > > > > > > > > > with the current
> > > > > > > > architecture.
> > > > > > > > > > > >
> > > > > > > > > > > In current architecture of the pci VF, PRI does not g=
o
> > > > > > > > > > > directly to the
> > > > > > guest.
> > > > > > > > > > > (and that is not reason to trap and emulate other thi=
ngs).
> > > > > > > > > >
> > > > > > > > > > Ok, so beyond MSI-X we need to trap PRI, and we will
> > > > > > > > > > probably trap other things in the future like PASID ass=
ignment.
> > > > > > > > > PRI etc all belong to generic PCI 4K config space region.
> > > > > > > >
> > > > > > > > It's not about the capability, it's about the whole process
> > > > > > > > of PRI request handling. We've agreed that the PRI request
> > > > > > > > needs to be trapped by the hypervisor and then delivered to=
 the
> > vIOMMU.
> > > > > > > >
> > > > > > >
> > > > > > > > > Trap+emulation done in generic manner without involving
> > > > > > > > > Trap+virtio or other
> > > > > > > > device types.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > how can you pass through a hardware PRI request
> > > > > > > > > > > > > > to a guest directly without trapping it
> > > > > > > > > > then?
> > > > > > > > > > > > > > What's more, PCIE allows the PRI to be done in =
a
> > > > > > > > > > > > > > vendor
> > > > > > > > > > > > > > (virtio) specific way, so you want to break thi=
s rule?
> > > > > > > > > > > > > > Or you want to blacklist ATS/PRI
> > > > > > > > > > > > for virtio?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > I was aware of only pci-sig way of PRI.
> > > > > > > > > > > > > Do you have a reference to the ECN that enables
> > > > > > > > > > > > > vendor specific way of PRI? I
> > > > > > > > > > > > would like to read it.
> > > > > > > > > > > >
> > > > > > > > > > > > I mean it doesn't forbid us to build a virtio
> > > > > > > > > > > > specific interface for I/O page fault report and re=
covery.
> > > > > > > > > > > >
> > > > > > > > > > > So PRI of PCI does not allow. It is ODP kind of
> > > > > > > > > > > technique you meant
> > > > > > above.
> > > > > > > > > > > Yes one can build.
> > > > > > > > > > > Ok. unrelated to device migration, so I will park thi=
s
> > > > > > > > > > > good discussion for
> > > > > > > > later.
> > > > > > > > > >
> > > > > > > > > > That's fine.
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > > This will be very good to eliminate IOMMU PRI lim=
itations.
> > > > > > > > > > > >
> > > > > > > > > > > > Probably.
> > > > > > > > > > > >
> > > > > > > > > > > > > PRI will directly go to the guest driver, and
> > > > > > > > > > > > > guest would interact with IOMMU
> > > > > > > > > > > > to service the paging request through IOMMU APIs.
> > > > > > > > > > > >
> > > > > > > > > > > > With PASID, it can't go directly.
> > > > > > > > > > > >
> > > > > > > > > > > When the request consist of PASID in it, it can.
> > > > > > > > > > > But again these PCI-SIG extensions of PASID are not
> > > > > > > > > > > related to device
> > > > > > > > > > migration, so I am differing it.
> > > > > > > > > > >
> > > > > > > > > > > > > For PRI in vendor specific way needs a separate
> > > > > > > > > > > > > discussion. It is not related to
> > > > > > > > > > > > live migration.
> > > > > > > > > > > >
> > > > > > > > > > > > PRI itself is not related. But the point is, you
> > > > > > > > > > > > can't simply pass through ATS/PRI now.
> > > > > > > > > > > >
> > > > > > > > > > > Ah ok. the whole 4K PCI config space where ATS/PRI
> > > > > > > > > > > capabilities are located
> > > > > > > > > > are trapped+emulated by hypervisor.
> > > > > > > > > > > So?
> > > > > > > > > > > So do we start emulating virito interfaces too for pa=
ssthrough?
> > > > > > > > > > > No.
> > > > > > > > > > > Can one still continue to trap+emulate?
> > > > > > > > > > > Sure why not?
> > > > > > > > > >
> > > > > > > > > > Then let's not limit your proposal to be used by "passt=
hrough"
> > only?
> > > > > > > > > One can possibly build some variant of the existing virti=
o
> > > > > > > > > member device
> > > > > > > > using same owner and member scheme.
> > > > > > > >
> > > > > > > > It's not about the member/owner, it's about e.g whether the
> > > > > > > > hypervisor can trap and emulate.
> > > > > > > >
> > > > > > > > I've pointed out that what you invent here is actually a
> > > > > > > > partial new transport, for example, a hypervisor can trap
> > > > > > > > and use things like device context in PF to bypass the
> > > > > > > > registers in VF. This is the idea of
> > > > > > transport commands/q.
> > > > > > > >
> > > > > > > I will not mix transport commands which are mainly useful for
> > > > > > > actual device
> > > > > > operation for SIOV only for backward compatibility that too opt=
ionally.
> > > > > > > One may still choose to have virtio common and device config
> > > > > > > in MMIO
> > > > > > ofcourse at lower scale.
> > > > > > >
> > > > > > > Anyway, mixing migration context with actual SIOV specific
> > > > > > > thing is not correct
> > > > > > as device context is read/write incremental values.
> > > > > >
> > > > > > SIOV is transport level stuff, the transport virtqueue is
> > > > > > designed in a way that is general enough to cover it. Let's not=
 shift
> > concepts.
> > > > > >
> > > > > Such TVQ is only for backward compatible vPCI composition.
> > > > > For ground up work such TVQ must not be done through the owner
> > device.
> > > >
> > > > That's the idea actually.
> > > >
> > > > > Each SIOV device to have its own channel to communicate directly
> > > > > to the
> > > > device.
> > > > >
> > > > > > One thing that you ignore is that, hypervisor can use what you
> > > > > > invented as a transport for VF, no?
> > > > > >
> > > > > No. by design,
> > > >
> > > > It works like hypervisor traps the virito config and forwards it to
> > > > admin virtqueue and starts the device via device context.
> > > It needs more granular support than the management framework of devic=
e
> > context.
> >
> > It doesn't otherwise it is a design defect as you can't recover the dev=
ice context
> > in the destination.
> >
> > Let me give you an example:
> >
> > 1) in the case of live migration, dst receive migration byte flows and =
convert
> > them into device context
> > 2) in the case of transporting, hypervisor traps virtio config and conv=
ert them
> > into the device context
> >
> > I don't see anything different in this case. Or can you give me an exam=
ple?
> In #1 dst received byte flows one or multiple times.

How can this be different?

Transport can also receive initial state incrementally.

> And byte flows can be large.

So when doing transport, it is not that large, that's it. If it can
work with large byte flow, why can't it work for small?

> So it does not always contain everything. It only contains the new delta =
of the device context.

Isn't it just how current PCI transport does?

Guest configure the following one by one:

1) vq size
2) vq addresses
3) MSI-X

etc?

> For example, VQ configuration is exchanged once between src and dst.
> But VQ avail and used index may be updated multiple times.

If it can work with multiple times of updating, why can't it work if
we just update it once?

> So here hypervisor do not want to read any specific set of fields and hyp=
ervisor is not parsing them either.
> It is just a byte stream for it.

Firstly, spec must define the device context format, so hypervisor can
understand which byte is what otherwise you can't maintain migration
compatibility.
Secondly, you can't mandate how the hypervisor is written.

>
> As opposed to that, in case of transport, the guest explicitly asks to re=
ad or write specific bytes.
> Therefore, it is not incremental.

I'm totally lost. Which part of the transport is not incremental?

>
> Additionally, if hypervisor has put the trap on virtio config, and becaus=
e the memory device already has the interface for virtio config,
>
> Hypervisor can directly write/read from the virtual config to the member'=
s config space, without going through the device context, right?

If it can do it or it can choose to not. I don't see how it is related
to the discussion here.

>
> >
> > >
> > > >
> > > > > it is not good idea to overload management commands with actual
> > > > > run time
> > > > guest commands.
> > > > > The device context read writes are largely for incremental update=
s.
> > > >
> > > > It doesn't matter if it is incremental or not but
> > > >
> > > It does because you want different functionality only for purpose of =
backward
> > compatibility.
> > > That also if the device does not offer them as portion of MMIO BAR.
> >
> > I don't see how it is related to the "incremental part".
> >
> > >
> > > > 1) the function is there
> > > > 2) hypervisor can use that function if they want and virtio (spec)
> > > > can't forbid that
> > > >
> > > It is not about forbidding or supporting.
> > > Its about what functionality to use for management plane and guest pl=
ane.
> > > Both have different needs.
> >
> > People can have different views, there's nothing we can prevent a hyper=
visor
> > from using it as a transport as far as I can see.
> For device context write command, it can be used (or probably abused) to =
do write but I fail to see why to use it.

The function is there, you can't prevent people from doing that.

> Because member device already has the interface to do config read/write a=
nd it is accessible to the hypervisor.

Well, it looks self-contradictory again. Are you saying another set of
commands that is similar to device context is needed for non-PCI
transport?

>
> The read as_is using device context cannot be done because the caller is =
not explicitly asking what to read.
> And the interface does not have it, because member device has it.
>
> So lets find the need if incremental bit is needed in the device_Context =
read command or not or a bits to ask explicitly what to read optionally.
>
> >
> > >
> > > > >
> > > > > For VF driver it has own direct channel via its own BAR to talk t=
o the
> > device.
> > > > So no need to transport via PF.
> > > > > For SIOV for backward compat vPCI composition, it may be needed.
> > > > > Hard to say, if that can be memory mapped as well on the BAR of t=
he PF.
> > > > > We have seen one device supporting it outside of the virtio.
> > > > > For scale anyway, one needs to use the device own cvq for complex
> > > > configuration.
> > > >
> > > > That's the idea but I meant your current proposal overlaps those fu=
nctions.
> > > >
> > > Not really. One can have simple virtio config space access read/write
> > functionality, in addition to what is done here.
> > > And that is still fine. One is doing proxying for guest.
> > > Management plane is doing more than just register proxy.
> >
> > See above, let's figure out whether it is possible as a transport first=
 then.
> >
> Right. lets figure out.
>
> I would still promote to not mix management command with transport comman=
d.

It's not a mixing, it's just because they are functional equivalents.

> Commands are cheap in nature. For transport if needed, they can be explic=
it commands.

It will be a partial duplication of what is being proposed here.

Thanks



>
> > >
> > > > >
> > > > > > >
> > > > > > > > > If for that is some admin commands are missing, may be on=
e
> > > > > > > > > can add
> > > > > > them.
> > > > > > > >
> > > > > > > > I would then build the device context commands on top of th=
e
> > > > > > > > transport commands/q, then it would be complete.
> > > > > > > >
> > > > > > > > > No need to step on toes of use cases as they are differen=
t...
> > > > > > > > >
> > > > > > > > > > I've shown you that
> > > > > > > > > >
> > > > > > > > > > 1) you can't easily say you can pass through all the
> > > > > > > > > > virtio facilities
> > > > > > > > > > 2) how ambiguous for terminology like "passthrough"
> > > > > > > > > >
> > > > > > > > > It is not, it is well defined in v3, v2.
> > > > > > > > > One can continue to argue and keep defining the variant
> > > > > > > > > and still call it data
> > > > > > > > path acceleration and then claim it as passthrough ...
> > > > > > > > > But I won't debate this anymore as its just non-technical
> > > > > > > > > aspects of least
> > > > > > > > interest.
> > > > > > > >
> > > > > > > > You use this terminology in the spec which is all about
> > > > > > > > technical, and you think how to define it is a matter of
> > > > > > > > non-technical. This is self-contradictory. If you fail, it
> > > > > > > > probably means it's
> > > > ambiguous.
> > > > > > > > Let's don't use that terminology.
> > > > > > > >
> > > > > > > What it means is described in theory of operation.
> > > > > > >
> > > > > > > > > We have technical tasks and more improved specs to update
> > > > > > > > > going
> > > > > > forward.
> > > > > > > >
> > > > > > > > It's a burden to do the synchronization.
> > > > > > > We have discussed this.
> > > > > > > In current proposed the member device is not bifurcated,
> > > > > >
> > > > > > It is. Part of the functions were carried via the PCI interface=
,
> > > > > > some are carried via owner. You end up with two drivers to driv=
e
> > > > > > the
> > > > devices.
> > > > > >
> > > > > Nop.
> > > > > All admin work of device migration is carried out via the owner d=
evice.
> > > > > All guest triggered work is carried out using VF itself.
> > > >
> > > > Guests don't (or can't) care about how the hypervisor is structured=
.
> > > For passthrough mode, it just cannot be structured inside the VF.
> >
> > Well, again, we are talking about different things.
> >
> > >
> > > > So we're discussing the view of device, member devices needs to
> > > > server for
> > > >
> > > > 1) request from the transport (it's guest in your context)
> > > > 2) request from the owner
> > >
> > > Doing #2 of the owner on the member device functionality do not work =
when
> > hypervisor do not have access to the member device.
> >
> > I don't get here, isn't 2) just what we invent for admin commands?
> > Driver sends commands to the owner, owner forward those requests to the
> > member?
> I am most with the term "driver" without notion of guest/hypervisor prefi=
x.
>
> In one model,
> Member device does everything through its native interface =3D virtio con=
fig and device space, cvq, data vqs etc.
> Here member device do not forward anything to its owner.
>
> The live migration hypervisor driver who has the knowledge of live migrat=
ion flow, accesses the owner device and get the side band member's informat=
ion to control it.
> So member driver do not forward anything here to owner driver.
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

