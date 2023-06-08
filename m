Return-Path: <virtio-comment-return-6242-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771FAC7EE25
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:41:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C867D4434C
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:41:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF944986681
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 14:41:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B7F8C98666B; Thu,  8 Jun 2023 14:41:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A43FE98666F
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 14:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: qFHaaNnoN2uEZyzkzCwS-g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686235303; x=1688827303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGlWwF84oWGj/yPj2FFeP4GEjFBsHte/ABZwiYf8J9M=;
        b=iv2B9Gcm5EmD1xlXXgSyfyhxDoQrVqGj+loxtCl3qMH8g2N63CIbfbp5uD/fAEjlIc
         27ez+RP16+vLMhKTz0e6m+JL1mODt85Zm+RrrQWBwEqsWTUr1OtmhUnyJf/6uil2Qsv1
         4COug3Vr527k0rYWfzt3+bn9S7OEC57er920jvte4oS1o7yEwuDCd1b/bPevPthWPbhM
         Y5du5utMqCs37072oXFhA7SizBUTMrFL0Z6sXwkmrf6H6mdqUcBUMQfgHRvBiQYPJG1y
         ANOgYShBxj4vq9DYYxxOG1dq9lMYcggs98EYy3upXowGGkEQnSFDIya9drKBtdDtaJeg
         TWGQ==
X-Gm-Message-State: AC+VfDy7rS/fydb6bWocuk0+ldscww7ezJIUIdnGoNahn4nk9kP08v+3
	triMkYIaZLtWfKAYXjgUp54pb3PCbaMwYL93EFfFKcfxK0mBwT8VHayLuXqb4gQwaYQ6kUMYfx5
	WnHB/EVPDK/P55JTZCcwh3dqt7VEzbC7/iQ==
X-Received: by 2002:adf:f9c7:0:b0:30a:8e58:7955 with SMTP id w7-20020adff9c7000000b0030a8e587955mr2024104wrr.13.1686235303344;
        Thu, 08 Jun 2023 07:41:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6S8wR4aSFunspyaTrvxpiqT5OvVaDpHCdYuTBVbSGPiz3q0rKcWYsHzCvCEp3fR30jom8n5A==
X-Received: by 2002:adf:f9c7:0:b0:30a:8e58:7955 with SMTP id w7-20020adff9c7000000b0030a8e587955mr2024091wrr.13.1686235303057;
        Thu, 08 Jun 2023 07:41:43 -0700 (PDT)
Date: Thu, 8 Jun 2023 10:41:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>
Message-ID: <20230608104119-mutt-send-email-mst@kernel.org>
References: <20230605071608.73016-1-hengqi@linux.alibaba.com>
 <DM8PR12MB54805C0A8E0E617EE2149851DC53A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20230608064042.GC28580@h68b04307.sqa.eu95>
 <PH0PR12MB548119AC6E8CF4A5EBCBA4D3DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548119AC6E8CF4A5EBCBA4D3DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] RE: [PATCH v15] virtio-net: support inner header
 hash

On Thu, Jun 08, 2023 at 02:26:51PM +0000, Parav Pandit wrote:
> 
> > From: Heng Qi <hengqi@linux.alibaba.com>
> > Sent: Thursday, June 8, 2023 2:41 AM
> 
> [..]
> > > > +The device MUST calculate the inner header hash for the configured
> > > > \field{hash_tunnel_types} without the outer UDP header if
> > > > \field{hash_option} is 1.
> > > > +
> > > This I think conflicts with the current RSS where if this override (higher priority
> > than RSS) or not.
> > 
> > VIRTIO_NET_F_HASH_TUNNEL instructs the device to calculate an inner header
> > hash for configured tunnel types.
> > Then, which fields are used for the calculation of the inner header hash is
> > determined by the RSS configuration.
> > 
> > Therefore, if the inner header hash uses \field{hash_option} to indicate that the
> > outer source UDP port is used to calculate the hash, it overrides the RSS
> > configuration (higher priority than RSS). It now not only indicates for which
> > tunnel types the inner hash should be calculated, but also indicates which fields
> > participate in the RSS hash calculation.
> > 
> > At this point, we can
> > 1. continue to allow this behavior. That is, if \field{hash_option} is set to 1, the
> > hash value calculated based on the outer source port indicated by
> > VIRTIO_NET_F_HASH_TUNNEL is provided to the indirection table to select the
> > rxq instead of the hash value provided by RSS.
> > 
> > 2. hand over to RSS the ability to specify a hash based on the outer source port.
> > That is, we can add VIRTIO_NET_RSS_HASH_TUNNEL_SRC_PORT_UDP_{v4, v6,
> > EX} in \field{supported_hash_types} to indicate that the hash should be
> > calculated using the outer source port for all UDP tunneling protocols.
> > This approach removes the need for \field{hash_option} and makes the line
> > between VIRTIO_NET_F_HASH_TUNNEL and VIRTIO_NET_F_RSS clearer.
> > 
> #2 is preferred.
> 
> But I must be missing something.
> Without VIRTIO_NET_RSS_HASH_TUNNEL_SRC_PORT_UDP_X, today if one wants to do RSS based on the outer UDP ports,
> It is already supported by the RSS (even in presence of the inner header).
> 
> So why do have to introduce VIRTIO_NET_RSS_HASH_TUNNEL_SRC_PORT_UDP_X?

they want an option to ignore all other header fields.

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

