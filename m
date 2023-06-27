Return-Path: <virtio-comment-return-6549-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1624EB64DC
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 16:02:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2CD522AD4C
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 16:02:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 18FD9986413
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Jun 2023 16:02:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 00A14986191; Tue, 27 Jun 2023 16:02:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DFDFE98635C
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Jun 2023 16:02:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DKntJRLnMleh13IeokbMbA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687881768; x=1690473768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2yxQNRras8Ecb/0Swa6SPot1IinJi/ujLEPf7z/8o98=;
        b=jxlUwBXlUcxQ3k6IgiKnQSbQa7jcUPtVzzda2fPBQMY9gKD/X7/tTMZoz6hu3Qck5B
         Mnww7a5YNsdY4ATrNYA/kDzIcLT38/Fjw2m86aGbl4idexzR6z2Z60n0xs6nQdwzl+Gm
         fvnWmBb/5kUM1dGdk94Jll1MrdRUSPh/nsRsxVle8LNBVXBpVG4n9dq7C0rTod9NagWm
         OI5ekcW6juYCWZx/sRG5cetQtt8qptiwOoU7yLF2+pRF4oXUxA4U63/gxJJTcTRtHakq
         t/j23l5Zl3l6LSNvilJ4c7u8Ec3TNfTdqClt4SjpZxosuCnB2S6z2wvAHykukRiYddX5
         4UUw==
X-Gm-Message-State: AC+VfDxCpSNFgVTNNW3ceqFWc5cG6EPXX4WuOb4YtIRWytyZj2d/KXn0
	GOSVC9LcKugD0IeV2YUGHdOwDS3k7f/hmyCqExvpH/1R3RhpS3NmW8KXXycqtMnJYw1lImN2Dos
	Y7ExPTE/HF45MOyAxIpYIXkjBFcRMLo1jWg==
X-Received: by 2002:a05:6808:1587:b0:3a1:c979:e6d2 with SMTP id t7-20020a056808158700b003a1c979e6d2mr11152049oiw.35.1687881768769;
        Tue, 27 Jun 2023 09:02:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5USTFayXXg/0zanFqmbhaBXw8pXaWTtFnILJ19eDF9ACzZHN3oxG8MngKCYU2iPrDO52ts2w==
X-Received: by 2002:a05:6808:1587:b0:3a1:c979:e6d2 with SMTP id t7-20020a056808158700b003a1c979e6d2mr11152030oiw.35.1687881768519;
        Tue, 27 Jun 2023 09:02:48 -0700 (PDT)
Date: Tue, 27 Jun 2023 12:02:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtio-dev@lists.oasis-open.org, parav@nvidia.com,
	virtio-comment@lists.oasis-open.org,
	Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>
Message-ID: <20230627115247-mutt-send-email-mst@kernel.org>
References: <20230626062210.49020-1-xuanzhuo@linux.alibaba.com>
 <1687854185.3344731-3-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1687854185.3344731-3-xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [RFC PATCH] admin-queue: bind the group member
 to the device

On Tue, Jun 27, 2023 at 04:23:05PM +0800, Xuan Zhuo wrote:
> So, this is how I understand the process of creating vf:
> 
> 1. Create a PCI VF, at this time there may be no backend virtio device, or there
>     is only a default backend. It does not fully meet our expectations.
> 2. Create device or migrate device
> 3. Bind the backend virtio device to the vf

I can see this making sense as a feature bit that says VFs are not
initialized by default and must first be setup through an admin command.
This will likely need to be a feature bit because it's changing
behaviour outside of admin commands.

Then, we can have:

	ADMIN_SETUP VF#
	ADMIN_CLEANUP VF#

I like this because this generalizes CREATE/DESTROY that SIOV guys proposed.


Why do we need an id as a level of indirection though? What is wrong
with just using VF# directly?



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

