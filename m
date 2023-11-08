Return-Path: <virtio-comment-return-8257-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1A8C4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 07:11:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B163B33591
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 07:11:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8F61D986C9D
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Nov 2023 07:11:57 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 71BE9986C92; Wed,  8 Nov 2023 07:11:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6160D986C93
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Nov 2023 07:11:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: FA5gof20OE6BydDK1YaLgw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699427513; x=1700032313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Kvvk+14UsqixohKePBqjm+bUlZ+XN/QwjJMIcuisAg=;
        b=afiSvv03WCMhiGONKhYmHK9THk4VQfj66dSPLmCCAMKRu3k25Gx3J4/V0QI+PFR+iP
         u9/8lUmR3vROK4RWbAbmJYRNBm7CdLCaFCxZD1mtnszMdSqLjs+AjGk0054QsLFPHIFo
         sHW/FC6jhMYsTwiMPUHP1NMzehAtZnYrTyg7QjG71Vn1wL5bAmflwmM20sKf/W8nPTD6
         MzO+EuV8BBudHQoL/6m7ijoEXPhUXrxGukmSumI5ANhHzJcmc/I1KQ8vZb+QzvaBP6Td
         wJfzq7nk7ofm4SyVziD/HRoIHlwLwQiX38x7hLsXWsqvJT4tuuOmtwmhSCz+CzFeh8fU
         WX5w==
X-Gm-Message-State: AOJu0YwVb3LRwosDi2EBvaWCv/KOWwwD/rfQwafSudsv7CgD7K6OMU0M
	OTAwX0RPxozo+awaENAbxomzc9VLwZYV2/NIOw/LrCQkJt70l07V6RrfeIqVmHSWx/c5cagh2rm
	Ow1mQt6ezASyApX2Uu9VfzyhjmELu7dj/mQbwEKf2al0xPJCtzg==
X-Received: by 2002:ac2:5633:0:b0:503:224f:9c55 with SMTP id b19-20020ac25633000000b00503224f9c55mr437246lff.8.1699427513382;
        Tue, 07 Nov 2023 23:11:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQ+6XK/5Kvfb7w+TI+4UhFVdKbHkpyckB1k85MAJG5QjYcb+FGDmRUd3uhTdOD+1+VkOs+2c+tl0Fzgjm1o9w=
X-Received: by 2002:ac2:5633:0:b0:503:224f:9c55 with SMTP id
 b19-20020ac25633000000b00503224f9c55mr437238lff.8.1699427513069; Tue, 07 Nov
 2023 23:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org> <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com> <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com> <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com> <PH0PR12MB54810847007367DD75FA3D60DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <431c0495-f0d9-46d6-8336-cc2bd293cc35@intel.com> <20231107051012-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813AC62A9D6811585A159DDCA9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548142AE109CA96BCE5A351ADCA9A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548142AE109CA96BCE5A351ADCA9A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 8 Nov 2023 15:11:41 +0800
Message-ID: <CACGkMEvcRgfwhQWJmBYtOjMWT97-rgZ4p5LjZ+JbTpsDP8kqkw@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Tue, Nov 7, 2023 at 7:24=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
> > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > open.org> On Behalf Of Parav Pandit
> > Sent: Tuesday, November 7, 2023 4:43 PM
>
> > My humble input is:
> > 1. Accept the two use cases listed of vfio and vdpa being practical to =
support
> > existing stacks 2. Try to converge two cases; if there is common virtio=
 spec
> > framework it can use 3. If they can, great lets use it.

That's my point as well.

> > 4. If not, both use cases need different infrastructure, so build two.
> >
> > Do you have any better suggestions to support both use cases?
>
> And both use cases can be serviced by proposed admin commands with differ=
ent hypervisor layers to use them.

I think it still has some open questions that need to be answered.

> If something is missing, we can extend these admin commands further.
>

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

