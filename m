Return-Path: <virtio-comment-return-4919-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E16DC6FD1C
	for <virtio-comment@archiver.kernel.org>; Mon, 20 Mar 2023 19:48:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C8E7F1CA243
	for <virtio-comment@archiver.kernel.org>; Mon, 20 Mar 2023 19:48:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B1DA99861D5
	for <virtio-comment@archiver.kernel.org>; Mon, 20 Mar 2023 19:48:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A1C01986156; Mon, 20 Mar 2023 19:48:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8FD3C98616A
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Mar 2023 19:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: g-7rZM4MPFqCQWKnh_HJIQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679341721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wwj3T8mZaPGBUAzOxjDo1vf3911xrhnPJua3ujXxQQ=;
        b=3UvXosiVt+S+DPY5F2NxAn3etrao3cVIPYJkumXoQ4I5umFkcGF8rOxO/irwmGArG8
         6ohLvaWkGju7CmjnoKDvtZTy2Is4UBmY/ph8S4wCaU97fZkxY+CtLM6ID7wgRUtLsAXG
         AP8lbkKh2NOX4H8RSmPZXgsvAOECdv4t7bSfCWpTjRDfV3G81wjt5M9eMbgnMSolKdLD
         hHwzquBkLxKmKJM3Za6g8uJZ7ZjXuBr2wCi1lMHG5iV8/slJB4nIvVukZXZc3aCq95dt
         sfOfLFDxsvMQ0b6k2lR7qAoItHE0qw5rKunkeslELPKQsrd7xrEiFZJZML3PzFYYpqbI
         uutg==
X-Gm-Message-State: AO0yUKXAfAVDOCgOb6mGLmide6e/TyHe42X7mGQgTCBr3GV5JjAJgz+N
	hDe82lbO0/4PKncbN1cv2r5rSPcPYeFjMWRwyFKat+n/SkW1yxXuGPHXYyfC9sPS+MRah/YPg7R
	PnxQSr+3AOolOWyySpF+rO+4o/ZWfSdPQBQQIKd5Ckw==
X-Received: by 2002:a5d:44cd:0:b0:2cd:f2c6:5d37 with SMTP id z13-20020a5d44cd000000b002cdf2c65d37mr399718wrr.5.1679341721416;
        Mon, 20 Mar 2023 12:48:41 -0700 (PDT)
X-Google-Smtp-Source: AK7set/+bsY5d60m3LHn6eoMiahQgxEw1M2yCUZ+JF+NlH/Ww60sMdXKlolph1aXKKv8oA3b6RC0IQ==
X-Received: by 2002:a5d:44cd:0:b0:2cd:f2c6:5d37 with SMTP id z13-20020a5d44cd000000b002cdf2c65d37mr399704wrr.5.1679341721183;
        Mon, 20 Mar 2023 12:48:41 -0700 (PDT)
Date: Mon, 20 Mar 2023 15:48:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230320154556-mutt-send-email-mst@kernel.org>
References: <20230218143715.841-1-hengqi@linux.alibaba.com>
 <20230228061309-mutt-send-email-mst@kernel.org>
 <25231225-59c8-91b0-e0dd-3dab8aa8164b@linux.alibaba.com>
 <20230308093311-mutt-send-email-mst@kernel.org>
 <c334a082-4b78-c7ea-e04a-6436f4965516@linux.alibaba.com>
 <20230309142612-mutt-send-email-mst@kernel.org>
 <021eeb40-aab1-07b9-cfe7-9dd61a32e0b3@linux.alibaba.com>
 <20230315074633-mutt-send-email-mst@kernel.org>
 <4b14043c-6059-1d26-060e-7dc653c4f401@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <4b14043c-6059-1d26-060e-7dc653c4f401@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] Re:
 [virtio-dev] Re: [PATCH v9] virtio-net: support inner header hash

On Wed, Mar 15, 2023 at 08:55:45PM +0800, Heng Qi wrote:
> We use the most basic GRE header fields (not NVGRE), not even optional
> fields.

I'd say yes, the most convincing usecase is with legacy GRE.
Given that, do you need the rest of protocols there?
We can start with just legacy GRE (think about including IPv6 or not).
Given how narrow this usecase is, I'd be fine with focusing
just on this, and addressing more protocols down the road
with something programmable like BPF. WDYT?

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

