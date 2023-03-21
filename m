Return-Path: <virtio-comment-return-4935-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD7DC6FD1D
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 07:37:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 604EE2ACF8
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 07:37:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5A051986486
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Mar 2023 07:37:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 52CE3986447; Tue, 21 Mar 2023 07:37:15 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 438D3986449
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Mar 2023 07:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: kZJtNV70OrukuW7BuAUN6w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679384228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE6UqgxJ3wpmG1iuIxcjjf188FQy/cmlZBHyFhrT8u8=;
        b=unFuJcs5vt5e90nbeauVCMbbBN9MTItubC8SiMXFyfdSxayKaQUG927UYt2oF2S2ZS
         2FtFqd6UMTdOHuYyge3lA/ip4T7AxR+/5Y+fH6WAq/6pKshHp5W9SiB+PmE+FJgNKyBn
         eH78VhBhFt9Rj00U4sAE5jOJ4SsD140s0qHL2sINaiC3dJyHuaAahwqqPrzghrAot3OO
         weIr1dj92MoVO46ixJauC+rKa3m2vzvioDZPcj9N0OGxiXI9TXljZ3K67xN5Yre0lSxo
         JHnUmFfT2GuiAigu7ky9W5m8xBhwiQ2vGeT/pqMhPpKzjM81DuoNjiFQ9xcAzernMCAC
         mqJA==
X-Gm-Message-State: AO0yUKVhyU1NsCpW23t4wlOJrbuNBYECNaBdNZ57LcvO2PzbRNfQhfqB
	Tmpp3zZ2NLkp17rIVedGU25Yqsw55GvnXeY8c2Dn0Klv0FDz3tY/Y8xXwOxB8UvjkYFvceurTiY
	nhP2+zj1uoT+LgH4tRykfofml0aHEKsPWkg==
X-Received: by 2002:a5d:68c8:0:b0:2d7:3cd3:85b2 with SMTP id p8-20020a5d68c8000000b002d73cd385b2mr1282224wrw.23.1679384228556;
        Tue, 21 Mar 2023 00:37:08 -0700 (PDT)
X-Google-Smtp-Source: AK7set90i8fr5N3gwLeA2ESlUhHIU1ZAz/2LaLR0CEBRGotyR7stiMcZ7DOJq7VebCWXt4BekaO3Dw==
X-Received: by 2002:a5d:68c8:0:b0:2d7:3cd3:85b2 with SMTP id p8-20020a5d68c8000000b002d73cd385b2mr1282210wrw.23.1679384228285;
        Tue, 21 Mar 2023 00:37:08 -0700 (PDT)
Date: Tue, 21 Mar 2023 03:37:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>,
	Alvaro Karsz <alvaro.karsz@solid-run.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Jason Wang <jasowang@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230321033449-mutt-send-email-mst@kernel.org>
References: <20230320111840.64039-1-hengqi@linux.alibaba.com>
 <20230320144625-mutt-send-email-mst@kernel.org>
 <3a1969e7-2c4d-b64e-33b2-57311d73fb45@linux.alibaba.com>
 <PH0PR12MB5481C6A8454381F508A30387DC819@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C6A8454381F508A30387DC819@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH v11] virtio-net: support inner header
 hash

On Tue, Mar 21, 2023 at 04:19:17AM +0000, Parav Pandit wrote:
> One (this proposal) is solving spread to different RSS queues.

Spread is mostly ok with modern protocols though. It seems to
optimize for a specific monitoring solution.

> Another one is finding out which exact packet to drop/pass when queue usage is high. (ebpf/tc other ways to solve it).
> 
> Ebpf sounds cooler than the real offload implementation in the hw device at the current level.
> I remember Jason's good talk on the ebpf a few years back, which is possible when done in sw on the hypervisor.

I was talking about classic bpf though. no state.

> On mlx5 device inner hash is supported for IPnIP and GRE tunnels.

which variants of GRE are supported?

> None of the existing users see tunnel attacks when used as forwarding plane.

good to know.

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

