Return-Path: <virtio-comment-return-6322-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D60C77B7A
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 09:02:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B39BC157EE7
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 09:02:19 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A74F2986580
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 09:02:19 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9E0219842EA; Tue, 13 Jun 2023 09:02:19 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 89FFC986569
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Jun 2023 09:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: jQHg_hY0MSKp5KkiMEFdBw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686646924; x=1689238924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXZcdvswDWEbWdRD6Dxm76mmdbRLTnNSDCCm4TfKYJA=;
        b=UqfC4odgzN3AVvb5P2uHKIobMycFCavyM6N0JVq+itDjne5CSWiOQ1ptzxHwWPF3ov
         CNS1pu8Q+SAicmwh12aRRvo4Vfvow4xkQznNiABGvkjMU7UTr+gYw2+1qVp2HiGXpc5h
         1OjVfmGbR/XG25xDf7uwGyqyBhTzZGmRnIQh9SlZ9Iym8+RFXaY56wu7rzdU4jy19crV
         S2Sw9Zm6PjTxEK5ADzJO5u9qeQKqvgDGPZXVKmzfh4UJngZuBGVqXOzKTZeh8K+U9XUP
         LU4PUZ6dyXcLQBkXi6OeMTIQd19bdkklWY1zCaK9II7pVUvvtRcsmF/rOryKFDCJ6yMA
         NiWQ==
X-Gm-Message-State: AC+VfDwg+hkVOPLWACPNyIhWuaXIR/XnmivNtksFTNKLdpyqKXfAm8E8
	Xv9qnfkt5djpmr5smRKGktKEgeNRTitkqfCzzg5yiXARM7bNjfjs2tEvHxXoGwAUagJgoUPN1H+
	ldiqxbYPtVk0Ga9fcnFiaxBgIbcSfOSgfAA==
X-Received: by 2002:a17:907:7e9a:b0:94f:3521:394 with SMTP id qb26-20020a1709077e9a00b0094f35210394mr11924642ejc.51.1686646924746;
        Tue, 13 Jun 2023 02:02:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4AR+Le+qQmjkG9M4cchN753y0H8qIAEEIFtI0ZIKfpflbXhSxVn4pC6sO/F/MuXz0GYznAew==
X-Received: by 2002:a17:907:7e9a:b0:94f:3521:394 with SMTP id qb26-20020a1709077e9a00b0094f35210394mr11924618ejc.51.1686646924470;
        Tue, 13 Jun 2023 02:02:04 -0700 (PDT)
Date: Tue, 13 Jun 2023 05:02:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>
Message-ID: <20230613045854-mutt-send-email-mst@kernel.org>
References: <1686550355.2503424-1-xuanzhuo@linux.alibaba.com>
 <20230612022526-mutt-send-email-mst@kernel.org>
 <1686569235.2395291-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1686569235.2395291-1-xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: About custom device counter

On Mon, Jun 12, 2023 at 07:27:15PM +0800, Xuan Zhuo wrote:
> On Mon, 12 Jun 2023 02:25:42 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Mon, Jun 12, 2023 at 02:12:35PM +0800, Xuan Zhuo wrote:
> > > We hope to support device custom counter. That is, virtio spec provides a
> > > channel for driver and device, and both key and value are provided by device.
> > >
> > > We discussed this issue earlier, and after some internal practice, I think it is
> > > still necessary to discuss this again.
> > >
> > > It is very important, each cloud vendor will always have some special counters,
> > > these counters may not exist in another vendor. At the same time, if we have
> > > to discuss it in the spec every time we add a counter, or add a feature, I
> > > think it is very inconvenient. Manufacturers may add some new counters at any
> > > time based on some new requirements. Some counters may also be removed at any
> > > time.
> > >
> > > Of course I know that doing this might hurt migration. But what I want to say is,
> > > why does it affect live migration? These counters we plan to give to users
> > > through ethtool -S, and some changes have taken place in the ethtool counters
> > > output by users. Does this have any practical impact? Or do we directly use
> > > some other output in a way, we can clearly tell the user that these counters
> > > may change during the migration process. For example, the driver is migrated
> > > to some new devices. These devices support some new counters. I think users
> > > should be able to see these new counters. These new counters may be the
> > > purpose of the migration.
> > >
> > > We don't need to support live migration at this point.
> > >
> > > Thanks.
> >
> >
> > Why not just document the thing?
> 
> Device Counter or Device Stat, we discussed this issue earlier,
> So I want to slove the problem migration firstly.
> 
> 
> Thanks.

Sorry have trouble parsing this.

Can we get examples of counters from various vendors, so that
it's clear what kind of thing this, and it becomes convincing
that abstracting this in virtio spec is pointless?

Also, am I right assuming that in virtualized settings this is mostly
relevant for hosts? E.g. guests see a vendor neutral virtio but
host wants to figure out source of issues?




> 
> >
> > --
> > MST
> >
> >
> > This publicly archived list offers a means to provide input to the
> > OASIS Virtual I/O Device (VIRTIO) TC.
> >
> > In order to verify user consent to the Feedback License terms and
> > to minimize spam in the list archive, subscription is required
> > before posting.
> >
> > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > List help: virtio-comment-help@lists.oasis-open.org
> > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> > List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> > Committee: https://www.oasis-open.org/committees/virtio/
> > Join OASIS: https://www.oasis-open.org/join/
> >


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

