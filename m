Return-Path: <virtio-comment-return-8379-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F44C197A0
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 04:24:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5BEC2750A7
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 04:24:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 51FF9986DD8
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 04:24:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 487F9986DCB; Thu, 16 Nov 2023 04:24:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3A6F9986DCC
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 04:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: SL0nYgczMV6ngYJ2HXD7Xg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700108679; x=1700713479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfsd7vT2YWZJ+fQxtMxsRXNqNjZgeD7BW8WzllIyTXM=;
        b=BZb9t3cSXEtfEu/h3nc9fOBoN102Sxh/5F5WWIPxq1m6M9hyzNMbhn9Tx5OxmQkmaD
         8v1yOw6QR+rl0bCj4I/KKRkGwQQbORkNK2I7s8Fz+qzieM6TU98KujPQDCtxmbXHKjDC
         DjnrqOZj4/h8RYEdHvu8aenQVz0qbpfbdxFToYNr4b4lJmQ5KZfhaVvwjhRPJNUCwC6N
         bT7WQM/b38s2Tu5xROGYEAmH2MRwUA+kAzj/klO0oLY0gmz68wnvcjJJaT2nctxpDsoI
         RFYYz1BuNKsLVm08un0ooizZjuB4+qrDMjZTSPCO5wk4wESVAr6i6sCEj+9EMLFHdnNM
         tnFQ==
X-Gm-Message-State: AOJu0YwFS07poPcyL5ai4x+6cG/vGEaNBWU1rCE5caBn0G7Xv1qgHm8M
	LcbjreYvhDpJozB1RZRovbFpRObKU9BS/bh6xmwsrJW51TDpAfkgfScvoJuGFRwJSEfvHrbX90z
	brZLB23rKCv9oKw66ecPOIxL+KqgqManMcZaAN4npRs/2EKegXg==
X-Received: by 2002:ac2:43a3:0:b0:509:3bba:e8a with SMTP id t3-20020ac243a3000000b005093bba0e8amr9581176lfl.39.1700108678968;
        Wed, 15 Nov 2023 20:24:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAxhG6k95tKDwvQrwTfIW5yQd6+LjGsc130ez9Isk5+EBEiqem6WYYCPWC1GKmcUsxY2IvD3EKQDv52SW2968=
X-Received: by 2002:ac2:43a3:0:b0:509:3bba:e8a with SMTP id
 t3-20020ac243a3000000b005093bba0e8amr9581169lfl.39.1700108678659; Wed, 15 Nov
 2023 20:24:38 -0800 (PST)
MIME-Version: 1.0
References: <DM8PR12MB54809F8316720CE5C1BCFF33DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtFyH_wJAqTz=jwosVM-=SRuO+wpT7NM=Eod8ExsxfTsg@mail.gmail.com>
 <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org> <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org> <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org> <PH0PR12MB54813C84CFA5601DB1B47885DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu-Zs-dxcYRjtV+hLBVy5Tv9JzgT2c83Zjzt7A-a1QR2A@mail.gmail.com> <PH0PR12MB54810DA3AAA7631319B2C1BFDCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54810DA3AAA7631319B2C1BFDCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 16 Nov 2023 12:24:27 +0800
Message-ID: <CACGkMEsWN38gptqRBN=50LY6S-yJ0cRQcJk=kih9Dj-7bm0V6Q@mail.gmail.com>
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
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording commands

On Thu, Nov 16, 2023 at 1:37=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Monday, November 13, 2023 9:11 AM
> >
> > On Fri, Nov 10, 2023 at 2:46=E2=80=AFPM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > > Hi Michael,
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Thursday, November 9, 2023 1:29 PM
> > >
> > > [..]
> > > > > Besides the issue of performance, it's also racy, assuming we are
> > > > > logging
> > > > IOVA.
> > > > >
> > > > > 0) device log IOVA
> > > > > 1) hypervisor fetches IOVA from log buffer
> > > > > 2) guest map IOVA to a new GPA
> > > > > 3) hypervisor traverse guest table to get IOVA to new GPA
> > > > >
> > > > > Then we lost the old GPA.
> > > >
> > > > Interesting and a good point. And by the way e.g. vhost has the sam=
e
> > > > issue.  You need to flush dirty tracking info when changing the
> > > > mappings somehow.  Parav what's the plan for this? Should be addres=
sed in
> > the spec too.
> > > >
> > > As you listed the flush is needed for vhost or device-based DPT.
> >
> > What does DPT mean? Device Page Table? Let's not invent terminology whi=
ch is
> > not known by others please.
> >
> Sorry for using the acronym. I meant dirty page tracking.
>
> > We have discussed it many times. You can't just depend on ATS or reinve=
nting
> > wheels in virtio.
> The dependency is on the iommu which would have the mapping of GIOVA to G=
PA like any sw implementation.
> No dependency on ATS.
>
> >
> > What's more, please try not to give me the impression that the proposal=
 is
> > optimized for a specific vendor (like device IOMMU stuffs).
> >
> You should stop calling this specific vendor thing.

Well, as you have explained, the confusion came from "DPT" ...

> One can equally say that suspend bit proposal is for the sw_vendor device=
 who is forcing virtio hw device to only implement ioqueues + PASID + non_u=
nified interface for PF, VF, SIOVs + non_TDISP based devices.
>
> > > The necessary plumbing is already covered for this in the query (read=
 and
> > clear) command of this v3 proposal.
> >
> > The issue is logging via IOVA ... I don't see how "read and clear" can =
help.
> >
> Read and clear helps that ensures that all the dirty pages are reported, =
hence there is no mapping/unmapping race.

Reported as IOVA ...

> As everything is reported.
>
> > > It is listed in Device Write Records Read Command.
> >
> > Please explain how your proposal can solve the above race.
> >
> In below manner.
> 1. guest has GIOVA to GPA_1 mapping
> 2. RX packets occurred to GIOVA
> 3. device reported dirty page log for GIOVA (hypervisor is yet to read)
> 4. guest requested mapping change from GIOVA to GPA_2
> 4.1 During this IOTLB is invalidated and dirty page report is queried ens=
uring, it can change the mapping

It requires

1) hypervisor traps IOTLB invalidation, which doesn't work when
nesting could be offloaded (IOMMUFD has started the work to support
nesting)
2) query the device about the dirty page on each IOTLB invalidation which:
2.1) A huge round trip: guest IOTLB invalidation -> trapped by
hypervisor -> start the query from the device -> device return ->
hypervisor reports IOTLB invalidation is done -> let guest run. Have
you benchmarked the RTT in this case? There are just too many places
that cause the delay in the middle.
2.2) Guest triggerable behaviour, malicious guest can simply do
endless IOTLB invalidation to DOS the e.g admin virtqueue

>
> > >
> > > When the page write record is fully read, it is flushed.
> > > How/when to use, I think its hypervisor specific, so we probably bett=
er off not
> > documenting those details.
> >
> > Well, as the author of this proposal, at least you need to know how a h=
ypervisor
> > can work with your proposal, no?
> >
> Likely yes, but it is not the scope of the spec to list those paths etc.

Fine, but as a reviewer I need to know if it can work with a hypervisor wel=
l.

>
> > > May be such read is needed in some other path too depending on how
> > hypervisor implemented.
> >
> > What do you mean by "May be ... some other path" here? You're inventing=
 a
> > mechanism that you don't know how a hypervisor can use?
>
> No. I meant hypervisor may have more operations that map/unmap/flush wher=
e it may need to implement it.
> Some one may call it set_map(), some may say dma_map()...

Ok.

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

