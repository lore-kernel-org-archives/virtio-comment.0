Return-Path: <virtio-comment-return-8855-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0E6C41535
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 08:20:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6D8FC2B038
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 08:20:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 32A2D98660D
	for <virtio-comment@archiver.kernel.org>; Fri, 22 Dec 2023 08:20:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1642E98427C; Fri, 22 Dec 2023 08:20:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0518F9865C1
	for <virtio-comment@lists.oasis-open.org>; Fri, 22 Dec 2023 08:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: HE2p_a4OMS2YsjPuKqpYCA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703233244; x=1703838044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJHMOmSy16EKtktk8Rv+IhLJPzcOWqzqkTVYyK+yf88=;
        b=VdkYv9/zdLW6MA4STSP0XZqBDLlsNsOBhUesIcUI4kpUPRyqI2+7z5RfxEiXGrhOpQ
         0d13+pbsZQFGJcp+4TTkLc4/6JtSmDwTNpk5fr0cjo3rK2IYvpVdmIAgbf8OvF3277jx
         NT7b8gONK4PN8zun9c1DTP+VY+a4MQqLPPsjr74Sz2cjzsp7luYTpgXwPquAEg/S7o2s
         ks8zK+yFITSfkSR4+JLViNxwLp+ISEAjKNFL5F0Y6rBHRG/48vbLSUvMxB1EFuFAqz+h
         UDkSNZ2edjyDmlX17hitvZzkqIGQszoOgnfyBqnz273FLmrfXb4QicgtAnEItRsHTSqY
         iT9w==
X-Gm-Message-State: AOJu0Ywro9f3iHsjA8pIoG5tW13SjtZGueAdgC+D1z8htYiOHPbC08Bv
	+QRtOeYRYXW1bhPt+71F3YbaqGTfkocJtbpgl10k/+Go4+FvcGi8VjXYl0HrS7yg4Ko+HQ1uUe5
	mzEaqdftstRx3cEt3sNmgxPbT10UQvzlFCEHTUXKx0A==
X-Received: by 2002:adf:fe44:0:b0:336:837c:d7bc with SMTP id m4-20020adffe44000000b00336837cd7bcmr542156wrs.8.1703233244467;
        Fri, 22 Dec 2023 00:20:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1QtX3yrHp3KPRkIiH9fNhW2ahDhzRjES+Co1yVfjxqs0OZit24b76+3u6AXgKvEorAmvHSg==
X-Received: by 2002:adf:fe44:0:b0:336:837c:d7bc with SMTP id m4-20020adffe44000000b00336837cd7bcmr542150wrs.8.1703233244148;
        Fri, 22 Dec 2023 00:20:44 -0800 (PST)
Date: Fri, 22 Dec 2023 03:20:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Jason Wang <jasowang@redhat.com>, virtio-comment@lists.oasis-open.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	Parav Pandit <parav@nvidia.com>
Message-ID: <20231222031709-mutt-send-email-mst@kernel.org>
References: <fb123ee4ac9e21e6f1d7142149439db74585be8e.1703083096.git.hengqi@linux.alibaba.com>
 <CACGkMEt_kvBbnpNt_cfB8KdKWM9WP8T_wnQBm13yKpe5JYVnAg@mail.gmail.com>
 <8afe4002-07d0-4571-8410-26edebb042b4@linux.alibaba.com>
 <CACGkMEsBZ8Egc4D+TUKXngqeyDsMEpDTOQiZjyGbeXYBpHa1ag@mail.gmail.com>
 <a037dd2f-be0c-4b02-b706-672e9a56497f@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <a037dd2f-be0c-4b02-b706-672e9a56497f@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH RESEND] virtio-net: support setting
 coalescing params for multiple vqs

On Fri, Dec 22, 2023 at 02:45:21PM +0800, Heng Qi wrote:
> > > For the current upstream code, the overhead is 256 kicks + 256*8 DMA times.
> > > The overhead of batch cmds is 1 kick + 256*8 DMA times.
> > This can furtherly optimized by using IN_ORDER. The DMA can be batched as well.
> 
> DMA batch reduces the number of DMA requests, but not the actual number of
> DMAs.
> For out DPU, how much to batch and when to end the batch also need to be
> evaluated in detail.

And what is the result of this evaluation? Again all this is slow path
stuff. Speed only matters if the operation takes many milliseconds.

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

