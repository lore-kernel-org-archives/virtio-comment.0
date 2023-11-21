Return-Path: <virtio-comment-return-8483-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D62FFC5ACB3
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:21:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 208FC2AEE3
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:21:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F0C2A986886
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:21:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DACFC98413B; Tue, 21 Nov 2023 04:21:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C9786986874
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 04:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: UOuC5MnjMSCSmgjA_ofR4Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700540514; x=1701145314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7POkg928Fs8YwpiXfKTh4dX7siwtcIN4BJ8vfVLDPx8=;
        b=SVyhH6I4B58vKrwA31Z18mwCmticpiuhZPRiO2mw2vL6ZXrBweVU9ofX0rdoLyuvVK
         QSkGULcDMJgckwyPNPtiCPTWAFmNJKqlc2jImUVn2uxosCUlJ2ZliA6L4JY0ZIHD1O74
         VWeiTg5wdH9EQgF0zVgs6q8PCKq9GRtlpPGG8+Jsz9DdWDWJvDEIeYfSVvqSR9i8NrTK
         /Y76eAV7wvPVimXS+nbjcK8FgXsbSNf4ISxHIdnedMjBvhXMk6mIGeMZ21IO7oJEqqDk
         jZxrEQ/t9JWVVK7iXwl0cFllbvOyU9CUy49x1MH3F6zuYjhVctdpp1zWR6pEBl6emnb0
         b0Kw==
X-Gm-Message-State: AOJu0YzVcckQcboF5xXYPNz/gygIx1lsPeS9MZY/CXqSp/jlViU4PuOa
	eYd3oAWV708q4E17xnHnKHIgixH3coa+MxDjybkbTDHQritRpCwm1xNTANZSfiX+KIj9NSDFWj6
	om5s/dZqV9ooxJAEq09n9qOgK98PliHaSiy3owjF2KP4XsjJ3sw==
X-Received: by 2002:ac2:4c53:0:b0:506:899d:1989 with SMTP id o19-20020ac24c53000000b00506899d1989mr7518097lfk.44.1700540513920;
        Mon, 20 Nov 2023 20:21:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+2CYSZUVUiBCzL4X9XCpH2POThrSP4t6VFHeHSzBX3pjAM+WYvSFiekAXHpyqnYQFcjI/PA153okZQiMA74Y=
X-Received: by 2002:ac2:4c53:0:b0:506:899d:1989 with SMTP id
 o19-20020ac24c53000000b00506899d1989mr7518093lfk.44.1700540513580; Mon, 20
 Nov 2023 20:21:53 -0800 (PST)
MIME-Version: 1.0
References: <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org> <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org> <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org> <PH0PR12MB54813C84CFA5601DB1B47885DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu-Zs-dxcYRjtV+hLBVy5Tv9JzgT2c83Zjzt7A-a1QR2A@mail.gmail.com>
 <PH0PR12MB54810DA3AAA7631319B2C1BFDCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsWN38gptqRBN=50LY6S-yJ0cRQcJk=kih9Dj-7bm0V6Q@mail.gmail.com> <20231116014250-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231116014250-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Nov 2023 12:21:41 +0800
Message-ID: <CACGkMEtb6QF=m3n+yp4-NLXoCHSpQb--iN5XKLmGXCCpCoP_Uw@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording commands

On Thu, Nov 16, 2023 at 2:49=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Thu, Nov 16, 2023 at 12:24:27PM +0800, Jason Wang wrote:
> > On Thu, Nov 16, 2023 at 1:37=E2=80=AFAM Parav Pandit <parav@nvidia.com>=
 wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Monday, November 13, 2023 9:11 AM
> > > >
> > > > On Fri, Nov 10, 2023 at 2:46=E2=80=AFPM Parav Pandit <parav@nvidia.=
com> wrote:
> > > > >
> > > > > Hi Michael,
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Thursday, November 9, 2023 1:29 PM
> > > > >
> > > > > [..]
> > > > > > > Besides the issue of performance, it's also racy, assuming we=
 are
> > > > > > > logging
> > > > > > IOVA.
> > > > > > >
> > > > > > > 0) device log IOVA
> > > > > > > 1) hypervisor fetches IOVA from log buffer
> > > > > > > 2) guest map IOVA to a new GPA
> > > > > > > 3) hypervisor traverse guest table to get IOVA to new GPA
> > > > > > >
> > > > > > > Then we lost the old GPA.
> > > > > >
> > > > > > Interesting and a good point. And by the way e.g. vhost has the=
 same
> > > > > > issue.  You need to flush dirty tracking info when changing the
> > > > > > mappings somehow.  Parav what's the plan for this? Should be ad=
dressed in
> > > > the spec too.
> > > > > >
> > > > > As you listed the flush is needed for vhost or device-based DPT.
> > > >
> > > > What does DPT mean? Device Page Table? Let's not invent terminology=
 which is
> > > > not known by others please.
> > > >
> > > Sorry for using the acronym. I meant dirty page tracking.
> > >
> > > > We have discussed it many times. You can't just depend on ATS or re=
inventing
> > > > wheels in virtio.
> > > The dependency is on the iommu which would have the mapping of GIOVA =
to GPA like any sw implementation.
> > > No dependency on ATS.
> > >
> > > >
> > > > What's more, please try not to give me the impression that the prop=
osal is
> > > > optimized for a specific vendor (like device IOMMU stuffs).
> > > >
> > > You should stop calling this specific vendor thing.
> >
> > Well, as you have explained, the confusion came from "DPT" ...
> >
> > > One can equally say that suspend bit proposal is for the sw_vendor de=
vice who is forcing virtio hw device to only implement ioqueues + PASID + n=
on_unified interface for PF, VF, SIOVs + non_TDISP based devices.
> > >
> > > > > The necessary plumbing is already covered for this in the query (=
read and
> > > > clear) command of this v3 proposal.
> > > >
> > > > The issue is logging via IOVA ... I don't see how "read and clear" =
can help.
> > > >
> > > Read and clear helps that ensures that all the dirty pages are report=
ed, hence there is no mapping/unmapping race.
> >
> > Reported as IOVA ...
> >
> > > As everything is reported.
> > >
> > > > > It is listed in Device Write Records Read Command.
> > > >
> > > > Please explain how your proposal can solve the above race.
> > > >
> > > In below manner.
> > > 1. guest has GIOVA to GPA_1 mapping
> > > 2. RX packets occurred to GIOVA
> > > 3. device reported dirty page log for GIOVA (hypervisor is yet to rea=
d)
> > > 4. guest requested mapping change from GIOVA to GPA_2
> > > 4.1 During this IOTLB is invalidated and dirty page report is queried=
 ensuring, it can change the mapping
> >
> > It requires
> >
> > 1) hypervisor traps IOTLB invalidation, which doesn't work when
> > nesting could be offloaded (IOMMUFD has started the work to support
> > nesting)
> > 2) query the device about the dirty page on each IOTLB invalidation whi=
ch:
> > 2.1) A huge round trip: guest IOTLB invalidation -> trapped by
> > hypervisor -> start the query from the device -> device return ->
> > hypervisor reports IOTLB invalidation is done -> let guest run. Have
> > you benchmarked the RTT in this case? There are just too many places
> > that cause the delay in the middle.
>
> To be fair invalidations are already expensive e.g. with vhost iotlb
> it requires a slow system call.
> This will make them *even more* expensive.

Yes, a slow syscall plus a virtqueue query RTT.

Need some benchmark. It looks to me currently the invalidation is done
via a queued based interface in vtd. So guests may need to spin where
it may trigger a lockup in the guest.

>
> Problem for some but not all workloads.  Again I agree motivation,
> tradeoffs and comparison with both dirty tracking by iommu and shadow vq
> approaches really should be included.

+1

>
>
> > 2.2) Guest triggerable behaviour, malicious guest can simply do
> > endless IOTLB invalidation to DOS the e.g admin virtqueue
>
> I'm not sure how much to worry about it - just don't allow more
> than one in flight per VM.

That's fine but it may need a note.

Thanks


>
>
>
> > >
> > > > >
> > > > > When the page write record is fully read, it is flushed.
> > > > > How/when to use, I think its hypervisor specific, so we probably =
better off not
> > > > documenting those details.
> > > >
> > > > Well, as the author of this proposal, at least you need to know how=
 a hypervisor
> > > > can work with your proposal, no?
> > > >
> > > Likely yes, but it is not the scope of the spec to list those paths e=
tc.
> >
> > Fine, but as a reviewer I need to know if it can work with a hypervisor=
 well.
> >
> > >
> > > > > May be such read is needed in some other path too depending on ho=
w
> > > > hypervisor implemented.
> > > >
> > > > What do you mean by "May be ... some other path" here? You're inven=
ting a
> > > > mechanism that you don't know how a hypervisor can use?
> > >
> > > No. I meant hypervisor may have more operations that map/unmap/flush =
where it may need to implement it.
> > > Some one may call it set_map(), some may say dma_map()...
> >
> > Ok.
> >
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

