Return-Path: <virtio-comment-return-5311-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B65C6FD1D
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:43:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AF1DC2B125
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:43:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9F37B9865DE
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Apr 2023 11:43:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 91E41983F7B; Fri,  7 Apr 2023 11:43:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8019E9865D8
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Apr 2023 11:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wz_vd_KuOYe-PHXAHvUCHw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680867816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9TOMPzgVKzi59ybMFBW/mDKB/R/hn2y5rH0d0oZbqI=;
        b=NS1efGmPoZx036ELKqncMoh4cnpHaWgpc22MzguFyEQI765MHId5bL3YGTS0xOgWND
         iUrqvIaoC0SkbaCQoy0QEQsqYprrvrdHVOojQofctZOM/m4nGdBD+MQYLqCWoI0wnAEX
         vEt+NvCwfYti25SFWcmI6IVU8fdo70yPELx3iuEAPr0P5QMZ9gpFW2h2asGzlL5EjXCS
         CCUbt/E0EZeIENOkLKjM6CUT+oquxXmczPdrfPdFd1QSYdBvTqLVdnrAtGBrCMkb+q7Q
         sRthZbHCfaY8PU4dNTfacsUBx05ZTnUBptZ9MEM1Y6pOvYsH/0yYCk5ldggu5eKCczqB
         kwiQ==
X-Gm-Message-State: AAQBX9dCtRnaMg8rV+TiJLz5X0UXt7eRyCLfTQl+USfKQg99vdi+H1fs
	D/qqQjkqcceFpaYwGeHDw2+98/+h8quZfUpghrOROohQKkhXFo5P3pB3+2soi9HTlfbZgzRPdIe
	hmie+qpTYInEh8Jk3ElRT71d2lTQ1+zkQ0Q==
X-Received: by 2002:adf:ef50:0:b0:2ef:ae4e:354b with SMTP id c16-20020adfef50000000b002efae4e354bmr1376660wrp.53.1680867816397;
        Fri, 07 Apr 2023 04:43:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350ax9WiPQ+hfCPub4pyB5CuM9xceeOMWnqNMRFhcPCxErl8C9aprgxmx/6KrNAU3uJhnXBrT2g==
X-Received: by 2002:adf:ef50:0:b0:2ef:ae4e:354b with SMTP id c16-20020adfef50000000b002efae4e354bmr1376646wrp.53.1680867816082;
        Fri, 07 Apr 2023 04:43:36 -0700 (PDT)
Date: Fri, 7 Apr 2023 07:43:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Halil Pasic <pasic@linux.ibm.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230407073308-mutt-send-email-mst@kernel.org>
References: <20230405010657.612529-1-parav@nvidia.com>
 <20230405010657.612529-4-parav@nvidia.com>
 <20230405012723-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C1EC27F79A87218C3767DC909@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230405172731.561890b1.pasic@linux.ibm.com>
 <PH0PR12MB54819AFEDBFEC41CACA0CF92DC909@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54819AFEDBFEC41CACA0CF92DC909@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [virtio-dev] RE: [PATCH v12 03/10] content:
 Rename confusing queue_notify_data and vqn names

On Wed, Apr 05, 2023 at 03:58:55PM +0000, Parav Pandit wrote:
> > From: Halil Pasic <pasic@linux.ibm.com>
> > Sent: Wednesday, April 5, 2023 11:28 AM
> > 
> > On Wed, 5 Apr 2023 13:21:40 +0000
> > Parav Pandit <parav@nvidia.com> wrote:
> > 
> > > > VIRTIO_F_NOTIF_CONFIG_DATA is such a narrow usecase, I don't like
> > > > burning "vq identifier" on this. How about we just say something along the
> > lines of:
> > > >
> > > Ok.
> > > >
> > > > When VIRTIO_F_NOTIFICATION_DATA has not been negotiated, this
> > > > notification involves sending either the virtqueue index or the
> > > > virtqueue config data to the device (method depending on the transport).
> > > >
> > > > And then "the data sent is a device supplied virtqueue config data".
> > > >
> > > Sounds fine. I will reword it.
> > 
> > FYI in an other thread I proposed calling this a "cookie". Sorry for being late to
> > the party. Yet again.
> 
> If we spend (waste) more time, we will find many examples where "identifier" and "cookie" both are used in things associated with computer science.
> 
> That too when same set of people has accepted text " internal virtqueue identifier" for same feature of CONFIG_DATA even though somehow it was not "id"!

because that's just an example:
        In a trivial case the device can set \field{queue_notify_data}=vqn. Some devices
        may benefit from providing another value, for example an internal virtqueue
        identifier, or an internal offset related to the virtqueue number.

so the cookie can either be an identifier or something else.


> And when this spec refers to an RFC of UUID, session id (not "session cookie", even though session id is opaque and not meaningful to the recipient as per Wikipedia usage desc that you listed).
> 
> For sure "cookie" is better than "config_data" and I don't have objection to "cookie".
> 
> But I disagree to the claim that "identifier" is less good than "cookie".
> 
> It is pointless debate of "identifier" vs "cookie".
> 
> The union format is very useful to describe this crisply, I will use it.

I guess I'm fine with "cookie" in that in CS it is by now widely
understood to mean "some opaque data".
identifier comes from "identical", so implies a 1:1 mapping IMO.


The logic behind using a cookie is that it's a bit similar
to host cookie from ccw.
However, with ccw host cookie is used unconditionally, as
opposed to depending on the flag.



> Do you prefer to rename F_CONFIG_DATA To F_CONFIG_COOKIE?

It should all be consistent, but I worry about ccw which uses cookies
unconditionally. I am fine with leaving it as F_CONFIG_DATA for now
unless we see a good way to avoid confusion for ccw.

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

