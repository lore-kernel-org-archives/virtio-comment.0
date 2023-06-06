Return-Path: <virtio-comment-return-6187-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70B3C7EE43
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:03:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 124A1EEA08
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:03:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0437E986586
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:03:28 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EC63198657E; Tue,  6 Jun 2023 23:03:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D91FB986585
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 23:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: q36k7kqMM7aLTNxGd1oN8Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686092604; x=1688684604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMwg3vxaHzjo6PA8fdboB5pZkqh3LkGAUpcjvqhvZjg=;
        b=RqEuns02eKXPd7XpQkWcjrXE+1Zvtgb8wc/qd2hw2eIX7zoCncZnGMnzV8THRKfGzG
         GqXnCU8TqFcT4OgqU7jQKfeDeUzlkd3QcmtK+LC/rmKxN4/Vv0Mnbwt11/7xK4/Kc5FH
         zI9rGLGHoqiDgZneqbJwtHO5u9yoLu1Nq2PkqYnPixxWH71Mb1IdaZBNh4VeXNF/sksH
         83eo+1ZZK/zUCaEuVOE6VYGzuQDJQOxI+wexyz8iIlp3+cyatovOc20IBd+n6JctGa/W
         GYvtQKtXVmOt7aYFRpY56KhZzxFBCreq2oDnVEIVXTh83ma4xgdYlJTGKFh6UHUQh0v7
         hNTA==
X-Gm-Message-State: AC+VfDxhdoLe5CHnlLJdUCho85LsGiaUoimczV8z1d1j+yq0nfL4KAY0
	l8zqpDGmnocyp0JXsP6sVyVLOhi5LTJyUPva8/t4nSfQXtsvfz914g5XmSntwUVeSNegN89gwRd
	/A+S5KMS30rcK9ZgkfYShGCJpD7hhi8LQhg==
X-Received: by 2002:a7b:ca50:0:b0:3f6:476:915 with SMTP id m16-20020a7bca50000000b003f604760915mr3041634wml.6.1686092604103;
        Tue, 06 Jun 2023 16:03:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5D0Ki3eQWp6nCmrubQjME7uO3Hb1ZOYAByKqqx63gp1R1CC2dOVkNoYIDMjggpcIGmGtEx/g==
X-Received: by 2002:a7b:ca50:0:b0:3f6:476:915 with SMTP id m16-20020a7bca50000000b003f604760915mr3041623wml.6.1686092603728;
        Tue, 06 Jun 2023 16:03:23 -0700 (PDT)
Date: Tue, 6 Jun 2023 19:03:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20230606185651-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-4-parav@nvidia.com>
 <20230606182640-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54818B593D9BB94F2ACED28ADC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54818B593D9BB94F2ACED28ADC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 3/7] net-features: Add low
 latency receive queue requirements

On Tue, Jun 06, 2023 at 10:44:04PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, June 6, 2023 6:33 PM
> > 
> > On Fri, Jun 02, 2023 at 01:03:01AM +0300, Parav Pandit wrote:
> > > Add requirements for the low latency receive queue.
> > >
> > > Signed-off-by: Parav Pandit <parav@nvidia.com>
> > > ---
> > >  net-workstream/features-1.4.md | 38
> > > +++++++++++++++++++++++++++++++++-
> > >  1 file changed, 37 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/net-workstream/features-1.4.md
> > > b/net-workstream/features-1.4.md index 55f1b1f..054f951 100644
> > > --- a/net-workstream/features-1.4.md
> > > +++ b/net-workstream/features-1.4.md
> > > @@ -7,7 +7,7 @@ together is desired while updating the virtio net interface.
> > >
> > >  # 2. Summary
> > >  1. Device counters visible to the driver -2. Low latency tx virtqueue
> > > for PCI transport
> > > +2. Low latency tx and rx virtqueues for PCI transport
> > >
> > >  # 3. Requirements
> > >  ## 3.1 Device counters
> > > @@ -107,3 +107,39 @@ struct vnet_data_desc desc[2];
> > >
> > >  7. Ability to place all transmit completion together with it per packet stream
> > >     transmit timestamp using single PCIe transcation.
> > > +
> > > +### 3.2.2 Low latency rx virtqueue
> > > +1. The device should be able to write a packet receive completion that
> > consists
> > > +   of struct virtio_net_hdr (or similar) and a buffer id using a single DMA write
> > > +   PCIe TLP.
> > 
> > why? what is wrong with it being linear with packet instead?
> >
> It prohibits header data split,
> it requires multiple DMAs for the metadata consumed by single driver layer.
> Data processed by one layer is placed in two different locations.
> This hurts performance.

only with split yes? refer to that then.

maybe combine with the header split part?
these two seem intervined.


>  
> > > +2. The device should be able to perform DMA writes of multiple packets
> > > +   completions in a single DMA transaction up to the PCIe maximum write
> > limit
> > > +   in a transaction.
> > > +3. The device should be able to zero pad packet write completion to align it
> > to
> > > +   64B or CPU cache line size whenever possible.
> > 
> > assuming completion is used buffer, these are eactly 64 bytes with packed vq,
> > and they are linear so can be written in one transaction.
> When a packet spans multiple buffers, they cannot be written in contiguous manner.

oh you mean when you manage to stick packet itself in the queue?
this idea is only mentioned down the road.


> > if so why list requirements which are already met?
> > if you want them for completeness mention this.
> > 
> > > +4. An example of the above DMA completion structure:
> > > +
> > > +```
> > > +/* Constant size receive packet completion */ struct
> > > +vnet_rx_completion {
> > > +   u16 flags;
> > > +   u16 id; /* buffer id */
> > > +   u8 gso_type;
> > > +   u8 reserved[3];
> > > +   le16 gso_hdr_len;
> > > +   le16 gso_size;
> > > +   le16 csum_start;
> > > +   le16 csum_offset;
> > > +   u16 reserved2;
> > > +   u64 timestamp; /* explained later */
> > > +   u8 padding[];
> > > +};
> > > +```
> > > +5. The driver should be able to post constant-size buffer pages on a receive
> > > +   queue which can be consumed by the device for an incoming packet of any
> > size
> > > +   from 64B to 9K bytes.
> > 
> > possible with mrg buffers
> > 
> It doesn't scale to post constant size 64B buffer.

maybe - figure out the actual requirement then.


> > > +6. The device should be able to know the constant buffer size at receive
> > > +   virtqueue level instead of per buffer level.
> > 
> > the bigger question is not communicating to device. that is trivial.
> > the bigger question is that linux IP stack seems to benefit from variable sized
> > packets because buffers waste precious kernel memory.
> Want to avoid the wastage and still achieve constant size posting.

ok mention this maybe.

> > is this for non IP stack such as xdp? non-linux guests? dpdk perhaps?
> > 
> For Linux kernel guest.

constant size buffers will inevitably waste memory i don't see
a way around that.

> > > +7. The device should be able to indicate when a full page buffer is consumed,
> > > +   which can be recycled by the driver when the packets from the completed
> > > +   page is fully consumed.
> > 
> > no idea what this means.
> >
>  Instead of driver nearly allocating a page and splitting into buffer nearly of same size, an approach to post the page and let device to consume it based on packet size.

oh I see. interesting. not easy as this does not fit the
buffer abstraction.

-- 
MST


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

