Return-Path: <virtio-comment-return-6185-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3BBC7EE37
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:56:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AEA0968462
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:56:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A8CED98658B
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 22:56:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9846D986585; Tue,  6 Jun 2023 22:56:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8350B986583
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 22:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: _d7CbbJ5PGygbwQ4_YQFFg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686092201; x=1688684201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ciPzWVSuBQx6xOCfuO/urkRD9wJ9nd/6tjpTxJaXh6w=;
        b=O0NX1UQCRcPop1EsedMQPsiZbzkUDUcfxu0GkqP/8wea4VCtblpHP6CUcXQR9T2m0r
         zyV7XVk0bnnqIRilpMp4FUHdnreah22/7vNrjjtYhi9OPedzyweOm60W1WkQDfufNt85
         ZuHV1oaCVNRknv5k+SrMIA9j+/55CPl2+zM1e97MSnHMrDEbHOc/0GHUbmphgLnkUss1
         TsrxfuxmyxLNLgy0ujqqvw5r//ZBFvvN1/0f/XBGm2/fkkC+ru1dhCiTVDcWiFk0YHz4
         5i7+h728VIEncieYUEnTz5btdPBIkvZzMaa/2NsISABICl6BbNvauLjV6/s1ilAyRvTL
         W55w==
X-Gm-Message-State: AC+VfDyXzeFg+/ESTNGJ0Gymp9Yx+Ycodlr9ub4ID9XMQgrMNCf60dJt
	pzVSGRmdObM1tLm1SZXHT3/eXrs58RFx9Xote3zOw2s974C0956P6M7o1vP6bWxKIZ5NdQAvzIl
	vpNp/UK6iZhTo2WxM2LYVnTsBhHAjSMykog==
X-Received: by 2002:a5d:4e8d:0:b0:30e:5428:2a00 with SMTP id e13-20020a5d4e8d000000b0030e54282a00mr1447640wru.32.1686092201212;
        Tue, 06 Jun 2023 15:56:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ70imunv4GtQyrCkiZ4IMauDDvXtL+IxwzXyNty4FW2+P+8x1AxlBKXNA70IzrQ4h3alNASIA==
X-Received: by 2002:a5d:4e8d:0:b0:30e:5428:2a00 with SMTP id e13-20020a5d4e8d000000b0030e54282a00mr1447622wru.32.1686092200911;
        Tue, 06 Jun 2023 15:56:40 -0700 (PDT)
Date: Tue, 6 Jun 2023 18:56:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20230606185016-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-2-parav@nvidia.com>
 <20230606180853-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4357772DE13272EA3BBDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C4357772DE13272EA3BBDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4

On Tue, Jun 06, 2023 at 10:28:46PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, June 6, 2023 6:15 PM
> 
> > > +# 3. Requirements
> > > +## 3.1 Device counters
> > > +1. The driver should be able to query the device and/or per vq counters for
> > > +   debugging purpose using a control vq command.
> > > +2. The driver should be able to query which counters are supported using a
> > > +   control vq command.
> > 
> > why does it matter for requirements whether it's a control vq?
> >
> It matters for requirements, so we produce design that addresses it.
> We don't want to add config space every growing bit map which may be different between different devices.

then say that you want to conserve config space, that is
the requirement. not cvq specifically.

> > 
> > what matters is whether they have to be synchronized with a given queue - I get
> > it they don't have to.
> They don't have to be.

Then say that.

> I don't see how it can be every synchronized.

you could program them through the vq itself.


> > 
> > > +3. If this device is migrated between two hosts, the driver should be able
> > > +   get the counter values in the destination host from where it was left
> > > +   off in the source host.
> > 
> > we don't cover migration currently don't see how this is a spec rquirement.
> > unless maybe it's justification for 4?
> True, but design need to keep this in mind if it has some touch points like of #4 so when migration arrives, it has the building block in place.

so again, let's make sure we capture the actual spec requirement.


> > so maybe it means there needs to be a way to set counters?
> > so there's no need to mention migration - just that it should be possible to
> > move counters between devices.
> > 
> > > +4. If a virtio device is group member device, a group owner should be able
> > > +   to query all the counter attributes using the admin queue command which
> > > +   a virtio device will expose via a control vq to the driver.
> > 
> > 
> > this seems weirdly specific.
> > what is the actual requirement?
> >
> I don't follow the question.
> When a device migrates from src to dst, group owner needs to know if both side underlying member device has same counter attributes or not.

whether it's through a command or not is not a requirement
and I still do not know what the requirement is.
what does "same counter attributes" mean? you never mentioned
attributes before.


> > 
> > > +
> > > +### 3.1.1 Per receive queue counters
> > > +1. le64 rx_oversize_pkt_errors: Packet dropped due to receive packet being
> > > +    oversize than the buffer size
> > 
> > with mergeable buffers how does this differ from 2?
> > 
> > > +2. le64 rx_no_buffer_pkt_errors: Packet dropped due to unavailability of the
> > > +    buffer in the receive queue
> > > +3. le64 rx_gro_pkts: Packets treated as guest GSO sequence by the
> > > +device
> > 
> > what does this mean exactly? packets before or after they are combined?
> >
> Before.
>  
> > pls stick to device/driver terminology not guest/host
> > 
> Yes, will change the GUEST surfaced from the current F_GUEST terminology of the net device.

So?  this predates 1.x spec we never bothered changing them. 

> > > +4. le64 rx_pkts: Total packets received by the device
> > 
> > including dropped ones or not?
> >
> Not including. Will add this clarification further in v1.
>  
> > > +
> > > +### 3.1.2 Per transmit queue counters 1. le64 tx_bad_desc_errors:
> > > +Descriptors dropped by the device due to errors in
> > > +   descriptors
> > 
> > since when do we drop packets on error in descriptor?
> > we just as likely stall ...
> > 
> It is left to the device to implement on what to do on bad desc.

then how can you count drops? why does this even matter?
and why on tx specifically?
I feel addressing descriptor errors is a completely separate project.


> > > +2. le64 tx_gso_pkts: Packets send as host GSO sequence
> > 
> > same questions as gro
> > 
> > > +3. le64 tx_pkts: Total packets send by the device
> > 
> > sent
> >
> Ack.
> > >


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

