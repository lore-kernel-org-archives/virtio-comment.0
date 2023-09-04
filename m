Return-Path: <virtio-comment-return-7248-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1167C71153
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Sep 2023 13:28:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0B42B8504B
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Sep 2023 13:28:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EDA409864AB
	for <virtio-comment@archiver.kernel.org>; Mon,  4 Sep 2023 13:28:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E5BCA9863B7; Mon,  4 Sep 2023 13:28:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D6190986478
	for <virtio-comment@lists.oasis-open.org>; Mon,  4 Sep 2023 13:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: O-V1gwz3N2eXuge9JJJQZg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693834107; x=1694438907;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fUkf4fGAnKTqeglOoSwXJeky/KI8L0jiWHNoQIXwHTo=;
        b=TsKLNj1hEOolcQbbzThio9V3uxXNCbh1+ND+g0D7kTXLFr1L94PJMAgMvWtGPody/Y
         hNgsVEb0OBN3FAYxsXIKGHQzlyAzbyWYAX0EqMTtDt2RBZR/rTUmqnonqAfeDlf3YGv+
         uSetM8Xf9AUeqn68Bu30BVWY2/Nf0Wn4xSqAARIc/BFl7sAB1lljJaWZIAq2XTT0Uj+h
         AQPiJSEDyAGkD/fgB9fqmesPL+L9df2mF2QPRJ6V/OY7C8GQVmJ86SspRhj2F/Gx4Hmu
         r4c1qBAT/1HCv5/Izyfnp47cSN8Z5b53ZHtxruj8nEGDpilGlHR4DunsCUnkFDHsSocH
         1uRQ==
X-Gm-Message-State: AOJu0YxG0gp14w/QnHo0rPkSVwwNMEWXJ0umhqQ/CZCwLdLevINr/Bkp
	FDFGFzMg1xtQ7pbAU3hcnt5Y5wHOxEHUcLkTjhB9csL+KuQ+LCKtWReA8VrZuvcyTD1hQ9UjdVG
	678awhUuWZSo1aKKdKWgg2xjyV8qnlmDqCw==
X-Received: by 2002:a17:906:5346:b0:9a1:d67c:b4f2 with SMTP id j6-20020a170906534600b009a1d67cb4f2mr6416426ejo.77.1693834107202;
        Mon, 04 Sep 2023 06:28:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbftJ0XCz+7p5sTjwo1rCmr4ScJQWf7xrgzTRxq3eF5Ad+ORrrpPKcbtuHn9SrP/SdQGnyhQ==
X-Received: by 2002:a17:906:5346:b0:9a1:d67c:b4f2 with SMTP id j6-20020a170906534600b009a1d67cb4f2mr6416414ejo.77.1693834106852;
        Mon, 04 Sep 2023 06:28:26 -0700 (PDT)
Date: Mon, 4 Sep 2023 09:28:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	David Edmondson <david.edmondson@oracle.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230904092711-mutt-send-email-mst@kernel.org>
References: <20230830055239.10680-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB54819EB466305284A8C9F649DCE4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1693812824.959417-1-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB5481859AEB22FDDFCDA9D57FDCE9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1693814534.4663684-3-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB548167EDE78C3B7C00014D2CDCE9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <1693817561.0941262-4-xuanzhuo@linux.alibaba.com>
 <PH0PR12MB54812E119F4F042F78B95150DCE9A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <526c4582-3521-45ad-afae-8d7e281b5f38@linux.alibaba.com>
 <PH0PR12MB54813CB40389462B1667184ADCE9A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54813CB40389462B1667184ADCE9A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio-dev] RE: RE: RE: RE: [PATCH v16] virtio-net: support
 device stats

On Mon, Sep 04, 2023 at 12:21:48PM +0000, Parav Pandit wrote:
> > From: Heng Qi <hengqi@linux.alibaba.com>
> > Sent: Monday, September 4, 2023 4:41 PM
> > 
> > 在 2023/9/4 下午6:26, Parav Pandit 写道:
> > >> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > >> Sent: Monday, September 4, 2023 2:23 PM
> > >
> > >>> "The device MUST NOT pass received packets that exceed mtu (plus low
> > >>> level ethernet header length) size with gso_type NONE or ECN after
> > >> VIRTIO_NET_F_MTU has been successfully negotiated."
> > >>
> > >> NO.
> > >>
> > >> If the mtu is 1500, we can pass 64k packets to the driver with
> > >> gso_type (not NONE).
> > > Any supporting citation to spec for above comment?
> > 
> > I think it can be referred here:
> > "The converse features are also available: a driver can save the virtual device
> > some work by negotiating these features. Note: For example, a network packet
> > transported between two guests on the same system might not need
> > checksumming at all, nor segmentation, if both guests are amenable."
> > 
> Sure, it can avoid segmentation, but not at the cost of skipping mtu check.
> For example, sender sends skb with gso with each segment of 9K, and
> receiver has mtu of 1500, same skb without segmentation is not good.
> Because gso_size should be same as 1500 to match the mtu.  One can say
> with violation of line " The device MUST NOT pass received packets..."
> things still work fine because guest is amenable. :)
> 
> So counter looks ok to me when VIRTIO_NET_F_MTU is not negotiated or
> when mtu matches.

If someone misconfigures the LAN with different devices using
different MTU values .... all bets are off. OK we can put something
in spec e.g. for debugging but really just don't do this.

> > >
> > > Each packet must be 1500 for the mtu normative above.
> > > gso_size to <= mtu (ingoring the hdr math for simplicity for now).
> > > whole GSO completion can be for 64K to be reported in used_elem.len.
> > >
> > > ---------------------------------------------------------------------
> > > To unsubscribe, e-mail: virtio-dev-unsubscribe@lists.oasis-open.org
> > > For additional commands, e-mail: virtio-dev-help@lists.oasis-open.org
> 


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

