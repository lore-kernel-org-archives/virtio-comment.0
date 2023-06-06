Return-Path: <virtio-comment-return-6189-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB08BC7EE2F
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:08:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3FD5F157EE7
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:08:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 27EC398658A
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 23:08:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 18187986583; Tue,  6 Jun 2023 23:08:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0559F986585
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 23:08:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: gyhgyVabM-ePoTheb7ldRg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686092888; x=1688684888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmInpwKvYS6f0Kq6bT1vGscpl4MSF1GmGLF5OYOGYKA=;
        b=SE1Qb3tADfZPDe+Ka8H3x3/qM1M/XV3Iw25caEBjQwEX99jwZYxOn72JX21byeGiR7
         cn/BuKMEtjgc45cNNlBBpwPkqcBmkV0TeXmcevSwftJY+t991azhvAHExzwtqco3xi+2
         rhjesFTY7T78zoh/JlAetsz367zIW2owrZNVCxMW+B/+W3qDXiEyYgpR8kbPnlAYfuqQ
         fR8O4QmwFBcQv7bmlM5P7QbCuTV1kihyKKrL/x4ThBqZ7Ev4Vd5fxY7MY/VunsgXgJCi
         f0HSYJsf+iVzcF7YsGsj4NZF2OfRw97YYPleBfI3s1NVRVYBOVlrCctzHc2mKki9MRQt
         eM2g==
X-Gm-Message-State: AC+VfDwtl6D1t+j7AqxHdcdRHbqbTTiV19U7gl5FuCJwxYp0HYLQ1jpD
	nCredr/V7svZ8hG+plj3mlWIP0P4zONRS60kZkAegxVLWKl9+dogPXGf+QvpfcgANiF6mxUNOig
	wMEhZNNa6jM5Pj25ZtMskiPpWMl5cCzwnew==
X-Received: by 2002:a5d:458c:0:b0:309:5029:95a9 with SMTP id p12-20020a5d458c000000b00309502995a9mr2954861wrq.32.1686092887989;
        Tue, 06 Jun 2023 16:08:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ64mIg5NHjVoAkI9SQ3D26Xho5GsgKCWJVWPP8Y7Z2u+KkFVtsgGdsGdUvwVx1Jxl+r6a7Fmg==
X-Received: by 2002:a5d:458c:0:b0:309:5029:95a9 with SMTP id p12-20020a5d458c000000b00309502995a9mr2954853wrq.32.1686092887662;
        Tue, 06 Jun 2023 16:08:07 -0700 (PDT)
Date: Tue, 6 Jun 2023 19:08:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20230606190617-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-7-parav@nvidia.com>
 <20230606183720-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548136CBDE586D6DBD54CB9DDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548136CBDE586D6DBD54CB9DDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 6/7] net-features: Add
 packet timestamp requirements

On Tue, Jun 06, 2023 at 10:51:25PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, June 6, 2023 6:40 PM
> 
> > > +## 3.5 Packet timestamp
> > > +1. Device should provide transmit timestamp and receive timestamp of the
> > packets
> > > +   at per packet level when the device is enabled.
> > > +2. Device should provide the current free running clock in the least latency
> > > +   possible using an MMIO register read of 64-bit to have the least jitter.
> > 
> > wow these reads are expensive. what is the actual requirement?
> > 
> I don't understand the question.

placing something in a register is a solution. what is the
requirement?

> > > +3. Device should provide the current frequency and the frequency unit for
> > the
> > > +   software to synchronize the reference point of software and the device
> > using
> > > +   a control vq command.
> > 
> > let's leave mechanism out of it. I think you are trying to say this is async to data
> > vqs? and cvq is fine.
> >
> There are two clocks running, one of cpu where driver is running, other one is in the device.
> And timestamps are done by the device based on its clock.
> 
> So driver can convert the device timestamp to driver cpu timestamp.
> This is like one time query to know conversion mechanics.
> 
> > > +### 3.5.2 Receive timestamp
> > > +1. Receive completion must contain a packet reception timestamp when the
> > device
> > > +   is enabled for it.
> > > +2. The device should record the received packet timestamp at the closet
> > ingress
> > > +   point of reception from the network.
> > > +3. The device should provide a receive packet timestamp in a single DMA
> > > +   transaction along with the rest of the receive completion fields.
> > 
> > how large do these need to be? ok for timer to overflow?
> >
> Will add it. Usually 8B.
> But overflow after 30+ years or so is common norm.
> 
>  
> > 
> > why do you mention migration in counters but not in timers?
> > 
> > is it ok for time to go back?
> 
> Should add it for timer too.


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

