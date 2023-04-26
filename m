Return-Path: <virtio-comment-return-5651-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83541C7618E
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 04:12:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2C6513F570
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 04:12:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B989D986647
	for <virtio-comment@archiver.kernel.org>; Wed, 26 Apr 2023 04:12:31 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AB26398663C; Wed, 26 Apr 2023 04:12:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 964D69865E2
	for <virtio-comment@lists.oasis-open.org>; Wed, 26 Apr 2023 04:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: skRRr-03MD-QSsHiuDjVYQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682482346; x=1685074346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+6G41G9ENo4lB1hx4wAIewCaxIm4D+82/OaDTqpLAg=;
        b=c0AzxWiLyZ+17ZE5Re7roy2+KOevO1MuOF+di9+/N2HM2d+8+RyB8apEfgFirHIUOM
         cvVMp5FxySyUVh4dEo+eVJg92M0YD+9BUKYXKRUNZIYYoK8wncJybtfNhClxAlpm9Ent
         kuz8ew0zj9Ide6C4VBA8kmAQ3gNYdDdXJOwpxE3CkMa6HsoPzEu1J44maEQHnGJLjYQi
         Xzid4RYyRL9/jg7U4/vpresnMRTnALkeAKYUI7SxaKgE+r4LhrGiU16N9v7dfQW5xrF9
         oGVWm0qUIedzdkLiZ2RjgS598GvWU7C9/aUTUpMukzKqvUVbUb5uRK/A8ez/n8Zc+MVN
         o9QQ==
X-Gm-Message-State: AC+VfDyFoi4Y1djPVDJZ5953mrFZk5XSWUz218siKioOtWpOvIEM47De
	K+xW/YTLTjrgiHgCZLKmtBYb8y+uwLHp3IlHVFrf5NUURJrqtfbTNKYfIh3QcyPnUv2Wmq/Eq9U
	hIwIizH3MlLmq5DTmDZcLf6NcW+MvoBh+EQ==
X-Received: by 2002:a5d:4f8e:0:b0:2ef:afe0:727a with SMTP id d14-20020a5d4f8e000000b002efafe0727amr558501wru.12.1682482346701;
        Tue, 25 Apr 2023 21:12:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4CXNDhcY76eK2o8SkANkcUJHJRrSFxx58gbnF7ZEBcHYULN9Ta/o6XX/DYdsHpM/493Ex6bw==
X-Received: by 2002:a5d:4f8e:0:b0:2ef:afe0:727a with SMTP id d14-20020a5d4f8e000000b002efafe0727amr558489wru.12.1682482346362;
        Tue, 25 Apr 2023 21:12:26 -0700 (PDT)
Date: Wed, 26 Apr 2023 00:12:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230426000032-mutt-send-email-mst@kernel.org>
References: <20230423073532.105636-1-hengqi@linux.alibaba.com>
 <f9221063-8419-9cb3-e59c-0b0393bdd501@nvidia.com>
 <20230425170341-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548148E35F4F0242A71FC5DFDC649@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548148E35F4F0242A71FC5DFDC649@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v13] virtio-net: support inner
 header hash

On Tue, Apr 25, 2023 at 09:39:28PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, April 25, 2023 5:06 PM
> > > On 4/23/2023 3:35 AM, Heng Qi wrote:
> > > >   \subsubsection{Legacy Interface: Feature bits}\label{sec:Device
> > > > Types / Network Device / Feature bits / Legacy Interface: Feature bits} @@
> > -198,6 +202,7 @@ \subsection{Device configuration layout}\label{sec:Device
> > Types / Network Device
> > > >           u8 rss_max_key_size;
> > > >           le16 rss_max_indirection_table_length;
> > > >           le32 supported_hash_types;
> > > > +        le32 supported_tunnel_hash_types;
> > 
> > this needs a comment explaining it only exists with some feature bits.
> > 
> Yes, it is already there.
> +Field \field{supported_tunnel_hash_types} only exists if the device supports inner header hash, i.e. if VIRTIO_NET_F_HASH_TUNNEL is set.
> +
> I think it should be changed from "device supports" to "driver negotiated".
> 
> > > >   };
> > > In v12 I was asking this to move to above field from the config area
> > > to the GET command in comment [1] as,
> > >
> > > "With that no need to define two fields at two different places in
> > > config area and also in cvq."
> > 
> > I think I disagree.
> > the proposed design is consistent with regular tunneling.
> > 
> Sure.
> I understand how config space has evolved from 0.9.5 to know without much attention, but really expanding this way is not helpful.
> It requires building more and more RAM based devices even for PCI PFs, which is sub optimal.

No, this is ROM, not RAM.

> CVQ already exists and provides the SET command. There is no reason to do GET in some other way.

Spoken looking at just hardware cost :)
The reason is that this is device specific. Maintainance overhead and
system RAM cost for the code to support this should not be ignored.

> Device has single channel to provide a value and hence it doesn't need any internal synchronization between two paths.
> 
> So, if we add a new feature bit as VIRTIO_F_CFG_SPACE_OVER_AQ it is an improvement.
> But it still comes with a cost which device cannot mitigate.
> The cost is, 
> 1. a driver may not negotiate such feature bit, and device ends up burning memory.
> 1.b Device provisioning becomes a factor of what some guests may use/not use/already using on the live system.
> 
> 2. Every device needs AQ even when the CVQ exists.
> 
> Hence, better to avoid expanding current structure for any new fields, specially which has the SET equivalent.
> 
> But if we want to with the path of VIRTIO_F_CFG_SPACE_OVER_AQ, it is fine.
> More things can evolve for generic things like config space over AQ.

I am not sure what does VIRTIO_F_CFG_SPACE_OVER_AQ mean, and what are
these costs.  What I had in mind is extending proposed vq transport to
support sriov. I don't see why we can not have exactly 0 bytes of memory
per VF.

And if we care about single bytes of PF memory (do we? there's only one
PF per SRIOV device ...), what we should do is a variant of pci
transport that aggressively saves memory.


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

