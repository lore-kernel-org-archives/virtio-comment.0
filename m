Return-Path: <virtio-comment-return-8198-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9891AC4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:46:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id EA7392AEF1
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:46:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BB3B5986729
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 09:46:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9CE0198670A; Mon,  6 Nov 2023 09:46:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8D477986712
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 09:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Yq_3EGmLPcqQlhxGzBwgkA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699263963; x=1699868763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LqX85yl9GbvQDc3YIt6DGpdBc+mzamCUfKd6eEsQr0=;
        b=nr4Ix1yEfr9L0U/86c9CAtUoaOz61BNC/Dg6jymXopj5PqEoqkoPKgN16ac6tiIkSw
         eMRCC/5+GKDRaAcYHaDBEZofLS0sB4rRA2uNRtZsxZraqpXXxSKLkOa1wqZUgNE+MW5x
         bZNTHH7CFwK0FLRd8z5mJzUPK6YpNXDT4u2Xkyb7ajgwjkvQ3UZe7zlBVtX42xIwl4Up
         1A0G0IlzxCupD5vSx6THlhZQm4Z7OGD75rLoF9bBnQqVFYtZPmAptIrtXwlBCpxsw+wH
         fF78M6qZC93ET/C3sMsReSU9V9QyOuHezQ9PeRuM4vFjnbRsPosvaZwnpG7npX8EuA+D
         A59A==
X-Gm-Message-State: AOJu0Yy3xvty6LrliVqSfnAoWuHFi6CjWzt1yQ2ectrfifjmJtfCHi0H
	XXPXqdLc9wqaaAY91a5uhwEuDQM+QSam3a1271NoGeMIPsHRayeH11AHW0kO43X3Vhn4psKPwtq
	tRi3RQaRzZVS+Fy5ap2cMaR9ZyFdliqYeew==
X-Received: by 2002:a05:600c:45cb:b0:405:3ae6:2413 with SMTP id s11-20020a05600c45cb00b004053ae62413mr23796422wmo.25.1699263963412;
        Mon, 06 Nov 2023 01:46:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHev0z4z0HaYLUu49Q41ZRk0KsMUEacxtdTcE6qLdyiKpTAXx287u+C+I1JJrm8BkBq50oSqQ==
X-Received: by 2002:a05:600c:45cb:b0:405:3ae6:2413 with SMTP id s11-20020a05600c45cb00b004053ae62413mr23796404wmo.25.1699263963000;
        Mon, 06 Nov 2023 01:46:03 -0800 (PST)
Date: Mon, 6 Nov 2023 04:45:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231106044347-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-2-lingshan.zhu@intel.com>
 <20231103065138-mutt-send-email-mst@kernel.org>
 <d2f3c5cd-0376-460a-9230-4098863f1bb7@intel.com>
 <20231106042108-mutt-send-email-mst@kernel.org>
 <dfeba16d-8bfc-438a-8968-ab03d05cce75@intel.com>
MIME-Version: 1.0
In-Reply-To: <dfeba16d-8bfc-438a-8968-ab03d05cce75@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 1/6] virtio: introduce virtqueue state

On Mon, Nov 06, 2023 at 05:42:10PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/6/2023 5:35 PM, Michael S. Tsirkin wrote:
> > On Fri, Nov 03, 2023 at 10:49:42PM +0800, Zhu, Lingshan wrote:
> > >          +When SUSPEND is set, the device MUST record the Available State of every enabled splited virtqueue
> > >          +in \field{Available State} field,
> > >          +and correspondingly restore the Available State of every enabled splited virtqueue
> > >          +from \field{Available State} field when DRIVER_OK is set.
> > >          +
> > >          +The device SHOULD reset \field{Available State} field upon a device reset.
> > > 
> > >      At this point I have no idea
> > >      - how can a state of a virtqueue at a random time be represented
> > >        by a 16 bit integer
> > > 
> > > not sure what is a random time, this is to request the device to reset
> > > its avail state, for example, it is "le16 queue_avail_state" in virtio-pci
> > > common cfg. Resetting this so the device will not recover from a wrong value of
> > > the last run.
> > You simply never bother to say what is "Available State" and what
> > does it mean to restore it.  Not to mention words like "splited"
> > which just adds to the confusion.
> It says:
> +The available state field is two bytes of virtqueue state that is used by
> +the device to read the next available buffer. It is presented in the
> following format:
> 
> Do you want me to add more descriptions?

maybe start with an example

> > 
> > >      - if it's not at a random time then why do you even need an integer -
> > >        synchronize queue to memory and then all state is in memory
> > > 
> > > Not sure what is a sync queue, but for example, "le16 queue_avail_state" for
> > > PCI transport exists in a cap.
> > I just point out that normally a lot of ring state is in memory.
> > So you need to be much more specific about how you are augmenting that.
> > For example, if buffers are used exactly in order for a split ring
> > then used index seems to be exactly the same as last available index
> > you describe - it's a free running counter. OTOH if they are not
> > used in order then I don't see how is a single index sufficient to
> > describe which ones have been used and which not.
> I am not sure I get it.
> 
> Used idx(not like packed vq, no over-writing descriptors) and other states
> are in guest memory, so migrated with guest migration.

yes and so? why is that not enough and what is this available state then?

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

