Return-Path: <virtio-comment-return-8843-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0DC2C35274
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 06:56:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DEBF12B06F
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 06:56:10 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BBD5A9865B8
	for <virtio-comment@archiver.kernel.org>; Thu, 21 Dec 2023 06:56:10 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9B7EE983DDF; Thu, 21 Dec 2023 06:56:10 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 89FFE9865B6
	for <virtio-comment@lists.oasis-open.org>; Thu, 21 Dec 2023 06:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: kWMjOkHFOrS2LC_x2IGWuA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703141764; x=1703746564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwNtJZS//oJEgeRkErJ/hRa7C8Q9d5q3T/uUmfnszpk=;
        b=nvE21yTnn4Mwk0Ap2EnnzX4hW3ZQ8L+mhgex9Log6mC1gNSF0n7c8Crj18KSgXvgWl
         Fy69jNreeJUlA0dMPgLT0NrLYnep1cBrIb1+V7s78p5HBW70z8vBmHry6v+reAXEc2aI
         9+ksaZZJiDFNEHS+C8RnnnbBkkzfWBDcxJ1CF8rqFihB1Fh+eBFQ+yW+qdN3Gfhw6b6I
         ZtdGzrfXVWrXxgDbaobt+xi1CuoyA3W8q/oev5eKsl62aEfaKlwGhIJeUX3z5Cv2GFkk
         XBppXx5DRMeUbrvrhp6zOPPdEFwFYzqsT2Vnt2DtnSPHPlKDq5ikYtaVmVm14sbNGBXo
         6Fuw==
X-Gm-Message-State: AOJu0Yy2dvwLDjmKG91kEVhWFCYVQZdaQnLYK/csXLO4UsIVf1f+OMp9
	u7Pf3WRJz+2DFTmLsB5tEjaMvoC1qKLO/MSTql3yvFdAUOMOEk8bWcMqxOEzCVD6oOP8Ug7JV7C
	RU1ahyDk9B7YPEPYxwbHUWSW469NAuPOWtQ==
X-Received: by 2002:a5d:6546:0:b0:336:6b15:de03 with SMTP id z6-20020a5d6546000000b003366b15de03mr461127wrv.120.1703141764356;
        Wed, 20 Dec 2023 22:56:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoO/IFWfn7dKnndywzMSSWrTxTY5ZRb5Dogwd4Sk6LuuDYOOQc39yCDREHNVm4ocwfubwZrQ==
X-Received: by 2002:a5d:6546:0:b0:336:6b15:de03 with SMTP id z6-20020a5d6546000000b003366b15de03mr461119wrv.120.1703141764015;
        Wed, 20 Dec 2023 22:56:04 -0800 (PST)
Date: Thu, 21 Dec 2023 01:56:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20231221015507-mutt-send-email-mst@kernel.org>
References: <fb123ee4ac9e21e6f1d7142149439db74585be8e.1703083096.git.hengqi@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <fb123ee4ac9e21e6f1d7142149439db74585be8e.1703083096.git.hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH RESEND] virtio-net: support setting coalescing params for
 multiple vqs

On Wed, Dec 20, 2023 at 10:40:34PM +0800, Heng Qi wrote:
> Currently, when each time the driver attempts to update the coalescing parameters
> for a vq, it needs to kick the device and wait for the ctrlq response to return.

But there's no fundamental reason for it to do so.
It can just as well submit multiple commands and then wait.

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

