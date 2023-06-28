Return-Path: <virtio-comment-return-6568-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B41CEB64DC
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 10:10:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 5B4A741F24
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 10:10:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4970D986588
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 10:10:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 31FF398656E; Wed, 28 Jun 2023 10:10:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1F41B98656F
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Jun 2023 10:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Y1zUO5qIMNq5QKYGq40QVA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687947042; x=1690539042;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/F/Gj+35HuFIkOAckuCTE/bMakH0NSKW0sVlHaAiJU=;
        b=SwAkwprw2l+i3D8ojMBnuzL7OTqjEDHpEsE4LXdx5NVUAClWWZBdHGJy1UQL0qSQsx
         RcVDsBwsrqteQfVb+XOB/NbiFBmudWt5oZl8KNVJQ+BEvXugHSbuBZDBYyAwApIcDB+T
         /NQ4y4bGgYyxC8Z6anJjXT9S3bWLSaq0FR0/tDlzZ07i07i/Jn5QhawYaxpg2V/PZxYx
         6K4lWYoVFFIsbUekxiKJEkAxdTlSN502QZWg+Xxnpzk5EMvDcJgoplRGViVHMi3lYX+x
         mRqUYunUhWQ0DeFQFq9fsLAXM7B70mFYbVpPOr9VD4004CnZ0ZwePAqGdqu7pSSdpJQp
         PhzQ==
X-Gm-Message-State: AC+VfDyUihnW2jXt92L8+c+wK/KREBCGMxBw44b4+ki0tTwbvnv0+Wp/
	olFyAPNws08s+FX3b8QI9ykMYKa2wPBv7xUPsJkgmdroAu2ehZ9tJiqm5sVbPCz3H4myJYZtRz9
	OA4joSC+rNCTRC7L7vDKR+LswT5YeLELP+A==
X-Received: by 2002:adf:e40d:0:b0:314:824:3778 with SMTP id g13-20020adfe40d000000b0031408243778mr1763348wrm.22.1687947042281;
        Wed, 28 Jun 2023 03:10:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6UgIDmNz488AjmWyPWoKtWfA28+bn2E0k0jHw9r7cx+fyIp1dN0/MQyMJ2hLCDkw5RaUp/xQ==
X-Received: by 2002:adf:e40d:0:b0:314:824:3778 with SMTP id g13-20020adfe40d000000b0031408243778mr1763330wrm.22.1687947041886;
        Wed, 28 Jun 2023 03:10:41 -0700 (PDT)
Date: Wed, 28 Jun 2023 06:10:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-comment@lists.oasis-open.org,
	virtio-dev@lists.oasis-open.org, Parav Pandit <parav@nvidia.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Message-ID: <20230628060519-mutt-send-email-mst@kernel.org>
References: <20230627163549.40028-1-hengqi@linux.alibaba.com>
 <CACGkMEvFmAiWDp8w=ytin21Oi+PcTb1X3Eve7Kt2NVr_RkhgmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEvFmAiWDp8w=ytin21Oi+PcTb1X3Eve7Kt2NVr_RkhgmA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v19] virtio-net: support inner header hash

On Wed, Jun 28, 2023 at 11:46:22AM +0800, Jason Wang wrote:
> On Wed, Jun 28, 2023 at 12:35 AM Heng Qi <hengqi@linux.alibaba.com> wrote:
> >
> > 1. Currently, a received encapsulated packet has an outer and an inner header, but
> > the virtio device is unable to calculate the hash for the inner header. The same
> > flow can traverse through different tunnels, resulting in the encapsulated
> > packets being spread across multiple receive queues (refer to the figure below).
> > However, in certain scenarios, we may need to direct these encapsulated packets of
> > the same flow to a single receive queue. This facilitates the processing
> > of the flow by the same CPU to improve performance (warm caches, less locking, etc.).
> >
> >                client1                    client2
> >                   |        +-------+         |
> >                   +------->|tunnels|<--------+
> >                            +-------+
> >                               |  |
> >                               v  v
> >                       +-----------------+
> >                       | monitoring host |
> >                       +-----------------+
> >
> > To achieve this, the device can calculate a symmetric hash based on the inner headers
> > of the same flow.
> >
> > 2. For legacy systems, they may lack entropy fields which modern protocols have in
> > the outer header, resulting in multiple flows with the same outer header but
> > different inner headers being directed to the same receive queue. This results in
> > poor receive performance.
> >
> > To address this limitation, inner header hash can be used to enable the device to advertise
> > the capability to calculate the hash for the inner packet, regaining better receive performance.
> >
> > Fixes: https://github.com/oasis-tcs/virtio-spec/issues/173
> > Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
> > Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > Reviewed-by: Parav Pandit <parav@nvidia.com>
> > ---
> > v18->v19:
> >         1. Have a single structure instead of two. @Michael S . Tsirkin
> >         2. Some small rewrites. @Michael S . Tsirkin
> >         3. Rebase to master.
> >
> > v17->v18:
> >         1. Some rewording suggestions from Michael (Thanks!).
> >         2. Use 0 to disable inner header hash and remove
> >            VIRTIO_NET_HASH_TUNNEL_TYPE_NONE.
> > v16->v17:
> >         1. Some small rewrites. @Parav Pandit
> >         2. Add Parav's Reviewed-by tag (Thanks!).
> >
> > v15->v16:
> >         1. Remove the hash_option. In order to delimit the inner header hash and RSS
> >            configuration, the ability to configure the outer src udp port hash is given
> >            to RSS. This is orthogonal to inner header hash, which will be done in the
> >            RSS capability extension topic (considered as an RSS extension together
> >            with the symmetric toeplitz hash algorithm, etc.). @Parav Pandit @Michael S . Tsirkin
> >         2. Fix a 'field' typo. @Parav Pandit
> >
> > v14->v15:
> >         1. Add tunnel hash option suggested by @Michael S . Tsirkin
> >         2. Adjust some descriptions.
> >
> > v13->v14:
> >         1. Move supported_hash_tunnel_types from config space into cvq command. @Parav Pandit
> 
> I may miss some discussions, but this complicates the provisioning a lot.
> 
> Having it in the config space, then a type agnostic provisioning
> through config space + feature bits just works fine.
> 
> If we move it only via cvq, we need device specific provisioning interface.
> 
> Thanks

Yea that's what I said too. Debugging too.  I think we should build a
consistent solution that allows accessing config space through DMA,
separately from this effort.  Parav do you think you can live with this
approach so this specific proposal can move forward?

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

