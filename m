Return-Path: <virtio-comment-return-8493-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33909C54FB9
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 07:24:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 832EC2AED9
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 07:24:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6433498688A
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 07:24:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 47DFA986191; Tue, 21 Nov 2023 07:24:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2D54C986875
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 07:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: qDukqIT-Oyil6Z0sggUjTw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700551465; x=1701156265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+3yUyVDvipGrx6cqceGganCc3uRc62gMnZ3K+vRi/Q=;
        b=I/kqhPUSrTRx3jYS+tgefBtPPgF/sz0TgiFoSHGS8j521FeciKeZsWFR5jlkW9fKMH
         r1rzSRRoyfc0r5CntjbrOhIQUYJR2/sgGhfFmcPPQwSWvxAq9L333O0NIdl5510vSV54
         frP7BCpViKp1C5lUeXMfUIbAYXUKYaqU88zEO98wVbUsWy618ZiWdwjY4UySOQ9ZZHc9
         vxif5XCwWHxO+iHZMs47hXXb6tslXTBO27v6H0Dlq54KTXM4uWwz4aZGCgGsyuH1echi
         XzFT1KmvObGkNSEa1vO88DFVSWy5PVPGYJ/YjMO8tyEbFkUF4O/OyzLuyJuV15MjiRyE
         vyqA==
X-Gm-Message-State: AOJu0YwkE//G8hg19jz5n9RLc0NHCj7GE5YKbU5JZKCBZQ3ZOxuLXJG1
	mvbwPjYlxS/pBxxUltM6TKzOcgr2Pc0mRJhoHpPybb+fO4Ra7SUkGY5NMkepLLjYM9jOhiICbuX
	vU2M28TnGt2gXsYsNERvhVl8Ixn2j6YySyMFXPYwdY38d0SIdbA==
X-Received: by 2002:ac2:44a9:0:b0:507:a9b7:f071 with SMTP id c9-20020ac244a9000000b00507a9b7f071mr6263395lfm.1.1700551464932;
        Mon, 20 Nov 2023 23:24:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpgqUfMR33Ynh9Ck3rmtL5IyvHcKXQeLj2Nj+TQoZxDyP6RIxqzW6NXNkZmKxyCily/+ryikAq7rg+DmVREXg=
X-Received: by 2002:ac2:44a9:0:b0:507:a9b7:f071 with SMTP id
 c9-20020ac244a9000000b00507a9b7f071mr6263382lfm.1.1700551464318; Mon, 20 Nov
 2023 23:24:24 -0800 (PST)
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
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com> <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Nov 2023 15:24:12 +0800
Message-ID: <CACGkMEsdiCrSwFyC19PVnSCCXSabZ1G=3V-oQ=h=2sMaj=NcmQ@mail.gmail.com>
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

On Thu, Nov 16, 2023 at 1:28=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, November 16, 2023 9:50 AM
> >
> > On Thu, Nov 16, 2023 at 1:39=E2=80=AFAM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Monday, November 13, 2023 9:03 AM
> > > >
> > > > On Thu, Nov 9, 2023 at 2:25=E2=80=AFPM Parav Pandit <parav@nvidia.c=
om> wrote:
> > > > >
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Tuesday, November 7, 2023 9:35 AM
> > > > > >
> > > > > > On Mon, Nov 6, 2023 at 3:05=E2=80=AFPM Parav Pandit <parav@nvid=
ia.com>
> > wrote:
> > > > > > >
> > > > > > >
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Monday, November 6, 2023 12:05 PM
> > > > > > > >
> > > > > > > > On Thu, Nov 2, 2023 at 2:10=E2=80=AFPM Parav Pandit
> > > > > > > > <parav@nvidia.com>
> > > > wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > Sent: Thursday, November 2, 2023 9:56 AM
> > > > > > > > > >
> > > > > > > > > > On Wed, Nov 1, 2023 at 11:32=E2=80=AFAM Parav Pandit
> > > > > > > > > > <parav@nvidia.com>
> > > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > Sent: Wednesday, November 1, 2023 6:04 AM
> > > > > > > > > > > >
> > > > > > > > > > > > On Tue, Oct 31, 2023 at 1:30=E2=80=AFPM Parav Pandi=
t
> > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > > > Sent: Tuesday, October 31, 2023 7:05 AM
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > On Mon, Oct 30, 2023 at 12:47=E2=80=AFPM Parav =
Pandit
> > > > > > > > > > > > > > <parav@nvidia.com>
> > > > > > > > > > wrote:
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > From: virtio-comment@lists.oasis-open.org
> > > > > > > > > > > > > > > > <virtio-comment@lists.oasis- open.org> On
> > > > > > > > > > > > > > > > Behalf Of Jason Wang
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > On Thu, Oct 26, 2023 at 11:45=E2=80=AFAM Pa=
rav
> > > > > > > > > > > > > > > > Pandit <parav@nvidia.com>
> > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > > > > > > > > > Sent: Thursday, October 26, 2023 6:16 A=
M
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > On Wed, Oct 25, 2023 at 3:03=E2=80=AFPM=
 Parav
> > > > > > > > > > > > > > > > > > Pandit <parav@nvidia.com>
> > > > > > > > > > > > > > wrote:
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > From: Jason Wang
> > > > > > > > > > > > > > > > > > > > <jasowang@redhat.com>
> > > > > > > > > > > > > > > > > > > > Sent: Wednesday, October 25, 2023
> > > > > > > > > > > > > > > > > > > > 6:59 AM
> > > > > > > > > > > > > > > > > > > > > For passthrough PASID assignment
> > > > > > > > > > > > > > > > > > > > > vq is not
> > > > needed.
> > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > How do you know that?
> > > > > > > > > > > > > > > > > > > Because for passthrough, the
> > > > > > > > > > > > > > > > > > > hypervisor is not involved in dealing
> > > > > > > > > > > > > > > > > > > with VQ at
> > > > > > > > > > > > > > > > > > all.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Ok, so if I understand correctly, you
> > > > > > > > > > > > > > > > > > are saying your design can't work for
> > > > > > > > > > > > > > > > > > the case of PASID
> > > > assignment.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > No. PASID assignment will happen from the
> > > > > > > > > > > > > > > > > guest for its own use and device
> > > > > > > > > > > > > > > > migration will just work fine because devic=
e
> > > > > > > > > > > > > > > > context will capture
> > > > > > > > this.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > It's not about device context. We're
> > > > > > > > > > > > > > > > discussing "passthrough",
> > > > > > > > no?
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Not sure, we are discussing same.
> > > > > > > > > > > > > > > A member device is passthrough to the guest,
> > > > > > > > > > > > > > > dealing with its own PASIDs and
> > > > > > > > > > > > > > virtio interface for some VQ assignment to PASI=
D.
> > > > > > > > > > > > > > > So VQ context captured by the hypervisor, wil=
l
> > > > > > > > > > > > > > > have some PASID attached to
> > > > > > > > > > > > > > this VQ.
> > > > > > > > > > > > > > > Device context will be updated.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > You want all virtio stuff to be
> > > > > > > > > > > > > > > > "passthrough", but assigning a PASID to a
> > > > > > > > > > > > > > > > specific virtqueue in the guest must be
> > > > > > > > trapped.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > No. PASID assignment to a specific virtqueue
> > > > > > > > > > > > > > > in the guest must go directly
> > > > > > > > > > > > > > from guest to device.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > This works like setting CR3, you can't simply
> > > > > > > > > > > > > > let it go from guest to
> > > > > > > > host.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Host IOMMU driver needs to know the PASID to
> > > > > > > > > > > > > > program the IO page tables correctly.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > This will be done by the IOMMU.
> > > > > > > > > > > > >
> > > > > > > > > > > > > > > When guest iommu may need to communicate
> > > > > > > > > > > > > > > anything for this PASID, it will
> > > > > > > > > > > > > > come through its proper IOMMU channel/hypercall=
.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Let's say using PASID X for queue 0, this
> > > > > > > > > > > > > > knowledge is beyond the IOMMU scope but belongs
> > > > > > > > > > > > > > to virtio. Or please explain how it can work
> > > > > > > > > > > > > > when it goes directly from guest to
> > > > > > device.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > We are yet to ever see spec for PASID to VQ assig=
nment.
> > > > > > > > > > > >
> > > > > > > > > > > > It has one.
> > > > > > > > > > > >
> > > > > > > > > > > > > For ok for theory sake it is there.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Virtio driver will assign the PASID directly from
> > > > > > > > > > > > > guest driver to device using a
> > > > > > > > > > > > create_vq(pasid=3DX) command.
> > > > > > > > > > > > > Same process is somehow attached the PASID by the=
 guest
> > OS.
> > > > > > > > > > > > > The whole PASID range is known to the hypervisor
> > > > > > > > > > > > > when the device is handed
> > > > > > > > > > > > over to the guest VM.
> > > > > > > > > > > >
> > > > > > > > > > > > How can it know?
> > > > > > > > > > > >
> > > > > > > > > > > > > So PASID mapping is setup by the hypervisor IOMMU
> > > > > > > > > > > > > at this
> > > > point.
> > > > > > > > > > > >
> > > > > > > > > > > > You disallow the PASID to be virtualized here.
> > > > > > > > > > > > What's more, such a PASID passthrough has security
> > implications.
> > > > > > > > > > > >
> > > > > > > > > > > No. virtio spec is not disallowing. At least for sure=
,
> > > > > > > > > > > this series is not the
> > > > > > > > one.
> > > > > > > > > > > My main point is, virtio device interface will not be
> > > > > > > > > > > the source of hypercall to
> > > > > > > > > > program IOMMU in the hypervisor.
> > > > > > > > > > > It is something to be done by IOMMU side.
> > > > > > > > > >
> > > > > > > > > > So unless vPASID can be used by the hardware you need t=
o
> > > > > > > > > > trap the mapping from a PASID to a virtqueue. Then you
> > > > > > > > > > need virtio specific
> > > > > > > > knowledge.
> > > > > > > > > >
> > > > > > > > > vPASID by hardware is unlikely to be used by hw PCI EP
> > > > > > > > > devices at least in any
> > > > > > > > near term future.
> > > > > > > > > This requires either vPASID to pPASID table in device or =
in IOMMU.
> > > > > > > >
> > > > > > > > So we are on the same page.
> > > > > > > >
> > > > > > > > Claiming a method that can only work for passthrough or
> > > > > > > > emulation is not
> > > > > > good.
> > > > > > > > We all know virtualization is passthrough + emulation.
> > > > > > > Again, I agree but I wont generalize it here.
> > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > Again, we are talking about different things, I've
> > > > > > > > > > > > tried to show you that there are cases that
> > > > > > > > > > > > passthrough can't work but if you think the only wa=
y
> > > > > > > > > > > > for migration is to use passthrough in every case,
> > > > > > > > > > > > you will
> > > > > > > > > > probably fail.
> > > > > > > > > > > >
> > > > > > > > > > > I didn't say only way for migration is passthrough.
> > > > > > > > > > > Passthrough is clearly one way.
> > > > > > > > > > > Other ways may be possible.
> > > > > > > > > > >
> > > > > > > > > > > > >
> > > > > > > > > > > > > > > Virtio device is not the conduit for this exc=
hange.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > There are works ongoing to make
> > > > > > > > > > > > > > > > > > > > vPASID work for the guest like
> > > > > > > > > > > > > > vSVA.
> > > > > > > > > > > > > > > > > > > > Virtio doesn't differ from other de=
vices.
> > > > > > > > > > > > > > > > > > > Passthrough do not run like SVA.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Great, you find another limitation of
> > > > > > > > > > > > > > > > > > "passthrough" by
> > > > > > > > yourself.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > No. it is not the limitation it is just
> > > > > > > > > > > > > > > > > the way it does not need complex SVA to
> > > > > > > > > > > > > > > > split the device for unrelated usage.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > How can you limit the user in the guest to =
not use
> > vSVA?
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > He he, I am not limiting, again
> > > > > > > > > > > > > > > misunderstanding or wrong
> > > > > > > > attribution.
> > > > > > > > > > > > > > > I explained that hypervisor for passthrough
> > > > > > > > > > > > > > > does not need
> > > > SVA.
> > > > > > > > > > > > > > > Guest can do anything it wants from the guest
> > > > > > > > > > > > > > > OS with the member
> > > > > > > > > > > > device.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Ok, so the point stills, see above.
> > > > > > > > > > > > >
> > > > > > > > > > > > > I don=E2=80=99t think so. The guest owns its PASI=
D space
> > > > > > > > > > > >
> > > > > > > > > > > > Again, vPASID to PASID can't be done hardware unles=
s
> > > > > > > > > > > > I miss some recent features of IOMMUs.
> > > > > > > > > > > >
> > > > > > > > > > > Cpu vendors have different way of doing vPASID to pPA=
SID.
> > > > > > > > > >
> > > > > > > > > > At least for the current version of major IOMMU vendors=
,
> > > > > > > > > > such translation (aka PASID remapping) is not
> > > > > > > > > > implemented in the hardware so it needs to be trapped f=
irst.
> > > > > > > > > >
> > > > > > > > > Right. So it is really far in future, atleast few years a=
way.
> > > > > > > > >
> > > > > > > > > > > It is still an early space for virtio.
> > > > > > > > > > >
> > > > > > > > > > > > > and directly communicates like any other device a=
ttribute.
> > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > Each passthrough device has PASID fro=
m
> > > > > > > > > > > > > > > > > > > its own space fully managed by the
> > > > > > > > > > > > > > > > > > guest.
> > > > > > > > > > > > > > > > > > > Some cpu required vPASID and SIOV is
> > > > > > > > > > > > > > > > > > > not going this way
> > > > > > > > > > anmore.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > Then how to migrate? Invent a full set
> > > > > > > > > > > > > > > > > > of something else through another giant
> > > > > > > > > > > > > > > > > > series like this to migrate to the SIOV
> > > > > > > > > > thing?
> > > > > > > > > > > > > > > > > > That's a mess for
> > > > > > > > > > > > > > > > sure.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > SIOV will for sure reuse most or all part=
s
> > > > > > > > > > > > > > > > > of this work, almost entirely
> > > > > > > > > > > > as_is.
> > > > > > > > > > > > > > > > > vPASID is cpu/platform specific things no=
t
> > > > > > > > > > > > > > > > > part of the SIOV
> > > > > > > > devices.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > > If at all it is done, it will be
> > > > > > > > > > > > > > > > > > > > > done from the guest by the driver
> > > > > > > > > > > > > > > > > > > > > using virtio
> > > > > > > > > > > > > > > > > > > > interface.
> > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > Then you need to trap. Such things
> > > > > > > > > > > > > > > > > > > > couldn't be passed through to guest=
s
> > > > > > > > > > > > > > > > > > directly.
> > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > Only PASID capability is trapped.
> > > > > > > > > > > > > > > > > > > PASID allocation and usage is directl=
y
> > > > > > > > > > > > > > > > > > > from
> > > > > > > > > > > > > > > > > > guest.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > How can you achieve this? Assigning a
> > > > > > > > > > > > > > > > > > PAISD to a device is completely
> > > > > > > > > > > > > > > > > > device(virtio) specific. How can you us=
e
> > > > > > > > > > > > > > > > > > a general layer without the knowledge o=
f
> > > > > > > > > > > > > > > > > > virtio to trap
> > > > that?
> > > > > > > > > > > > > > > > > When one wants to map vPASID to pPASID a
> > > > > > > > > > > > > > > > > platform needs to be
> > > > > > > > > > > > > > involved.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > I'm not talking about how to map vPASID to
> > > > > > > > > > > > > > > > pPASID, it's out of the scope of virtio. I'=
m
> > > > > > > > > > > > > > > > talking about assigning a vPASID to a
> > > > > > > > > > > > > > > > specific virtqueue or other virtio function
> > > > > > > > > > > > > > > > in the
> > > > > > > > guest.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > That can be done in the guest. The key is
> > > > > > > > > > > > > > > guest wont know that it is dealing
> > > > > > > > > > > > > > with vPASID.
> > > > > > > > > > > > > > > It will follow the same principle from your
> > > > > > > > > > > > > > > paper of equivalency, where virtio
> > > > > > > > > > > > > > software layer will assign PASID to VQ and
> > > > > > > > > > > > > > communicate to
> > > > > > device.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Anyway, all of this just digression from curr=
ent series.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > It's not, as you mention that only MSI-X is
> > > > > > > > > > > > > > trapped, I give you another
> > > > > > > > > > one.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > PASID access from the guest to be done fully by
> > > > > > > > > > > > > the guest
> > > > IOMMU.
> > > > > > > > > > > > > Not by virtio devices.
> > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > You need a virtio specific queue or
> > > > > > > > > > > > > > > > capability to assign a PASID to a specific
> > > > > > > > > > > > > > > > virtqueue, and that can't be done without
> > > > > > > > > > > > > > > > trapping and without virito specific
> > > > > > knowledge.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > I disagree. PASID assignment to a virqueue in
> > > > > > > > > > > > > > > future from guest virtio driver to
> > > > > > > > > > > > > > device is uniform method.
> > > > > > > > > > > > > > > Whether its PF assigning PASID to VQ of self,
> > > > > > > > > > > > > > > Or VF driver in the guest assigning PASID to =
VQ.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > All same.
> > > > > > > > > > > > > > > Only IOMMU layer hypercalls will know how to
> > > > > > > > > > > > > > > deal with PASID assignment at
> > > > > > > > > > > > > > platform layer to setup the domain etc table.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > And this is way beyond our device migration d=
iscussion.
> > > > > > > > > > > > > > > By any means, if you were implying that
> > > > > > > > > > > > > > > somehow vq to PASID assignment
> > > > > > > > > > > > > > _may_ need trap+emulation, hence whole device
> > > > > > > > > > > > > > migration to depend on some
> > > > > > > > > > > > > > trap+emulation, than surely, than I do not agre=
e to it.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > See above.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > Yeah, I disagree to such implying.
> > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > PASID equivalent in mlx5 world is ODP_MR+PD
> > > > > > > > > > > > > > > isolating the guest process and
> > > > > > > > > > > > > > all of that just works on efficiency and
> > > > > > > > > > > > > > equivalence principle already for a decade now
> > > > > > > > > > > > > > without any
> > > > trap+emulation.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > When virtio passthrough device is in
> > > > > > > > > > > > > > > > > guest, it has all its PASID
> > > > > > > > > > > > accessible.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > All these is large deviation from current
> > > > > > > > > > > > > > > > > discussion of this series, so I will keep
> > > > > > > > > > > > > > > > it short.
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > Regardless it is not relevant to
> > > > > > > > > > > > > > > > > > > passthrough mode as PASID is yet
> > > > > > > > > > > > > > > > > > > another
> > > > > > > > > > > > > > > > > > resource.
> > > > > > > > > > > > > > > > > > > And for some cpu if it is trapped, it
> > > > > > > > > > > > > > > > > > > is generic layer, that does not
> > > > > > > > > > > > > > > > > > > require virtio
> > > > > > > > > > > > > > > > > > involvement.
> > > > > > > > > > > > > > > > > > > So virtio interface asking to trap
> > > > > > > > > > > > > > > > > > > something because generic facility ha=
s
> > > > > > > > > > > > > > > > > > > done
> > > > > > > > > > > > > > > > > > in not the approach.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > This misses the point of PASID. How to
> > > > > > > > > > > > > > > > > > use PASID is totally device
> > > > > > > > > > > > > > specific.
> > > > > > > > > > > > > > > > > Sure, and how to virtualize vPASID/pPASID
> > > > > > > > > > > > > > > > > is platform specific as single PASID
> > > > > > > > > > > > > > > > can be used by multiple devices and process=
.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > See above, I think we're talking about diff=
erent things.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > > Capabilities of #2 is generic
> > > > > > > > > > > > > > > > > > > > > across all pci devices, so it wil=
l
> > > > > > > > > > > > > > > > > > > > > be handled by the
> > > > > > > > > > > > > > > > > > > > HV.
> > > > > > > > > > > > > > > > > > > > > ATS/PRI cap is also generic manne=
r
> > > > > > > > > > > > > > > > > > > > > handled by the HV and PCI
> > > > > > > > > > > > > > device.
> > > > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > > > No, ATS/PRI requires the cooperatio=
n
> > > > > > > > > > > > > > > > > > > > from the
> > > > > > vIOMMU.
> > > > > > > > > > > > > > > > > > > > You can simply do ATS/PRI
> > > > > > > > > > > > > > > > > > > > passthrough but with an emulated
> > > > > > > > > > > > vIOMMU.
> > > > > > > > > > > > > > > > > > > And that is not the reason for virtio
> > > > > > > > > > > > > > > > > > > device to build
> > > > > > > > > > > > > > > > > > > trap+emulation for
> > > > > > > > > > > > > > > > > > passthrough member devices.
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > vIOMMU is emulated by hypervisor with a
> > > > > > > > > > > > > > > > > > PRI queue,
> > > > > > > > > > > > > > > > > PRI requests arrive on the PF for the VF.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Shouldn't it arrive at platform IOMMU first=
?
> > > > > > > > > > > > > > > > The path should be PRI
> > > > > > > > > > > > > > > > -> RC -> IOMMU -> host -> Hypervisor ->
> > > > > > > > > > > > > > > > -> vIOMMU PRI
> > > > > > > > > > > > > > > > -> -> guest
> > > > > > > > > > IOMMU.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Above sequence seems write.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > And things will be more complicated when
> > > > > > > > > > > > > > > > (v)PASID is
> > > > used.
> > > > > > > > > > > > > > > > So you can't simply let PRI go directly to
> > > > > > > > > > > > > > > > the guest with the current
> > > > > > > > > > > > architecture.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > In current architecture of the pci VF, PRI
> > > > > > > > > > > > > > > does not go directly to the
> > > > > > > > > > guest.
> > > > > > > > > > > > > > > (and that is not reason to trap and emulate o=
ther things).
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Ok, so beyond MSI-X we need to trap PRI, and we
> > > > > > > > > > > > > > will probably trap other things in the future
> > > > > > > > > > > > > > like PASID
> > > > assignment.
> > > > > > > > > > > > > PRI etc all belong to generic PCI 4K config space=
 region.
> > > > > > > > > > > >
> > > > > > > > > > > > It's not about the capability, it's about the whole
> > > > > > > > > > > > process of PRI request handling. We've agreed that
> > > > > > > > > > > > the PRI request needs to be trapped by the
> > > > > > > > > > > > hypervisor and then delivered to the
> > > > > > vIOMMU.
> > > > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > > > Trap+emulation done in generic manner without
> > > > > > > > > > > > > Trap+involving virtio or other
> > > > > > > > > > > > device types.
> > > > > > > > > > > > >
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > > how can you pass through a hardware PRI
> > > > > > > > > > > > > > > > > > request to a guest directly without
> > > > > > > > > > > > > > > > > > trapping it
> > > > > > > > > > > > > > then?
> > > > > > > > > > > > > > > > > > What's more, PCIE allows the PRI to be
> > > > > > > > > > > > > > > > > > done in a vendor
> > > > > > > > > > > > > > > > > > (virtio) specific way, so you want to b=
reak this rule?
> > > > > > > > > > > > > > > > > > Or you want to blacklist ATS/PRI
> > > > > > > > > > > > > > > > for virtio?
> > > > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > I was aware of only pci-sig way of PRI.
> > > > > > > > > > > > > > > > > Do you have a reference to the ECN that
> > > > > > > > > > > > > > > > > enables vendor specific way of PRI? I
> > > > > > > > > > > > > > > > would like to read it.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > I mean it doesn't forbid us to build a
> > > > > > > > > > > > > > > > virtio specific interface for I/O page faul=
t report and
> > recovery.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > So PRI of PCI does not allow. It is ODP kind
> > > > > > > > > > > > > > > of technique you meant
> > > > > > > > > > above.
> > > > > > > > > > > > > > > Yes one can build.
> > > > > > > > > > > > > > > Ok. unrelated to device migration, so I will
> > > > > > > > > > > > > > > park this good discussion for
> > > > > > > > > > > > later.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > That's fine.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > This will be very good to eliminate IOMMU
> > > > > > > > > > > > > > > > > PRI
> > > > limitations.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > Probably.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > PRI will directly go to the guest driver,
> > > > > > > > > > > > > > > > > and guest would interact with IOMMU
> > > > > > > > > > > > > > > > to service the paging request through IOMMU=
 APIs.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > With PASID, it can't go directly.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > When the request consist of PASID in it, it c=
an.
> > > > > > > > > > > > > > > But again these PCI-SIG extensions of PASID
> > > > > > > > > > > > > > > are not related to device
> > > > > > > > > > > > > > migration, so I am differing it.
> > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > > For PRI in vendor specific way needs a
> > > > > > > > > > > > > > > > > separate discussion. It is not related to
> > > > > > > > > > > > > > > > live migration.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > > PRI itself is not related. But the point is=
,
> > > > > > > > > > > > > > > > you can't simply pass through ATS/PRI now.
> > > > > > > > > > > > > > > >
> > > > > > > > > > > > > > > Ah ok. the whole 4K PCI config space where
> > > > > > > > > > > > > > > ATS/PRI capabilities are located
> > > > > > > > > > > > > > are trapped+emulated by hypervisor.
> > > > > > > > > > > > > > > So?
> > > > > > > > > > > > > > > So do we start emulating virito interfaces to=
o
> > > > > > > > > > > > > > > for
> > > > passthrough?
> > > > > > > > > > > > > > > No.
> > > > > > > > > > > > > > > Can one still continue to trap+emulate?
> > > > > > > > > > > > > > > Sure why not?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Then let's not limit your proposal to be used b=
y
> > "passthrough"
> > > > > > only?
> > > > > > > > > > > > > One can possibly build some variant of the
> > > > > > > > > > > > > existing virtio member device
> > > > > > > > > > > > using same owner and member scheme.
> > > > > > > > > > > >
> > > > > > > > > > > > It's not about the member/owner, it's about e.g
> > > > > > > > > > > > whether the hypervisor can trap and emulate.
> > > > > > > > > > > >
> > > > > > > > > > > > I've pointed out that what you invent here is
> > > > > > > > > > > > actually a partial new transport, for example, a
> > > > > > > > > > > > hypervisor can trap and use things like device
> > > > > > > > > > > > context in PF to bypass the registers in VF. This i=
s
> > > > > > > > > > > > the idea of
> > > > > > > > > > transport commands/q.
> > > > > > > > > > > >
> > > > > > > > > > > I will not mix transport commands which are mainly
> > > > > > > > > > > useful for actual device
> > > > > > > > > > operation for SIOV only for backward compatibility that
> > > > > > > > > > too
> > > > optionally.
> > > > > > > > > > > One may still choose to have virtio common and device
> > > > > > > > > > > config in MMIO
> > > > > > > > > > ofcourse at lower scale.
> > > > > > > > > > >
> > > > > > > > > > > Anyway, mixing migration context with actual SIOV
> > > > > > > > > > > specific thing is not correct
> > > > > > > > > > as device context is read/write incremental values.
> > > > > > > > > >
> > > > > > > > > > SIOV is transport level stuff, the transport virtqueue
> > > > > > > > > > is designed in a way that is general enough to cover it=
.
> > > > > > > > > > Let's not shift
> > > > > > concepts.
> > > > > > > > > >
> > > > > > > > > Such TVQ is only for backward compatible vPCI composition=
.
> > > > > > > > > For ground up work such TVQ must not be done through the
> > > > > > > > > owner
> > > > > > device.
> > > > > > > >
> > > > > > > > That's the idea actually.
> > > > > > > >
> > > > > > > > > Each SIOV device to have its own channel to communicate
> > > > > > > > > directly to the
> > > > > > > > device.
> > > > > > > > >
> > > > > > > > > > One thing that you ignore is that, hypervisor can use
> > > > > > > > > > what you invented as a transport for VF, no?
> > > > > > > > > >
> > > > > > > > > No. by design,
> > > > > > > >
> > > > > > > > It works like hypervisor traps the virito config and
> > > > > > > > forwards it to admin virtqueue and starts the device via de=
vice
> > context.
> > > > > > > It needs more granular support than the management framework
> > > > > > > of device
> > > > > > context.
> > > > > >
> > > > > > It doesn't otherwise it is a design defect as you can't recover
> > > > > > the device context in the destination.
> > > > > >
> > > > > > Let me give you an example:
> > > > > >
> > > > > > 1) in the case of live migration, dst receive migration byte
> > > > > > flows and convert them into device context
> > > > > > 2) in the case of transporting, hypervisor traps virtio config
> > > > > > and convert them into the device context
> > > > > >
> > > > > > I don't see anything different in this case. Or can you give me=
 an
> > example?
> > > > > In #1 dst received byte flows one or multiple times.
> > > >
> > > > How can this be different?
> > > >
> > > > Transport can also receive initial state incrementally.
> > > >
> > > Transport is just simple register RW interface without any caching la=
yer in-
> > between.
> > > More below.
> > > > > And byte flows can be large.
> > > >
> > > > So when doing transport, it is not that large, that's it. If it can
> > > > work with large byte flow, why can't it work for small?
> > > Write context can as used (abused) for different purpose.
> > > Read cannot because it is meant to be incremental.
> >
> > Well hypervisor can just cache what it reads since the last, what's wro=
ng with it?
> >
> But hypervisor does not know what changed, so it does do guess work to fi=
nd out what to query.
>
> > > One can invent a cheap command to read it.
> >
> > For sure, but it's not the context here.
> >
> It is.
> > >
> > >
> > > >
> > > > > So it does not always contain everything. It only contains the ne=
w
> > > > > delta of the
> > > > device context.
> > > >
> > > > Isn't it just how current PCI transport does?
> > > >
> > > No. PCI transport has explicit API between device and driver to read =
or write
> > at specific offset and value.
> >
> > The point is that they are functional equivalents.
> >
> I disagree.
> There are two different functionalities.
>
> Functionality_1: explicit ask for read or write
> Functionality_2: read what has changed

This needs to be justified. I won't repeat the questions again here.

>
> Should one merge 1 and 2 and complicate the command?
> I prefer not to.

Again there're functional duplications. E.g your command duplicates
common_cfg for sure.

>
> Now having two different commands help for debugging to differentiate bet=
ween mgmt. commands and guest initiated commands. :)
>
> > >
> > > > Guest configure the following one by one:
> > > >
> > > > 1) vq size
> > > > 2) vq addresses
> > > > 3) MSI-X
> > > >
> > > > etc?
> > > >
> > > I think you interpreted "incremental" differently than I described.
> > > In the device context read, the incremental is:
> > >
> > > If the hypervisor driver has read the device context twice, the secon=
d read
> > won't return any new data if nothing changed.
> >
> > See above.
> >
> Yeah, two separate commands needed.
>
> > > For example, if RSS configuration didn=E2=80=99t change between two r=
eads, the
> > second read wont return the TLV for RSS Context.
> > >
> > > While for transport the need is, when guest asked, one device must re=
ad it
> > regardless of the change.
> > >
> > > So notion of incremental is not by address, but by the value.
> > >
> > > > > For example, VQ configuration is exchanged once between src and d=
st.
> > > > > But VQ avail and used index may be updated multiple times.
> > > >
> > > > If it can work with multiple times of updating, why can't it work i=
f
> > > > we just update it once?
> > > Functionally it can work.
> >
> > I think you answer yourself.
> >
> Yes, I don=E2=80=99t like abuse of command.

How did you define abuse or can spec ever need to define that?

>
> > > Performance wise, one does not want to update multiple times, unless =
there
> > is a change.
> > >
> > > Read as explained above is not meant to return same content again.
> > >
> > > >
> > > > > So here hypervisor do not want to read any specific set of fields
> > > > > and
> > > > hypervisor is not parsing them either.
> > > > > It is just a byte stream for it.
> > > >
> > > > Firstly, spec must define the device context format, so hypervisor
> > > > can understand which byte is what otherwise you can't maintain
> > > > migration compatibility.
> > > Device context is defined already in the latest version.
> > >
> > > > Secondly, you can't mandate how the hypervisor is written.
> > > >
> > > > >
> > > > > As opposed to that, in case of transport, the guest explicitly
> > > > > asks to read or
> > > > write specific bytes.
> > > > > Therefore, it is not incremental.
> > > >
> > > > I'm totally lost. Which part of the transport is not incremental?
> > > >
> > > > >
> > > > > Additionally, if hypervisor has put the trap on virtio config, an=
d
> > > > > because the memory device already has the interface for virtio
> > > > > config,
> > > > >
> > > > > Hypervisor can directly write/read from the virtual config to the
> > > > > member's
> > > > config space, without going through the device context, right?
> > > >
> > > > If it can do it or it can choose to not. I don't see how it is
> > > > related to the discussion here.
> > > >
> > > It is. I don=E2=80=99t see a point of hypervisor not using the native=
 interface provided
> > by the member device.
> >
> > It really depends on the case, and I see how it duplicates with the fun=
ctionality
> > that is provided by both:
> >
> > 1) The existing PCI transport
> >
> > or
> >
> > 2) The transport virtqueue
> >
> I would like to conclude that we disagree in our approaches.
> PCI transport is for member device to directly communicate from guest dri=
ver to the device.
> This is uniform across PF, VFs, SIOV.

For "PCi transport" did you mean the one defined in spec? If yes, how
can it work with SIOV with what you're saying here (a direct
communication channel)?

>
> Admin commands are transport independent and their task is device migrati=
on.
> One is not replacing the other.
>
> Transport virtqueue will never transport driver notifications, hence it d=
oes not qualify at "transport".

Another double standard.

MMIO will never transport device notification, hence it does not
qualify as "transport"?

>
> For the vdpa case, there is no need for extra admin commands as the media=
tion layer can directly use the interface available from the member device =
itself.
>
> You continue to want to overload admin commands for dual purpose, does no=
t make sense to me.
>
> > >
> > >  > >
> > > > > >
> > > > > > >
> > > > > > > >
> > > > > > > > > it is not good idea to overload management commands with
> > > > > > > > > actual run time
> > > > > > > > guest commands.
> > > > > > > > > The device context read writes are largely for incrementa=
l updates.
> > > > > > > >
> > > > > > > > It doesn't matter if it is incremental or not but
> > > > > > > >
> > > > > > > It does because you want different functionality only for
> > > > > > > purpose of backward
> > > > > > compatibility.
> > > > > > > That also if the device does not offer them as portion of MMI=
O BAR.
> > > > > >
> > > > > > I don't see how it is related to the "incremental part".
> > > > > >
> > > > > > >
> > > > > > > > 1) the function is there
> > > > > > > > 2) hypervisor can use that function if they want and virtio
> > > > > > > > (spec) can't forbid that
> > > > > > > >
> > > > > > > It is not about forbidding or supporting.
> > > > > > > Its about what functionality to use for management plane and
> > > > > > > guest
> > > > plane.
> > > > > > > Both have different needs.
> > > > > >
> > > > > > People can have different views, there's nothing we can prevent
> > > > > > a hypervisor from using it as a transport as far as I can see.
> > > > > For device context write command, it can be used (or probably
> > > > > abused) to do
> > > > write but I fail to see why to use it.
> > > >
> > > > The function is there, you can't prevent people from doing that.
> > > >
> > > One can always mess up itself. :)
> > > It is not prevented. It is just not right way to use the interface.
> > >
> > > > > Because member device already has the interface to do config
> > > > > read/write and
> > > > it is accessible to the hypervisor.
> > > >
> > > > Well, it looks self-contradictory again. Are you saying another set
> > > > of commands that is similar to device context is needed for non-PCI
> > transport?
> > > >
> > > All these non pci transport discussion is just meaning less.
> > > Let MMIO bring the concept of member device at that point something m=
ake
> > sense to discuss.
> >
> > It's not necessarily MMIO. For example the SIOV, which I don't think ca=
n use the
> > existing PCI transport.
> >
> > > PCI SIOV is also the PCI device at the end.
> >
> > We don't want to end up with two sets of commands to save/load SRIOV an=
d
> > SIOV at least.
> >
> This proposal ensures that SRIOV and SIOV devices are treated equally.

How? Did you mean your proposal can work for SIOV? What's the transport the=
n?

> How brand new non-compatible SIOV device to transport this, is outside of=
 the scope of this work.

You invented one that can be used for doing this. If you disagree, how
can we know your proposal can work for SIOV without a transport then?

Thanks



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

