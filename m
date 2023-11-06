Return-Path: <virtio-comment-return-8203-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD70C4167D
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:33:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 866F22AEEB
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:33:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4FD9498672E
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:33:40 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 324D598671A; Mon,  6 Nov 2023 10:33:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1CE0A98671B
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 10:33:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wf3rhc12PxWEewIeE7DyAA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699266813; x=1699871613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPb8r/ZHxHlr98W6CGLAmrPsz7ARHae9isKb3d9WFvM=;
        b=NmAHhHkRYQ0s7BiVUBdSi9NtvpEtCYelz6mlGc9YyVq8nuSfiz2OXTDopCxK6agXpE
         3tEheWxltGNvTy7MqnEKqm4cKbqhnH+46i5QJwFEto/MqhXB7RLuTXnlcBbRNNhnb+4W
         hF7rbS1z4jJsW7gzrKwFiFI01PNkUngNzQ+GELU9OK7NhtWZNNOzKN5cW9JGQlUQDXqF
         qcPL+kiQMICj2NJxkvRUWymF4HJo80EbaJ7mTw/IIUIQCazcwR780wupoJRoS6/FF8mv
         9EteeIM6HEp2Kh0OYTOnxhhlpJTmrXfCK2uqbkfTeS8b+YoFdbQzArnyt1dF/EPuEIIp
         itIA==
X-Gm-Message-State: AOJu0YxZoDqspRJNqSBU5Z1+Ckk0ygnQRvPdmV4PXj/EoBeeXzGThX8L
	J2nuOvhfyixo8Pv5012+2GvQXjgIJ4bpFRc48Bgt3CVvctHxp8taxIvypqVPn54mCgduEQxbo+Q
	RHu4kqZf0X8RbGYAQ+4D1L6rzTLcs4jGRuw==
X-Received: by 2002:ac2:5928:0:b0:504:3499:7c37 with SMTP id v8-20020ac25928000000b0050434997c37mr20796774lfi.60.1699266812969;
        Mon, 06 Nov 2023 02:33:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBUCat8CDWGxqb+N7/nufn7OGIQoymBaXP/hij56cmZLNxBgW1kpJSip9JOw1N4i6oxjSqKA==
X-Received: by 2002:ac2:5928:0:b0:504:3499:7c37 with SMTP id v8-20020ac25928000000b0050434997c37mr20796760lfi.60.1699266812625;
        Mon, 06 Nov 2023 02:33:32 -0800 (PST)
Date: Mon, 6 Nov 2023 05:33:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231106052953-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231105075906-mutt-send-email-mst@kernel.org>
 <b672e459-30be-49b1-91d6-c4461d8475ed@intel.com>
MIME-Version: 1.0
In-Reply-To: <b672e459-30be-49b1-91d6-c4461d8475ed@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Mon, Nov 06, 2023 at 11:58:03AM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/6/2023 12:12 AM, Michael S. Tsirkin wrote:
> > On Fri, Nov 03, 2023 at 03:47:34PM +0000, Parav Pandit wrote:
> > > > > [1]
> > > > > https://lists.oasis-open.org/archives/virtio-comment/202310/msg00475.h
> > > > > tml
> > > > you still need to explain why this does not work for pass-through.
> > > It does not work for following reasons.
> > > 1. Because all the fields that put on the member device are not in direct control of the hypervisor.
> > > The device is directly controlled by the guest including the device status and when it resets the device all the things stored in the device are lost.
> > I think the idea is that when this gateway is in the device then
> > device reset has to trap. At a high level, ok. But then what?
> No, when device reset, the device is expected to forget everything and
> re-intialize.

That's a problem then - memory that was already written will not be
detected as such.

> > Is a full scan of all memory required until device reset is complete?
> Who scan the memory? The device tracks its own dirty pages.

yes but reset erases this information.


> > Drivers currently tend to busy poll the reset register,
> > if this takes very long we might start seeing soft lockup
> > messages. What is the idea then? Maybe for this we need a separate
> > weaker reset that does not touch this capability?
> When reset, how can we expect the LM progress continue running.
> 
> For example, when the device DMA writes something, then reset before sending
> an interrupt,
> the DMA-ed pages should be lost as expected, right?

interrupt is going to guest, has nothing to do with it.

device writes data into memory
device sends interrupt
driver sees data
driver sends reset

meanwhile hypervisor did not see any dirty pages

now what? hypervisor must apparently retrieve all
dirty page data before it can reset the device.

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

