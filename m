Return-Path: <virtio-comment-return-8351-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46BF3C4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 07:52:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 642CB2B140
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 07:52:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 46F5A986D6E
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 07:52:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 30F45986D66; Tue, 14 Nov 2023 07:52:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 203D7986D67
	for <virtio-comment@lists.oasis-open.org>; Tue, 14 Nov 2023 07:52:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Mpy8_y1yOc-lsKRgAflJ6w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699948339; x=1700553139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sgNWuJsuRnKT/QxZ5TU3gKfGzJAN00zI0di+deOP5R8=;
        b=b6WNm6cq+2xu5zpcLkuQAJL/9dD1l89RcWCfG0aeEjYLMZbB56VHElz3GQw9rexsZA
         Zdt92BXxQxuUTgXbdzR96uquxACAyLfYGtyPH8c7CtEd+N8CMWzzbQ/zRZCQtnMp9i7g
         9xJnWQKz3G5bspSILss4A9nV8SBquXD5HjrWxV2zv0Dx+zqJW77+jFWW5AZXYRGw6+Ze
         Rtm5E5EFZQvpHfPG6Qxhy1sAwY7awRKChwOX2ZWdl0/o6JXvrBOMAfo32gnqdqIRa6+K
         U7TXO1nd+6vuObRuYvWqPjJRZaIomy6IK7WQhecKwshBZXGE4aXf3Pvft+tyjmmbBF64
         ZqlQ==
X-Gm-Message-State: AOJu0YxiDrWHlSIMUVdlT/PAyu05PRej76VFx0vPw4b5htK7yaygPU3J
	DEkuGq9U3zTyLD4C9lHdcmjtF9TfVI0G6QxmtUemvMNJ9jz0e5+EoJIRPBhWeSOx+Fcp4YHaipW
	6ps9oBRLjOt8fd31Z+lQEkakYp377dagK8issFGBEqg2o3oR5aQ==
X-Received: by 2002:ac2:434d:0:b0:508:26b2:7803 with SMTP id o13-20020ac2434d000000b0050826b27803mr5568182lfl.69.1699948339659;
        Mon, 13 Nov 2023 23:52:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJk9CNo4rrobWDzjg47o7oSaAf7o4C+ec5N6M/kv74frY/XzMl39/Dg/ycxjr3CFJGpTMKJuEGHQSUsblZBTk=
X-Received: by 2002:ac2:434d:0:b0:508:26b2:7803 with SMTP id
 o13-20020ac2434d000000b0050826b27803mr5568068lfl.69.1699948335471; Mon, 13
 Nov 2023 23:52:15 -0800 (PST)
MIME-Version: 1.0
References: <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org> <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org> <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org> <PH0PR12MB54813C84CFA5601DB1B47885DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu-Zs-dxcYRjtV+hLBVy5Tv9JzgT2c83Zjzt7A-a1QR2A@mail.gmail.com>
 <20231113015854-mutt-send-email-mst@kernel.org> <3e83842d-edb5-4d3c-983a-b9d03f8d9497@intel.com>
In-Reply-To: <3e83842d-edb5-4d3c-983a-b9d03f8d9497@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 14 Nov 2023 15:52:04 +0800
Message-ID: <CACGkMEutPFdfxjkZaRnyQkpMC-pZ1kYNse3QT_TNPoEA1YAJHg@mail.gmail.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Tue, Nov 14, 2023 at 10:04=E2=80=AFAM Zhu, Lingshan <lingshan.zhu@intel.=
com> wrote:
>
>
>
> On 11/13/2023 10:30 PM, Michael S. Tsirkin wrote:
> > On Mon, Nov 13, 2023 at 11:41:07AM +0800, Jason Wang wrote:
> >> On Fri, Nov 10, 2023 at 2:46=E2=80=AFPM Parav Pandit <parav@nvidia.com=
> wrote:
> >>> Hi Michael,
> >>>
> >>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>> Sent: Thursday, November 9, 2023 1:29 PM
> >>> [..]
> >>>>> Besides the issue of performance, it's also racy, assuming we are l=
ogging
> >>>> IOVA.
> >>>>> 0) device log IOVA
> >>>>> 1) hypervisor fetches IOVA from log buffer
> >>>>> 2) guest map IOVA to a new GPA
> >>>>> 3) hypervisor traverse guest table to get IOVA to new GPA
> >>>>>
> >>>>> Then we lost the old GPA.
> >>>> Interesting and a good point. And by the way e.g. vhost has the same=
 issue.  You
> >>>> need to flush dirty tracking info when changing the mappings somehow=
.  Parav
> >>>> what's the plan for this? Should be addressed in the spec too.
> >>>>
> >>> As you listed the flush is needed for vhost or device-based DPT.
> >> What does DPT mean? Device Page Table? Let's not invent terminology
> >> which is not known by others please.
> >>
> >> We have discussed it many times. You can't just depend on ATS or
> >> reinventing wheels in virtio.
> >>
> >> What's more, please try not to give me the impression that the
> >> proposal is optimized for a specific vendor (like device IOMMU
> >> stuffs).
> > Devices with IOMMU exist.

It only exists for very few vendors. Whether or not virtio needs a
device IOMMU is a separate topic.

Again, it's far easier to leverage what platform can give us than
re-inventing stuff in virtio.

> > So if it's for device IOMMU that's fine, as long as it's well isolated.
> device side IOMMU is not a must and I hope virito features don't depend
> on it.

Exactly, and I didn't see any description in this series to:

1) claim the feature depends on device IOMMU
2) invent interfaces for device IOMMU

Thanks



> >
> >
> >>> The necessary plumbing is already covered for this in the query (read=
 and clear) command of this v3 proposal.
> >> The issue is logging via IOVA ... I don't see how "read and clear" can=
 help.
> >>
> >>> It is listed in Device Write Records Read Command.
> >> Please explain how your proposal can solve the above race.
> >>
> >>> When the page write record is fully read, it is flushed.
> >>> How/when to use, I think its hypervisor specific, so we probably bett=
er off not documenting those details.
> >> Well, as the author of this proposal, at least you need to know how a
> >> hypervisor can work with your proposal, no?
> >>
> >>> May be such read is needed in some other path too depending on how hy=
pervisor implemented.
> >> What do you mean by "May be ... some other path" here? You're
> >> inventing a mechanism that you don't know how a hypervisor can use?
> >>
> >> Thanks
> >
> > It seems like a subtle enough race that it really should be documented.
> >
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

