Return-Path: <virtio-comment-return-6439-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3709BEB64D8
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 19:36:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0D9492CADC
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 19:35:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B8E569865CF
	for <virtio-comment@archiver.kernel.org>; Wed, 21 Jun 2023 19:35:55 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AF1D99865BA; Wed, 21 Jun 2023 19:35:55 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 99EE59865BD
	for <virtio-comment@lists.oasis-open.org>; Wed, 21 Jun 2023 19:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: RzGM_folOgehNmercPt-gg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687376151; x=1689968151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBkAeXciafu3w0TWzsDfncwLro1e8fXKMm7HYn4DPkU=;
        b=TpLbMZ0bDgrkn6CJC/VhqdcETJDS8891iMYwBaQnnjD1G3I2WxreRW+nkU7R8QkUzL
         mxrZzcPuxxnO20s5QjXl0+8F+sQrXnezvSGMhRV9zcr23cKgVVSKDm1ZJiK9U4ET0RE+
         LsXLXz/g4kTtyXYHzFMzyJG7gWP0vqhe+VyLcW7NQWScJuAbwc1rH4s/nv29b4nUGEZN
         UE2LduEL8HJ8qXisk15gcfKsgHr1PCcKSaQMRToRZoAgBs9uchVT/j8mSIPuQTy8xHC/
         wDi6jHkaf8dyDekBg1vpwZRCrb4YDr7MtkdOTQJ92c9Ki+bSxMD0c8yV9pseP/Ub26UB
         KxNQ==
X-Gm-Message-State: AC+VfDxqb25rkiV8R7LJbtoMCt/fZeWBBANPgwv22uVp99HXJpvvWImh
	w37XAXetTSWLlLxHaf+DqXpLHcb6u8IHFWDo8Wmkjj7Kb/0QZXkzYSCKOuADGpx9SaedjQxS5sv
	6G1rOiObS+3Vqy0j4XTcXjPPnod5DPWjGWA==
X-Received: by 2002:a17:907:318b:b0:978:9e92:f903 with SMTP id xe11-20020a170907318b00b009789e92f903mr14185769ejb.46.1687376151207;
        Wed, 21 Jun 2023 12:35:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ51NOKM6Hh8QN0QCcGLMN0OqKzbU24DH+VSjfeMgqWRfUYyLOh0do5mrwNmWyPSg9IfSAguew==
X-Received: by 2002:a17:907:318b:b0:978:9e92:f903 with SMTP id xe11-20020a170907318b00b009789e92f903mr14185759ejb.46.1687376150843;
        Wed, 21 Jun 2023 12:35:50 -0700 (PDT)
Date: Wed, 21 Jun 2023 15:35:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Cornelia Huck <cohuck@redhat.com>
Message-ID: <20230621153237-mutt-send-email-mst@kernel.org>
References: <20230621135052.76028-1-hengqi@linux.alibaba.com>
 <20230621104647-mutt-send-email-mst@kernel.org>
 <20230621164606.GI74977@h68b04307.sqa.eu95>
 <PH0PR12MB54819746DF66F968E532195EDC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230621152451-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481FDB711FBC0528822106FDC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481FDB711FBC0528822106FDC5DA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v18] virtio-net: support inner
 header hash

On Wed, Jun 21, 2023 at 07:28:33PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, June 21, 2023 3:26 PM
> > 
> > On Wed, Jun 21, 2023 at 05:52:28PM +0000, Parav Pandit wrote:
> > >
> > > > From: Heng Qi <hengqi@linux.alibaba.com>
> > > > Sent: Wednesday, June 21, 2023 12:46 PM
> > >
> > >
> > > > SET carries an additional 32 bits of information. But if you think
> > > > this will make the overall structure more concise, I'm ok.
> > > >
> > > If it is placed in single structure than it needs to be reworded to remove WO
> > or RO notion.
> > 
> > Not really. all of structure is RO and WO.
> >
> For the device, what is the meaning of driver writing supported_tunnel_types in SET command?
> Ignore? It doesn't make sense to pass something to ignore.

It can be helpful for debugging. E.g. if driver sets
a bit that device does not recognize, it can figure
out that driver has it set in supported mask.
Or if it seems like a waste we can just ask drivers to
put 0 there, works for me too.


> Two structures are cleaner.

Frankly what's cleaner is what RSS is doing, supported mask in config
space. Was this discussed in some version? I don't remember.

> > > This also requires additional sw to indicate dma attributes to be RW when
> > mapping this area.
> > > And extra text to indicate that supported_hash_tunnel_types to be ignored
> > on set command.
> > >
> > > Two structures are more cleaner serving its purpose.
> > 
> > No because all of structure is RO or WO.
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


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

