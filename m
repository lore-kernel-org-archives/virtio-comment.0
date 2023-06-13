Return-Path: <virtio-comment-return-6337-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79FDEEB64D7
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 21:48:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A0DBC42827
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 21:48:32 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 87B9098663D
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 21:48:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 77ABE986603; Tue, 13 Jun 2023 21:48:32 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 631E2986630
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Jun 2023 21:48:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: dZ2vozmQO_28opvQXxSNQw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686692909; x=1689284909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RmhGpmqVCD06mLnl3emCzU8ntan4WQp6m3AtztGTtw=;
        b=CLeID7ZDpzMfWt/hokYkoAql+WXfscHjlO/VDbHiJoiwoL3qmJsnodpAGkkpTiuLq8
         I6RMmB64Jk9uL+VmQjyMF0fd0kdkQabhKgeGMDv1hHPeqdCtQ7nQuac60gaJ+Eb97lfJ
         6kzYvUYvKH89dDIKl4d41ZRsEG6qtwOjQ0tLN17sunsE3sRTstI3pzPvnKeke1ayVzMe
         fWis6A/cbPZLkfBWT773KIIbMYzO6yIDnP0qLQzADVrtg8rMtfySP2O6VDAz9qUaSFqH
         WAcp4y8Cq5/NP05GNgd5dzSDTw3+ooW20qFVCJn606TqIP9fd5lqem6OBCSL2n6r4p0R
         6f1Q==
X-Gm-Message-State: AC+VfDy6tuNh6d1dH9684UY2z3QG4JjZWq4HSMTeTfTKML3Vx3Qlu1bK
	K1qaW+9F0DPyWSgcPXB2MNuDg9LsDl7zWzWcLMDAdYtgP4qJO44+BAlgfnt7OASj9Iy/Cd8Ck5b
	83sBh/hWICigiEqEJuOE+ynsRR4VC5z9K+g==
X-Received: by 2002:a5d:45d0:0:b0:30f:bb0a:fcbc with SMTP id b16-20020a5d45d0000000b0030fbb0afcbcmr7730866wrs.2.1686692909091;
        Tue, 13 Jun 2023 14:48:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uDPB6horGtPutPOLnKVc3G3wBfPH8xGCX3Hr21sZQd3qdydaW2Wq8l9llHwqWseFYHkyqMg==
X-Received: by 2002:a5d:45d0:0:b0:30f:bb0a:fcbc with SMTP id b16-20020a5d45d0000000b0030fbb0afcbcmr7730843wrs.2.1686692908735;
        Tue, 13 Jun 2023 14:48:28 -0700 (PDT)
Date: Tue, 13 Jun 2023 17:48:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"alvaro.karsz@solid-run.com" <alvaro.karsz@solid-run.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>,
	"longpeng2@huawei.com" <longpeng2@huawei.com>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
Message-ID: <20230613173837-mutt-send-email-mst@kernel.org>
References: <20230608180617-mutt-send-email-mst@kernel.org>
 <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
 <20230613034216-mutt-send-email-mst@kernel.org>
 <20230613035132-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
 <PH0PR12MB5481746BE0C1B7CE4D098A7BDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230613154823-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811F91C70744E7A83BD10ADC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54811F91C70744E7A83BD10ADC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Tue, Jun 13, 2023 at 09:09:05PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, June 13, 2023 3:55 PM
> > 
> > I do not get how.  Let's make sure we are talking about the same thing.
> > This is what I am saying:
> > 
> > Start operating:
> > 
> > - program queue address, size
> > - queue_enable
> > 
> > Now we change our mind about queue size or address. So:
> > 
> > - queue_reset
> 
> Why queue_reset is needed here?
> I don't see spec saying that queue_enable must be done only once for a given Q before DRIVER_OK.

I see you found it.

> > - program another queue address, size
> > 
> > Finally we are decided, let's start operating:
> > 
> > - DRIVER_OK
> > 
> > 
> > I don't see how it's possible with just queue_enable.
> > 
> > 
> > >
> > > It is not explicitly mentioned in the spec that one can setup the queue using
> > queue reset instead of queue enable.
> > > As Jason mentioned it is implementation specific, one device supports it and
> > one doesn't.
> > > Hence, it will break on those devices which doesnt support it.
> > >
> > 
> > Setup? No, and spec explicitly says to setup one has to use queue_enable. But
> > this is not what we discussed with Stefano here.
> > 
> The above sequence you described is not well documented.

It's the standard sequence for queue reset, is it not?

For example:

	Virtqueue reset is divided into two parts. The driver first resets a queue and
	can afterwards optionally re-enable it.


it seems clear that queue has to be enabled before being reset.



> > > Therefore, I would like to add it to the spec.
> > > "queue_reset register MUST be accessed by the driver only after device has
> > reached the DRIVER_OK stage."
> > 
> > I don't think we can add MUST requirements after the proposal is in the
> > released spec. If device has stricter requirements than the spec then it's not
> > compliant.
> >
> Lets resolve above question first about how many times one can use queue_enable before DRIVER_OK for a specific VQ.
> Without this either way driver and device combination is broken when queue_reset is used before DRIVER_OK.

I'm not sure what's broken.


If VIRTIO_F_RING_RESET has been negotiated, after the driver writes 1 to
\field{queue_reset} to reset the queue, the driver MUST NOT consider queue
reset to be complete until it reads back 0 in \field{queue_reset}. The driver
MAY re-enable the queue by writing 1 to \field{queue_enable} after ensuring
that other virtqueue fields have been set up correctly. The driver MAY set
driver-writeable queue configuration values to different values than those that
were used before the queue reset.


So the limitation is that it happens after FEATURES_OK.


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

