Return-Path: <virtio-comment-return-8051-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31563C4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 01:35:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6E22B2AEEB
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 01:35:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4A006986B66
	for <virtio-comment@archiver.kernel.org>; Tue, 31 Oct 2023 01:35:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 25B2A986B5A; Tue, 31 Oct 2023 01:35:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD479986B5B
	for <virtio-comment@lists.oasis-open.org>; Tue, 31 Oct 2023 01:35:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 4N2KNMQ8M2C8WVX_cYKZIg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698716100; x=1699320900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3+9V7FjKcbtYgJvAGaCw3/oG+C9kyncl6+l2nWlAhQ=;
        b=du74+1GE7rBCxKibqLnw5aU6Dcpgv3HMQbbPR5+ha8JH9PVi94YaFXB+yHr+fv+kVY
         3PH6rDWUoRJGSO2bCSMWQAgzIz24vNqekXvVTHZP0cdw9DFjE9v52g5HhmtFAB/ySWHV
         kO0d/51ssEf8eOvxgLOayQ9/3bubntSfdo+If5gikRgCVlg5iRvtIT7aFAEOdETbK9yb
         pnI5idOclPJqPr+6aOMzaJ0ILt9/xAaWvytYF9xIldYBUnK5wdLNRVeJWnC1di8VFouE
         g9pWJ8+FciGo1jsBOGIgK9K13k38p3mTolT2+zoXeszsXed/DY4Iyli+KG+GkcSfmiip
         Z4fg==
X-Gm-Message-State: AOJu0YxU2cBAZtL7n9ZaqtDkUGcxhHwsfjRJ+Up/J3Hv1+hpOS8NNIeE
	mWwbc1QP7sdBEFel/hulln3hNjrCLwReGlMv+nuWVsiZuE4jmQW/jGVGGjPso5Y363Xf65EA1dH
	zWm6RIhr4b0IL8OyIcmuBfJJs/hemRcxkbuOIhHpVF0UbeT0OAQ==
X-Received: by 2002:a05:6512:32b7:b0:507:9a00:d6c7 with SMTP id q23-20020a05651232b700b005079a00d6c7mr8512375lfe.33.1698716100362;
        Mon, 30 Oct 2023 18:35:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFO9pgU2U6Kuu/hPrflsyg4m7T8fx9kmTlpTH4vpGLWV1hwxCPE9eVA/QGHpOxJllnnlomzWsctYDGxrt0u2vY=
X-Received: by 2002:a05:6512:32b7:b0:507:9a00:d6c7 with SMTP id
 q23-20020a05651232b700b005079a00d6c7mr8512367lfe.33.1698716099976; Mon, 30
 Oct 2023 18:34:59 -0700 (PDT)
MIME-Version: 1.0
References: <DM8PR12MB5480FD897C13FCB2CBE15268DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEuKoamb1bn-9stEsZTA3nHwAw4jrd=jWPS6SGuUzH67FA@mail.gmail.com> <PH0PR12MB548175CD39FA20BE2727E5B6DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548175CD39FA20BE2727E5B6DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 31 Oct 2023 09:34:48 +0800
Message-ID: <CACGkMEuJySOAGguGvnBA7ftD0mwwM_M0SO0266M1+7d+XRXQ=g@mail.gmail.com>
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

On Mon, Oct 30, 2023 at 12:47=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Jason Wang
> >
> > On Thu, Oct 26, 2023 at 11:45=E2=80=AFAM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Thursday, October 26, 2023 6:16 AM
> > > >
> > > > On Wed, Oct 25, 2023 at 3:03=E2=80=AFPM Parav Pandit <parav@nvidia.=
com> wrote:
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Wednesday, October 25, 2023 6:59 AM
> > > > > > > For passthrough PASID assignment vq is not needed.
> > > > > >
> > > > > > How do you know that?
> > > > > Because for passthrough, the hypervisor is not involved in dealin=
g
> > > > > with VQ at
> > > > all.
> > > >
> > > > Ok, so if I understand correctly, you are saying your design can't
> > > > work for the case of PASID assignment.
> > > >
> > > No. PASID assignment will happen from the guest for its own use and d=
evice
> > migration will just work fine because device context will capture this.
> >
> > It's not about device context. We're discussing "passthrough", no?
> >
> Not sure, we are discussing same.
> A member device is passthrough to the guest, dealing with its own PASIDs =
and virtio interface for some VQ assignment to PASID.
> So VQ context captured by the hypervisor, will have some PASID attached t=
o this VQ.
> Device context will be updated.
>
> > You want all virtio stuff to be "passthrough", but assigning a PASID to=
 a specific
> > virtqueue in the guest must be trapped.
> >
> No. PASID assignment to a specific virtqueue in the guest must go directl=
y from guest to device.

This works like setting CR3, you can't simply let it go from guest to host.

Host IOMMU driver needs to know the PASID to program the IO page
tables correctly.

> When guest iommu may need to communicate anything for this PASID, it will=
 come through its proper IOMMU channel/hypercall.

Let's say using PASID X for queue 0, this knowledge is beyond the
IOMMU scope but belongs to virtio. Or please explain how it can work
when it goes directly from guest to device.

> Virtio device is not the conduit for this exchange.
>
> > >
> > > > >
> > > > > > There are works ongoing to make vPASID work for the guest like =
vSVA.
> > > > > > Virtio doesn't differ from other devices.
> > > > > Passthrough do not run like SVA.
> > > >
> > > > Great, you find another limitation of "passthrough" by yourself.
> > > >
> > > No. it is not the limitation it is just the way it does not need comp=
lex SVA to
> > split the device for unrelated usage.
> >
> > How can you limit the user in the guest to not use vSVA?
> >
> He he, I am not limiting, again misunderstanding or wrong attribution.
> I explained that hypervisor for passthrough does not need SVA.
> Guest can do anything it wants from the guest OS with the member device.

Ok, so the point stills, see above.

>
> > >
> > > > > Each passthrough device has PASID from its own space fully manage=
d
> > > > > by the
> > > > guest.
> > > > > Some cpu required vPASID and SIOV is not going this way anmore.
> > > >
> > > > Then how to migrate? Invent a full set of something else through
> > > > another giant series like this to migrate to the SIOV thing? That's=
 a mess for
> > sure.
> > > >
> > > SIOV will for sure reuse most or all parts of this work, almost entir=
ely as_is.
> > > vPASID is cpu/platform specific things not part of the SIOV devices.
> > >
> > > > >
> > > > > >
> > > > > > > If at all it is done, it will be done from the guest by the
> > > > > > > driver using virtio
> > > > > > interface.
> > > > > >
> > > > > > Then you need to trap. Such things couldn't be passed through t=
o
> > > > > > guests
> > > > directly.
> > > > > >
> > > > > Only PASID capability is trapped. PASID allocation and usage is
> > > > > directly from
> > > > guest.
> > > >
> > > > How can you achieve this? Assigning a PAISD to a device is
> > > > completely
> > > > device(virtio) specific. How can you use a general layer without th=
e
> > > > knowledge of virtio to trap that?
> > > When one wants to map vPASID to pPASID a platform needs to be involve=
d.
> >
> > I'm not talking about how to map vPASID to pPASID, it's out of the scop=
e of
> > virtio. I'm talking about assigning a vPASID to a specific virtqueue or=
 other virtio
> > function in the guest.
> >
> That can be done in the guest. The key is guest wont know that it is deal=
ing with vPASID.
> It will follow the same principle from your paper of equivalency, where v=
irtio software layer will assign PASID to VQ and communicate to device.
>
> Anyway, all of this just digression from current series.

It's not, as you mention that only MSI-X is trapped, I give you another one=
.

>
> > You need a virtio specific queue or capability to assign a PASID to a s=
pecific
> > virtqueue, and that can't be done without trapping and without virito s=
pecific
> > knowledge.
> >
> I disagree. PASID assignment to a virqueue in future from guest virtio dr=
iver to device is uniform method.
> Whether its PF assigning PASID to VQ of self,
> Or
> VF driver in the guest assigning PASID to VQ.
>
> All same.
> Only IOMMU layer hypercalls will know how to deal with PASID assignment a=
t platform layer to setup the domain etc table.
>
> And this is way beyond our device migration discussion.
> By any means, if you were implying that somehow vq to PASID assignment _m=
ay_ need trap+emulation, hence whole device migration to depend on some tra=
p+emulation, than surely, than I do not agree to it.

See above.

>
> PASID equivalent in mlx5 world is ODP_MR+PD isolating the guest process a=
nd all of that just works on efficiency and equivalence principle already f=
or a decade now without any trap+emulation.
>
> > > When virtio passthrough device is in guest, it has all its PASID acce=
ssible.
> > >
> > > All these is large deviation from current discussion of this series, =
so I will keep
> > it short.
> > >
> > > >
> > > > > Regardless it is not relevant to passthrough mode as PASID is yet
> > > > > another
> > > > resource.
> > > > > And for some cpu if it is trapped, it is generic layer, that does
> > > > > not require virtio
> > > > involvement.
> > > > > So virtio interface asking to trap something because generic
> > > > > facility has done
> > > > in not the approach.
> > > >
> > > > This misses the point of PASID. How to use PASID is totally device =
specific.
> > > Sure, and how to virtualize vPASID/pPASID is platform specific as sin=
gle PASID
> > can be used by multiple devices and process.
> >
> > See above, I think we're talking about different things.
> >
> > >
> > > >
> > > > >
> > > > > > > Capabilities of #2 is generic across all pci devices, so it
> > > > > > > will be handled by the
> > > > > > HV.
> > > > > > > ATS/PRI cap is also generic manner handled by the HV and PCI =
device.
> > > > > >
> > > > > > No, ATS/PRI requires the cooperation from the vIOMMU. You can
> > > > > > simply do ATS/PRI passthrough but with an emulated vIOMMU.
> > > > > And that is not the reason for virtio device to build
> > > > > trap+emulation for
> > > > passthrough member devices.
> > > >
> > > > vIOMMU is emulated by hypervisor with a PRI queue,
> > > PRI requests arrive on the PF for the VF.
> >
> > Shouldn't it arrive at platform IOMMU first? The path should be PRI -> =
RC ->
> > IOMMU -> host -> Hypervisor -> vIOMMU PRI -> guest IOMMU.
> >
> Above sequence seems write.
>
> > And things will be more complicated when (v)PASID is used. So you can't=
 simply
> > let PRI go directly to the guest with the current architecture.
> >
> In current architecture of the pci VF, PRI does not go directly to the gu=
est.
> (and that is not reason to trap and emulate other things).

Ok, so beyond MSI-X we need to trap PRI, and we will probably trap
other things in the future like PASID assignment.

>
> > >
> > > > how can you pass
> > > > through a hardware PRI request to a guest directly without trapping=
 it then?
> > > > What's more, PCIE allows the PRI to be done in a vendor (virtio)
> > > > specific way, so you want to break this rule? Or you want to blackl=
ist ATS/PRI
> > for virtio?
> > > >
> > > I was aware of only pci-sig way of PRI.
> > > Do you have a reference to the ECN that enables vendor specific way o=
f PRI? I
> > would like to read it.
> >
> > I mean it doesn't forbid us to build a virtio specific interface for I/=
O page fault
> > report and recovery.
> >
> So PRI of PCI does not allow. It is ODP kind of technique you meant above=
.
> Yes one can build.
> Ok. unrelated to device migration, so I will park this good discussion fo=
r later.

That's fine.

>
> > > This will be very good to eliminate IOMMU PRI limitations.
> >
> > Probably.
> >
> > > PRI will directly go to the guest driver, and guest would interact wi=
th IOMMU
> > to service the paging request through IOMMU APIs.
> >
> > With PASID, it can't go directly.
> >
> When the request consist of PASID in it, it can.
> But again these PCI-SIG extensions of PASID are not related to device mig=
ration, so I am differing it.
>
> > > For PRI in vendor specific way needs a separate discussion. It is not=
 related to
> > live migration.
> >
> > PRI itself is not related. But the point is, you can't simply pass thro=
ugh ATS/PRI
> > now.
> >
> Ah ok. the whole 4K PCI config space where ATS/PRI capabilities are locat=
ed are trapped+emulated by hypervisor.
> So?
> So do we start emulating virito interfaces too for passthrough?
> No.
> Can one still continue to trap+emulate?
> Sure why not?

Then let's not limit your proposal to be used by "passthrough" only?
I've shown you that

1) you can't easily say you can pass through all the virtio facilities
2) how ambiguous for terminology like "passthrough"

Thanks

>
> Can one use AQ of this proposal to do so?
> Sure, why not?


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

