Return-Path: <virtio-comment-return-6006-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9DFBC77B75
	for <virtio-comment@archiver.kernel.org>; Tue, 23 May 2023 07:15:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E143E1922EA
	for <virtio-comment@archiver.kernel.org>; Tue, 23 May 2023 07:15:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C6C709863E7
	for <virtio-comment@archiver.kernel.org>; Tue, 23 May 2023 07:15:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AE559983F7B; Tue, 23 May 2023 07:15:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9A9199863B3
	for <virtio-comment@lists.oasis-open.org>; Tue, 23 May 2023 07:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: GNKp1T_-NNyOLlu_GMtbIQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684826141; x=1687418141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeX8jAKaRUfUBuQYpNjPyYCMjx8sop/NorsV6XUQcf4=;
        b=e8+EBwzmemQwRCuLNP+KsM7R0qW7KVSGfyu/r7dDY/HXjTVkeGh8F4csdDHTvb6fwu
         D/ecQPtSb/ZJjuO9wGF43e5xfHC9WD9abMpRQLfhj2d5ljB7+7KUHjzQXszOcSQgrjgH
         SIEuiInBy6tL/aRlslaPLgTJPy850xagIc18/NlPMAlx+b+HjZQJnqm73PG171Petlnl
         NLpYWWylk0uQiq4pubMGy8o8bgIw4AhDOrwUskKtpA8WwGsn5v94wPCS5aj1o5X9GYBl
         tMOs2r1efyFdKkEajaek70GeTIYgVo6wnADdbWn9rDacR7jG50CZ+KD/lXjYd6YAg1XY
         cZIA==
X-Gm-Message-State: AC+VfDyNCXf9nS2DUwrDpdUkYZC2P74+SvdhMJDFd9PXm6srxOzKfqwl
	kFhHdMfFLsKa2R0BR6LD3u7Ezu617dhuXHUO35lyFHq0U/aW5qx5+FUyFTgllqadTG2Ohi6Y8EC
	swArkOtGIDpMf3C9wrDU0pDivBxtEAik3Pg==
X-Received: by 2002:a05:600c:3783:b0:3f6:d40:c89 with SMTP id o3-20020a05600c378300b003f60d400c89mr413399wmr.12.1684826141232;
        Tue, 23 May 2023 00:15:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6flXBjmZ3Hx0CZumN7qpBDbvyeD852Ydt7ZAtPEvdzNgroVrshjyBZpL1yMJyR0D8/VRi0ng==
X-Received: by 2002:a05:600c:3783:b0:3f6:d40:c89 with SMTP id o3-20020a05600c378300b003f60d400c89mr413380wmr.12.1684826140925;
        Tue, 23 May 2023 00:15:40 -0700 (PDT)
Date: Tue, 23 May 2023 03:15:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org,
	Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230523024057-mutt-send-email-mst@kernel.org>
References: <20230522121200.40939-1-hengqi@linux.alibaba.com>
 <20230522150743-mutt-send-email-mst@kernel.org>
 <20230523024118.GA23504@h68b04307.sqa.eu95>
MIME-Version: 1.0
In-Reply-To: <20230523024118.GA23504@h68b04307.sqa.eu95>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [Proposal] Relationship between XDP and rx-csum in virtio-net

On Tue, May 23, 2023 at 10:41:18AM +0800, Heng Qi wrote:
> On Mon, May 22, 2023 at 03:10:05PM -0400, Michael S. Tsirkin wrote:
> > On Mon, May 22, 2023 at 08:12:00PM +0800, Heng Qi wrote:
> > > 1) Add a feature bit to the virtio specification to tell the sender that a fully
> > > csumed packet must be sent.
> > 
> > Who is the sender in this picture? The driver?
> 
> The device or the driver.
> 
> When the device is hw, the sender is more likely to be a device.
> When the device is sw, the sender can be a device or a driver.
>
> But in general, this feature is inclined to constrain the behavior of the device and
> the driver from the receiving side.

Based on above I am guessing you are talking about driver getting
packets from device, I wish you used terms from virtio spec.

> For example: 
> VIRTIO_NET_F_UNNECESSARY_CSUM : The driver tells the device that you must send me a fully csumed packet.
> 
> Then the specific implementation can be
> 
> (1) the sender sends a fully csumed packet;
> (2) the receiver receives a CHECKSUM_PARTIAL packet, and the device helps calculate the fully csum
>     (because the two parties in the communication are located on the same host, the packet is trusted.).
> 
> In summary, if VIRTIO_NET_F_UNNECESSARY_CSUM is negotiated, the driver will no longer receive any packets marked CHECKSUM_PARTIAL.
> 
> Thanks.

This is what clearing VIRTIO_NET_F_GUEST_CSUM does.

I feel you are trying to say that clearing VIRTIO_NET_F_GUEST_CSUM
disables all offloads but you want to keep some of them?

Again please use virtio terminology not Linux. to help you out,
in current linux, VIRTIO_NET_HDR_F_NEEDS_CSUM and VIRTIO_NET_HDR_F_DATA_VALID
will set CHECKSUM_PARTIAL and CHECKSUM_UNNECESSARY respectively.


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

