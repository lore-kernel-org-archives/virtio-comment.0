Return-Path: <virtio-comment-return-4799-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A115BC678D5
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 14:40:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 882051FF88
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 14:39:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E8BB9986869
	for <virtio-comment@archiver.kernel.org>; Wed,  8 Mar 2023 14:39:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6B02D98670D; Wed,  8 Mar 2023 14:39:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2E9279866F1
	for <virtio-comment@lists.oasis-open.org>; Wed,  8 Mar 2023 14:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: exEU15dbOH2rzYrbI_0Gbg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678286388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5TsJYVHtbxclUtkUAdJm+0pAqtvtigLMcjNEA9rQjPI=;
        b=2JZZMbIoC07xnD1DWwTWmiPW4jKNFRQ/8zeJoxp7JgTb/YIKn5sIWttZBkgts9acuH
         Oz/DGpNJUABtHjb/SfdG3FPeSXUYa5U5h/KwxiWoPUuw/fJM9CD10XbSQj0jCTUy9c3y
         qBMIKjEyXShKdN6ggdEKFwVIQ49+cX1kTy1+xPd+3YeEuLiygjKCulZO5DvK5Bh7myGP
         K8CIVFUcRdVYczvnlwuUdyt9JwqwsDMuyAiJXBZRXnnRSPHsVsFRclg3HtLj0t7z3ER3
         ViUrL28ANfQbbHet/pjv3xTK+5QIvejUbtZJMS2sCkqI9l9xOK/XpL98NdQSFDNtwXlw
         5hUw==
X-Gm-Message-State: AO0yUKXXzqcKchZ3CVukrH+2iNha9Srn/qNyRluVIrgJ+MkMRB+z89Qn
	iMrjts9N1nj6f85528q9lhrN+09cZ8uFBl2f/yEic28AoWfeGnNyT+bCfuQu95c4RHmWHDWu8BO
	QPKov4L2rErwJ2qinRb06HESxJlH237170w==
X-Received: by 2002:a5d:680d:0:b0:2c5:6cfe:aabf with SMTP id w13-20020a5d680d000000b002c56cfeaabfmr11672077wru.9.1678286388544;
        Wed, 08 Mar 2023 06:39:48 -0800 (PST)
X-Google-Smtp-Source: AK7set/849o1lBY2yfmlB/uSsKoblpNJXL5iiYIvPhFWHtiGLy0TNWKlFvKo/Z79LLvQ2dvdP3ey8w==
X-Received: by 2002:a5d:680d:0:b0:2c5:6cfe:aabf with SMTP id w13-20020a5d680d000000b002c56cfeaabfmr11672059wru.9.1678286388198;
        Wed, 08 Mar 2023 06:39:48 -0800 (PST)
Date: Wed, 8 Mar 2023 09:39:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org,
	Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230308093311-mutt-send-email-mst@kernel.org>
References: <20230218143715.841-1-hengqi@linux.alibaba.com>
 <20230228061309-mutt-send-email-mst@kernel.org>
 <25231225-59c8-91b0-e0dd-3dab8aa8164b@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <25231225-59c8-91b0-e0dd-3dab8aa8164b@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] Re: [virtio-dev] Re: [PATCH v9] virtio-net:
 support inner header hash

On Wed, Mar 01, 2023 at 10:56:31AM +0800, Heng Qi wrote:
> 
> 
> 在 2023/2/28 下午7:16, Michael S. Tsirkin 写道:
> > On Sat, Feb 18, 2023 at 10:37:15PM +0800, Heng Qi wrote:
> > > If the tunnel is used to encapsulate the packets, the hash calculated
> > > using the outer header of the receive packets is always fixed for the
> > > same flow packets, i.e. they will be steered to the same receive queue.
> > Wait a second. How is this true? Does not everyone stick the
> > inner header hash in the outer source port to solve this?
> 
> Yes, you are right. That's what we did before the inner header hash, but it
> has a performance penalty, which I'll explain below.
> 
> > For example geneve spec says:
> > 
> >     it is necessary for entropy from encapsulated packets to be
> >     exposed in the tunnel header.  The most common technique for this is
> >     to use the UDP source port
> 
> The end point of the tunnel called the gateway (with DPDK on top of it).
> 
> 1. When there is no inner header hash, entropy can be inserted into the udp
> src port of the outer header of the tunnel,
> and then the tunnel packet is handed over to the host. The host needs to
> take out a part of the CPUs to parse the outer headers (but not drop them)
> to calculate the inner hash for the inner payloads,
> and then use the inner
> hash to forward them to another part of the CPUs that are responsible for
> processing.

I don't get this part. Leave inner hashes to the guest inside the
tunnel, why is your host doing this?

> 1). During this process, the CPUs on the host is divided into two parts, one
> part is used as a forwarding node to parse the outer header,
>      and the CPU utilization is low. Another part handles packets.

Some overhead is clearly involved in *sending* packets -
to calculate the hash and stick it in the port number.
This is, however, a separate problem and if you want to
solve it then my suggestion would be to teach the *transmit*
side about GRE offloads, so it can fill the source port in the card.

> 2). The entropy of the source udp src port is not enough, that is, the queue
> is not widely distributed.

how isn't it enough? 16 bit is enough to cover all vqs ...

> 2. When there is an inner header hash, the gateway will directly help parse
> the outer header, and use the inner 5 tuples to calculate the inner hash.
> The tunneled packet is then handed over to the host.
> 1) All the CPUs of the host are used to process data packets, and there is
> no need to use some CPUs to forward and parse the outer header.

You really have to parse the outer header anyway,
otherwise there's no tunneling.
Unless you want to teach virtio to implement tunneling
in hardware, which is something I'd find it easier to
get behind.

> 2) The entropy of the original quintuple is sufficient, and the queue is
> widely distributed.

It's exactly the same entropy, why would it be better? In fact you
are taking out the outer hash entropy making things worse.

> 
> Thanks.
> > 
> > same goes for vxlan did not check further.
> > 
> > so what is the problem?  and which tunnel types actually suffer from the
> > problem?
> > 
> 
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


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

