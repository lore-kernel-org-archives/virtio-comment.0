Return-Path: <virtio-comment-return-8583-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687AAC61DF4
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:15:59 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A1B0160D2B
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:15:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 85CBF9868B3
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:15:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6C47E986890; Fri, 24 Nov 2023 03:15:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5B3739868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 03:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: muEbC6ocPi-4qeX17P-hdw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700795754; x=1701400554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QnPQTXU8oGF78Gex+E2IWdkQC2UPmoJdrZwUXQfF14Q=;
        b=IEBAkOh1E1HWaTaA9Z3lV3V1s1u9buthnhPKkDiXkt1EvntTg6NGpK+4Dmj0ysmPR6
         9SAaCBYmQHQK4Xw8alLx2l0IJMbX/aLxl3x6+nX+yLvLGA+Vb8JMS0khrWaOoaGMxGc6
         jB4anB4Y9ADAemx66mmp8R0fUTPET+HhChIb/sKpODthF8q0Nnavjr+krbgJWreMA15F
         LD/KDRBU4NwucH4FK0/oEo+4xy9/rzlJAYg04JTR1VmSdJrPZRcNQz74HYYXTXlEtNch
         CwxJJv/FXUDPuR6l5lYvLvpVKY0aAsrdr5D9ingIz1Elst93TNW+4Q9Z98QhP6J7aYy8
         cztQ==
X-Gm-Message-State: AOJu0Yw3Y5AKBYVPVNJaKI8Pr1bGVsbM+PFPWe2kzXZdNNygzoDetdB8
	ulIJhl3gCAgZ0GboBf1kCyWgMVX/CarF5zW22RRcCNSUq1xgcxQV+PFCRxcjSzty2W0WvbXBkWy
	tFKER7vrvR/oE/Cta40r7g22Ce0+x9wjBVeuNxmNL/vOVsXOxyQ==
X-Received: by 2002:ac2:53a7:0:b0:508:12f5:f808 with SMTP id j7-20020ac253a7000000b0050812f5f808mr695427lfh.57.1700795754076;
        Thu, 23 Nov 2023 19:15:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnqp/S7kLv4dBAh1bQVIHfz0Z3OcRuEx3fp7WRCxx5MXGgBVMfZlxsA8udR+1xQZYu7JQzY8BaPpOiQ2Py0CY=
X-Received: by 2002:ac2:53a7:0:b0:508:12f5:f808 with SMTP id
 j7-20020ac253a7000000b0050812f5f808mr695415lfh.57.1700795753742; Thu, 23 Nov
 2023 19:15:53 -0800 (PST)
MIME-Version: 1.0
References: <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org> <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117044428-mutt-send-email-mst@kernel.org> <PH0PR12MB5481E8342B26739B852B592FDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117053117-mutt-send-email-mst@kernel.org> <PH0PR12MB5481632B9E440DDCBEEA7B75DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117062003-mutt-send-email-mst@kernel.org> <PH0PR12MB548133582D377B3FE4BB9F6CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117073917-mutt-send-email-mst@kernel.org> <PH0PR12MB5481CD9329189829A8A6B6D1DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtEEj8jXeE7JHyFk6UkBkEP5vpYzXPHHSGpSjDKQivJAg@mail.gmail.com>
 <PH0PR12MB5481036FE38E03DDFAE1D13CDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtpSFBp2oVtawgs8k7S-kp2DFXBdSW6_y3nrt3L-ZkSSg@mail.gmail.com> <PH0PR12MB5481E84F1DD4C0165B1FDD1EDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481E84F1DD4C0165B1FDD1EDCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 11:15:42 +0800
Message-ID: <CACGkMEuaLieCAZOiCHc15_YLCxmergbAO9pDJw58pQE9nztHkQ@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Wed, Nov 22, 2023 at 12:35=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, November 22, 2023 9:48 AM
> >
> > On Wed, Nov 22, 2023 at 12:29=E2=80=AFAM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, November 21, 2023 10:47 AM
> > > >
> > > > On Fri, Nov 17, 2023 at 8:51=E2=80=AFPM Parav Pandit <parav@nvidia.=
com> wrote:
> > > > >
> > > > >
> > > > > > From: virtio-comment@lists.oasis-open.org
> > > > > > <virtio-comment@lists.oasis- open.org> On Behalf Of Michael S.
> > > > > > Tsirkin
> > > > > > Sent: Friday, November 17, 2023 6:11 PM
> > > > > >
> > > > > > On Fri, Nov 17, 2023 at 12:22:59PM +0000, Parav Pandit wrote:
> > > > > > >
> > > > > > >
> > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > Sent: Friday, November 17, 2023 5:03 PM
> > > > > > > > To: Parav Pandit <parav@nvidia.com>
> > > > > > >
> > > > > > > > > Somehow the claim of shadow vq is great without sharing
> > > > > > > > > any performance
> > > > > > > > numbers is what I don't agree with.
> > > > > > > >
> > > > > > > > It's upstream in QEMU. Test it youself.
> > > > > > > >
> > > > > > > We did few minutes back.
> > > > > > > It results in a call trace.
> > > > > > > Vhost_vdpa_setup_vq_irq crashes on list corruption on net-nex=
t.
> > > > > >
> > > > > > Wrong list for this bug report.
> > > > > >
> > > > > > > We are stopping any shadow vq tests on unstable stuff.
> > > > > >
> > > > > > If you don't want to benchmark against alternatives how are you
> > > > > > going to prove your stuff is worth everyone's time?
> > > > >
> > > > > Comparing performance of the functional things count.
> > > > > You suggest shadow vq, frankly you should post the grand numbers
> > > > > of
> > > > shadow vq.
> > > >
> > > > We need an apple to apple comparison. Otherwise you may argue with
> > > > that, no?
> > > >
> > > When the requirements are met the comparison can be made of the
> > solution.
> > > And I don=E2=80=99t see that the basic requirements are matching for =
two different
> > use cases.
> > > So no point in discussing one OS specific implementation as reference
> > point.
> >
> > Shadow virtqueue is not OS specific, it's a common method. If you disag=
ree,
> > please explain why.
> >
> As you claim shadow virtqueue is generic not dependent on OS, how does I =
benchmark on QNX today?

You know Qemu is portable? How did you benchmark QNX with your proposal?

>
> > > Otherwise I will end up adding vfio link in the commit log in next ve=
rsion as
> > you are asking similar things here and being non neutral to your ask.
> >
> > When doing a benchmark, you need to describe your setups, no? So any
> > benchmark is setup specific, nothing wrong.
> >
> > It looks to me you claim your method is better, but refuse to give proo=
fs.
> >
> I gave details to Michael in the email. Please refer.
>
> > >
> > > Anyway, please bring the perf data whichever you want to compare in
> > another forum. It is not the criteria anyway.
> >
> > So how can you prove your method is the best one? You have posted the
> > series for months, and so far I still don't see any rationale about why=
 you
> > choose to go that way.
> It is explained in theory of operation.
> You refuse to read it.

Can you tell me which part in your v4 explains why you choose to go this wa=
y?

"""
+During the device migration flow, a passthrough device may write data to t=
he
+guest virtual machine's memory, a source hypervisor needs to keep
track of these
+written memory to migrate such memory to destination hypervisor.
+Some systems may not be able to keep track of such memory write addresses =
at
+hypervisor level. In such a scenario, a device records and reports these
+written memory addresses to the owner device. The owner driver enables wri=
te
+recording for one or more physical address ranges per device during device
+migration flow. The owner driver periodically queries these written physic=
al
+address records from the device. As the driver reads the written
address records,
+the device clears those records from the device.
+Once the device reports zero or small number of written address
records, the device
+mode is set to \field{Stop} or \field{Freeze}. Once the device is set
to \field{Stop}
+or \field{Freeze} mode, and once all the IOVA records are read, the
driver stops
+the write recording in the device.
"""

>
> >
> > This is very odd as we've gone through several methods one or two years=
 ago
> > when discussing vDPA live migration.
> >
> It does not matter as this is not vdpa forum.
>
> > >
> > > > >
> > > > > It is really not my role to report bug of unstable stuff and
> > > > > compare the perf
> > > > against.
> > > >
> > > > Qemu/KVM is highly relevant here no? And it's the way to develop th=
e
> > > > community. The shadow vq code is handy.
> > > It is relevant for direct mapped device.
> >
> > Let's focus on the function then discuss the use cases. If you can't pr=
ove your
> > proposal has a proper function, what's the point of discussing the use =
cases?
> >
> The proper function is described.
> You choose to not accept in favour of considering on the vdpa.

Is the discussion here any relevant to vDPA. I'm telling you to use
the platform IOMMU, how is it related to vDPA?

>
> > > There is absolutely no point of converting virtio device to another
> > virtualization layer and run again and get another virtio device.
> > > So for direct mapping use case shadow vq is not relevant.
> >
> > It is needed because shadow virtqueue is the baseline. Most of the issu=
es
> > don't exist in the case of shadow virtqueue.
> >
> I disagree.
> For direct mapping there is no virtio specific OS layer involved.

Again, you need to prove if direct mapping can work.

And I've pointed out the "direct mapping" of vq for dirty page
tracking can work with "direct mapping" of vIOMMU.

> Hence shadow vq specific implementation is not appliable.
>
> > We don't want to end up with a solution that
> >
> > 1) can't outperform shadow virtqueue
> Disagree. There is no shadow vq in direct mapping. No comparison.
>
> > 2) have more issues than shadow virtqueue
> >
> There are none.

I think I've pointed out sufficient issues, if you choose to ignore
those issues, the discussion is going nowhere.

>
> > > For other use cases, please continue.
> > >
> > > >
> > > > Just an email to Qemu should be fine, we're not asking you to fix t=
he bug.
> > > >
> > > > Btw, how do you define stable? E.g do you think the Linus tree is s=
table?
> > > >
> > > Basic test with iperf is not working. Crashing it.
> >
> > As a kernel developer, dealing with crashing at any layer is pretty com=
mon.
> > No?
> >
> So, kernel developers do not ask to compare the crashing code.

Report it and let the community fix it then compare again.

This is how the community runs.

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

