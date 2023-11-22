Return-Path: <virtio-comment-return-8529-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7857C072A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 05:27:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0D8B32AEEB
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 05:27:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C97BC9868A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 05:27:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A409A9843C0; Wed, 22 Nov 2023 05:27:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 933F8986894
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 05:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: GPmACEkkOpm2dv0rCZuzVQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700630852; x=1701235652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uut4AyG+QcMBTMF8/42uJHKiIh8GBg3VjKsGyL/8CRU=;
        b=muxffkmy8Ua/GoLyhEII95iumnv7KWeqDSB0mV15/UzZuF4K7eFeUkQEmHwkYFcMN8
         oSlbyExwGbAr/TkDEp8qMqfKPq3cNN4JolReKj050ueEOey/okpQWkcZby0YUVdX/0gf
         sLafk/eSTSscsbMLxHSQ0XntxOsLczny9IutjqEYS98VW9PkQvlUTzZ6grBstHvUTFT7
         VV+WaoLxA+nfltZX6ykAH++mkvTvfQ2uKOujC0aWysp7kOqVZqMjNaFqNWaEH8Vg5bks
         vh0zEIPU98F6UbSLHclbn7eVBfujxL/zaT6aHXTnWSSRvZP+prKGl0yAbJjIJPvZzWfj
         oxXg==
X-Gm-Message-State: AOJu0YygYnTHajMIJX1jTaAMRmV9H13eHdL6m2swKWKakuEQ35SBfJjP
	BJBWUovab6cEd73VcwTeDkb6UOqTybwOpgkTpnpfT5A5zlcKW8cGDFty0IjCW3QloXfdkRTwGKV
	vFxzO3i9SEca+ixyzTRataj1qPJw9Q1WOv4ahKt//crJDvqmXPA==
X-Received: by 2002:a19:5f19:0:b0:50a:9f0e:6409 with SMTP id t25-20020a195f19000000b0050a9f0e6409mr421337lfb.20.1700630852226;
        Tue, 21 Nov 2023 21:27:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPHId9qDzARmb5+n8yLS5u8jkxSQMoU+oCQQdG69msekw1oWkgi9KIlm7syHI3I8c9ZtUupfS0LdrJYbD7Vws=
X-Received: by 2002:a19:5f19:0:b0:50a:9f0e:6409 with SMTP id
 t25-20020a195f19000000b0050a9f0e6409mr421335lfb.20.1700630851786; Tue, 21 Nov
 2023 21:27:31 -0800 (PST)
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
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsdiCrSwFyC19PVnSCCXSabZ1G=3V-oQ=h=2sMaj=NcmQ@mail.gmail.com> <PH0PR12MB54819E748C4D128711A4D4A4DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54819E748C4D128711A4D4A4DCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 22 Nov 2023 13:27:19 +0800
Message-ID: <CACGkMEv54ijx-qM66e01JBC7kYOQ3rCzJi22HuLWkPAifLhFVg@mail.gmail.com>
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

On Wed, Nov 22, 2023 at 12:32=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, November 21, 2023 12:54 PM
> >
> > On Thu, Nov 16, 2023 at 1:28=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Thursday, November 16, 2023 9:50 AM
> > > >
> > > > On Thu, Nov 16, 2023 at 1:39=E2=80=AFAM Parav Pandit <parav@nvidia.=
com>
> > wrote:
> > > > >
> > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > Sent: Monday, November 13, 2023 9:03 AM
> > > > > >
> > > > > > On Thu, Nov 9, 2023 at 2:25=E2=80=AFPM Parav Pandit <parav@nvid=
ia.com>
> > wrote:
> > > > > > >
> > > > > > >
> > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > Sent: Tuesday, November 7, 2023 9:35 AM
> > > > > > > >
> > > > > > > > On Mon, Nov 6, 2023 at 3:05=E2=80=AFPM Parav Pandit
> > > > > > > > <parav@nvidia.com>
> > > > wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Jason Wang <jasowang@redhat.com>
> > > > > > > > > > Sent: Monday, November 6, 2023 12:05 PM
> > > > > > > > > >
> > > > > > > > > > On Thu, Nov 2, 2023 at 2:10=E2=80=AFPM Parav Pandit
> > > > > > > > > > <parav@nvidia.com>
> > > > > > wrote:
> > > > > > > > > > >
> > > > > > > > > > >

[...]

> > > >
> > > I disagree.
> > > There are two different functionalities.
> > >
> > > Functionality_1: explicit ask for read or write
> > > Functionality_2: read what has changed
> >
> > This needs to be justified. I won't repeat the questions again here.
> >
> As explained the use case in theory of operation already.
>
> > >
> > > Should one merge 1 and 2 and complicate the command?
> > > I prefer not to.
> >
> > Again there're functional duplications. E.g your command duplicates
> > common_cfg for sure.
> Nop. it is not.
> Common cfg is accessed directly by guest member driver.

It can be accessed directly, if we have adminq per VF.

>
> >
> > >
> > > Now having two different commands help for debugging to differentiate
> > > between mgmt. commands and guest initiated commands. :)
> > >
> > > > >
> > > > > > Guest configure the following one by one:
> > > > > >
> > > > > > 1) vq size
> > > > > > 2) vq addresses
> > > > > > 3) MSI-X
> > > > > >
> > > > > > etc?
> > > > > >
> > > > > I think you interpreted "incremental" differently than I describe=
d.
> > > > > In the device context read, the incremental is:
> > > > >
> > > > > If the hypervisor driver has read the device context twice, the
> > > > > second read
> > > > won't return any new data if nothing changed.
> > > >
> > > > See above.
> > > >
> > > Yeah, two separate commands needed.
> > >
> > > > > For example, if RSS configuration didn=E2=80=99t change between t=
wo reads,
> > > > > the
> > > > second read wont return the TLV for RSS Context.
> > > > >
> > > > > While for transport the need is, when guest asked, one device mus=
t
> > > > > read it
> > > > regardless of the change.
> > > > >
> > > > > So notion of incremental is not by address, but by the value.
> > > > >
> > > > > > > For example, VQ configuration is exchanged once between src a=
nd
> > dst.
> > > > > > > But VQ avail and used index may be updated multiple times.
> > > > > >
> > > > > > If it can work with multiple times of updating, why can't it
> > > > > > work if we just update it once?
> > > > > Functionally it can work.
> > > >
> > > > I think you answer yourself.
> > > >
> > > Yes, I don=E2=80=99t like abuse of command.
> >
> > How did you define abuse or can spec ever need to define that?
> I don=E2=80=99t have any different definition than dictionary definition =
for abuse. :)

"Abuse" is pretty subjective. Spec have driver normative, please
explain how and if you can use that.

>
> >
> > >
> > > > > Performance wise, one does not want to update multiple times,
> > > > > unless there
> > > > is a change.
> > > > >
> > > > > Read as explained above is not meant to return same content again=
.
> > > > >
> > > > > >
> > > > > > > So here hypervisor do not want to read any specific set of
> > > > > > > fields and
> > > > > > hypervisor is not parsing them either.
> > > > > > > It is just a byte stream for it.
> > > > > >
> > > > > > Firstly, spec must define the device context format, so
> > > > > > hypervisor can understand which byte is what otherwise you can'=
t
> > > > > > maintain migration compatibility.
> > > > > Device context is defined already in the latest version.
> > > > >
> > > > > > Secondly, you can't mandate how the hypervisor is written.
> > > > > >
> > > > > > >
> > > > > > > As opposed to that, in case of transport, the guest explicitl=
y
> > > > > > > asks to read or
> > > > > > write specific bytes.
> > > > > > > Therefore, it is not incremental.
> > > > > >
> > > > > > I'm totally lost. Which part of the transport is not incrementa=
l?
> > > > > >
> > > > > > >
> > > > > > > Additionally, if hypervisor has put the trap on virtio config=
,
> > > > > > > and because the memory device already has the interface for
> > > > > > > virtio config,
> > > > > > >
> > > > > > > Hypervisor can directly write/read from the virtual config to
> > > > > > > the member's
> > > > > > config space, without going through the device context, right?
> > > > > >
> > > > > > If it can do it or it can choose to not. I don't see how it is
> > > > > > related to the discussion here.
> > > > > >
> > > > > It is. I don=E2=80=99t see a point of hypervisor not using the na=
tive
> > > > > interface provided
> > > > by the member device.
> > > >
> > > > It really depends on the case, and I see how it duplicates with the
> > > > functionality that is provided by both:
> > > >
> > > > 1) The existing PCI transport
> > > >
> > > > or
> > > >
> > > > 2) The transport virtqueue
> > > >
> > > I would like to conclude that we disagree in our approaches.
> > > PCI transport is for member device to directly communicate from guest
> > driver to the device.
> > > This is uniform across PF, VFs, SIOV.
> >
> > For "PCi transport" did you mean the one defined in spec? If yes, how c=
an it
> > work with SIOV with what you're saying here (a direct communication
> > channel)?
> >
> SIOV device may have same MMIO as VF.

We circle back, SIOV is for scalability. If you claim registers don't
scale, SVIO via MMIO doesn't scale either.

>
> > >
> > > Admin commands are transport independent and their task is device
> > migration.
> > > One is not replacing the other.
> > >
> > > Transport virtqueue will never transport driver notifications, hence =
it does
> > not qualify at "transport".
> >
> > Another double standard.
> I disagree. You coined the term transport vq, so stand behind it to trans=
port everything.

Nope, it works like other transport. It doesn't aim to replace any
existing transport.

>
> >
> > MMIO will never transport device notification, hence it does not qualif=
y as
> > "transport"?
> >
> How does interrupts work?

It depends on the platform, no?

> Seems like missing basic functionality in transport.

Not necessarily the charge of a transport. Virtio transport can't fly
without a platform.

>
> > >
> > > For the vdpa case, there is no need for extra admin commands as the
> > mediation layer can directly use the interface available from the membe=
r
> > device itself.
> > >
> > > You continue to want to overload admin commands for dual purpose, doe=
s
> > not make sense to me.
> > >
> > > > >
> > > > >  > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > it is not good idea to overload management commands
> > > > > > > > > > > with actual run time
> > > > > > > > > > guest commands.
> > > > > > > > > > > The device context read writes are largely for increm=
ental
> > updates.
> > > > > > > > > >
> > > > > > > > > > It doesn't matter if it is incremental or not but
> > > > > > > > > >
> > > > > > > > > It does because you want different functionality only for
> > > > > > > > > purpose of backward
> > > > > > > > compatibility.
> > > > > > > > > That also if the device does not offer them as portion of=
 MMIO
> > BAR.
> > > > > > > >
> > > > > > > > I don't see how it is related to the "incremental part".
> > > > > > > >
> > > > > > > > >
> > > > > > > > > > 1) the function is there
> > > > > > > > > > 2) hypervisor can use that function if they want and
> > > > > > > > > > virtio
> > > > > > > > > > (spec) can't forbid that
> > > > > > > > > >
> > > > > > > > > It is not about forbidding or supporting.
> > > > > > > > > Its about what functionality to use for management plane
> > > > > > > > > and guest
> > > > > > plane.
> > > > > > > > > Both have different needs.
> > > > > > > >
> > > > > > > > People can have different views, there's nothing we can
> > > > > > > > prevent a hypervisor from using it as a transport as far as=
 I can see.
> > > > > > > For device context write command, it can be used (or probably
> > > > > > > abused) to do
> > > > > > write but I fail to see why to use it.
> > > > > >
> > > > > > The function is there, you can't prevent people from doing that=
.
> > > > > >
> > > > > One can always mess up itself. :)
> > > > > It is not prevented. It is just not right way to use the interfac=
e.
> > > > >
> > > > > > > Because member device already has the interface to do config
> > > > > > > read/write and
> > > > > > it is accessible to the hypervisor.
> > > > > >
> > > > > > Well, it looks self-contradictory again. Are you saying another
> > > > > > set of commands that is similar to device context is needed for
> > > > > > non-PCI
> > > > transport?
> > > > > >
> > > > > All these non pci transport discussion is just meaning less.
> > > > > Let MMIO bring the concept of member device at that point
> > > > > something make
> > > > sense to discuss.
> > > >
> > > > It's not necessarily MMIO. For example the SIOV, which I don't thin=
k
> > > > can use the existing PCI transport.
> > > >
> > > > > PCI SIOV is also the PCI device at the end.
> > > >
> > > > We don't want to end up with two sets of commands to save/load SRIO=
V
> > > > and SIOV at least.
> > > >
> > > This proposal ensures that SRIOV and SIOV devices are treated equally=
.
> >
> > How? Did you mean your proposal can work for SIOV? What's the transport
> > then?
> Yes. All majority of the device contexts should work for SIOV device as_i=
s.
> Member id would be different.
> Some device context TLVs may be new as SIOV may have some simplifications=
 as it may not have the giant register space like current one.

You only explain the migration part but not the transport part.

>
> >
> > > How brand new non-compatible SIOV device to transport this, is outsid=
e of
> > the scope of this work.
> >
> > You invented one that can be used for doing this. If you disagree, how =
can we
> > know your proposal can work for SIOV without a transport then?
>
> I don=E2=80=99t understand your comment.
>
> All I am saying is, most pieces of device contexts are reusable across VF=
s and SIOVs.
> When SIOV is defined, we can relook at what may need to be added.

I've explained several times. Transport virtqueue is not solely
designed for SIOV. SIOV could be one of the use cases.

Thanks

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

