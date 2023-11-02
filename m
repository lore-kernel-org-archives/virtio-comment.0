Return-Path: <virtio-comment-return-8103-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746B6C0018C
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 04:24:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A49652A8EB
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 04:24:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 98180986BEF
	for <virtio-comment@archiver.kernel.org>; Thu,  2 Nov 2023 04:24:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8D19B986BE3; Thu,  2 Nov 2023 04:24:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7D295986BE4
	for <virtio-comment@lists.oasis-open.org>; Thu,  2 Nov 2023 04:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: oI3TZtvNNEqF0zLwY3bShQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698899078; x=1699503878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AnYIXqFENkmBm14GieDZZyWkSJ9el4saVUbBTalwWMI=;
        b=HBDWBxrUjLgmst/h9SqE9IIDpxVX5Bj0Fx/f401hngX2OOjxHV949/hGO8lNnnuqxN
         NrIYZV74bgwSlO1A26eHq+loMDRdF/RgGk+Chb86OdIOw0JtNekoFVmitvA2iERCv+Zi
         xKRCRtQRblwRnGOFum5zccmjsMDPzOYSc6Kv/o4fH8fTdi2VUWOFLVkS1W+OPIDNfVSL
         nH5wmei4eyy18S9gg9lF9PyBkZbx69B9kjG7RI3F/DhXhiEv4WfS/hD2ZkFI9s7Ytmpp
         +1jO2UDS4zoqL4EAy4WcJ8KPzUsVfMwXM8IVFzje5AFpIN8JveD1q91ujOC4a2kGkxAX
         nk5Q==
X-Gm-Message-State: AOJu0Yzf1IiqFPKBeTVAKMn0m8LIRW1hc8aIu81sEHf0So6xXXsh7oSB
	V53ggZsWGSK1+WgUoodu1pIi2BSG2in8m36hmw5wUu73M5XHx3b5KhrAermvr1pmZo6mhaDp+jJ
	22WKkAGK77Z4N7FDPz3XCHr8IvJBQAgxoYK93todvWIy6pFiGuA==
X-Received: by 2002:a25:348b:0:b0:d9a:4f14:5bf9 with SMTP id b133-20020a25348b000000b00d9a4f145bf9mr13926120yba.26.1698899077715;
        Wed, 01 Nov 2023 21:24:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFd7yypEQhaoXHXz8Lgt3QsfsNDMiYfiUj9hx6G9PYtIi4mdsr3ksJcEFGB+U5YqLlBWHryGnOM87Vc6v+fOP8=
X-Received: by 2002:a25:348b:0:b0:d9a:4f14:5bf9 with SMTP id
 b133-20020a25348b000000b00d9a4f145bf9mr13926109yba.26.1698899077369; Wed, 01
 Nov 2023 21:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20231030131959.1386107-1-parav@nvidia.com> <20231030131959.1386107-7-parav@nvidia.com>
 <CACGkMEuHBRwH9LqC+_jBX5OFrzhJw88AZeAQBou+G_hZK1F2Ug@mail.gmail.com>
 <PH0PR12MB54811B1D566FA64E693E20D6DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuA6u-EJCsrhvBRKxB6nxG=H28SEh4ihM3Ptgn1FQdGKA@mail.gmail.com> <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 2 Nov 2023 12:24:24 +0800
Message-ID: <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, "mst@redhat.com" <mst@redhat.com>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording commands

On Wed, Nov 1, 2023 at 11:02=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, November 1, 2023 6:00 AM
> >
> > On Tue, Oct 31, 2023 at 11:27=E2=80=AFAM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, October 31, 2023 7:13 AM
> > > >
> > > > On Mon, Oct 30, 2023 at 9:21=E2=80=AFPM Parav Pandit <parav@nvidia.=
com> wrote:
> > > > >
> > > > > During a device migration flow (typically in a precopy phase of
> > > > > the live migration), a device may write to the guest memory. Some
> > > > > iommu/hypervisor may not be able to track these written pages.
> > > > > These pages to be migrated from source to destination hypervisor.
> > > > >
> > > > > A device which writes to these pages, provides the page address
> > > > > record of the to the owner device. The owner device starts write
> > > > > recording for the device and queries all the page addresses
> > > > > written by the device.
> > > > >
> > > > > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/176
> > > > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > > > Signed-off-by: Satananda Burla <sburla@marvell.com>
> > > > > ---
> > > > > changelog:
> > > > > v1->v2:
> > > > > - addressed comments from Michael
> > > > > - replaced iova with physical address
> > > > > ---
> > > > >  admin-cmds-device-migration.tex | 15 +++++++++++++++
> > > > >  1 file changed, 15 insertions(+)
> > > > >
> > > > > diff --git a/admin-cmds-device-migration.tex
> > > > > b/admin-cmds-device-migration.tex index ed911e4..2e32f2c 100644
> > > > > --- a/admin-cmds-device-migration.tex
> > > > > +++ b/admin-cmds-device-migration.tex
> > > > > @@ -95,6 +95,21 @@ \subsubsection{Device
> > > > > Migration}\label{sec:Basic Facilities of a Virtio Device /  The
> > > > > owner driver can discard any partially read or written device
> > > > > context when  any of the device migration flow
> > > > should be aborted.
> > > > >
> > > > > +During the device migration flow, a passthrough device may write
> > > > > +data to the guest virtual machine's memory, a source hypervisor
> > > > > +needs to keep track of these written memory to migrate such
> > > > > +memory to destination
> > > > hypervisor.
> > > > > +Some systems may not be able to keep track of such memory write
> > > > > +addresses at hypervisor level. In such a scenario, a device
> > > > > +records and reports these written memory addresses to the owner
> > > > > +device. The owner driver enables write recording for one or more
> > > > > +physical address ranges per device during device migration flow.
> > > > > +The owner driver periodically queries these written physical add=
ress
> > records from the device.
> > > >
> > > > I wonder how PA works in this case. Device uses untranslated
> > > > requests so it can only see IOVA. We can't mandate ATS anyhow.
> > > Michael suggested to keep the language uniform as PA as this is ultim=
ately
> > what the guest driver is supplying during vq creation and in posting bu=
ffers as
> > physical address.
> >
> > This seems to need some work. And, can you show me how it can work?
> >
> > 1) e.g if GAW is 48 bit, is the hypervisor expected to do a bisection o=
f the whole
> > range?
> > 2) does the device need to reserve sufficient internal resources for lo=
gging the
> > dirty page and why (not)?
> No when dirty page logging starts, only at that time, device will reserve=
 enough resources.

GAW is 48bit, how large would it have then? What happens if we're
trying to migrate more than 1 device?

>
> > 3) DMA is part of the transport, it's natural to do logging there, why =
duplicate
> > efforts in the virtio layer?
> He he, you have funny comment.
> When an abstract facility is added to virtio you say to do in transport.

So it's not done in the general facility but tied to the admin part.
And we all know dirty page tracking is a challenge and Eugenio has a
good summary of pros/cons. A revisit of those docs make me think
virtio is not the good place for doing that for may reasons:

1) as stated, platform will evolve to be able to tracking dirty pages,
actually, it has been supported by a lot of major IOMMU vendors
2) you can't assume virtio is the only device that can be used by the
guest, having dirty pages tracking to be implemented in each type of
device is unrealistic
3) inventing it in the virtio layer will be deprecated in the future
for sure, as platform will provide much rich features for logging e.g
it can do it per PASID etc, I don't see any reason virtio need to
compete with the features that will be provided by the platform
4) if the platform support is missing, we can use software or leverage
transport for assistance like PRI

> When one does something in transport, you say, this is transport specific=
, do some generic.
>
> Here the device is being tracked is virtio device.
> PCI-SIG has told already that PCIM interface is outside the scope of it.
> Hence, this is done in virtio layer here in abstract way.

You will end up with a competition with the platform/transport one
that will fail.

>
> > I can't see how it can compete with the functionality
> > that is provided by the platform. And what's more, we can't assume virt=
io is the
> > only device that is used by the guest.
> >
> You raised this before and it was answered.
> Not all platform support dirty page tracking effectively.
> This is optional facility that speed up the migration down time significa=
ntly.

I can hardly believe the downtime is determined by the speed of
logging dirty pages...

> So until platform supports it, it is supported by virtio.

Some platforms already support that.

Thanks

>
> > Thanks
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

