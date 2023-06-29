Return-Path: <virtio-comment-return-6595-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE48FEB64DA
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 03:32:16 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A5F9BF3F75
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 03:32:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2AD2698672C
	for <virtio-comment@archiver.kernel.org>; Thu, 29 Jun 2023 03:32:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A5F5C98680F; Thu, 29 Jun 2023 03:32:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6AC7F9866EA
	for <virtio-comment@lists.oasis-open.org>; Thu, 29 Jun 2023 03:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: F49W0v16PamqnVrAf2r5Ag-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688009529; x=1690601529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kI5IOUeZJ/vHqBN7sqfgEDhZdVbaSKz3RpS2au4PPu0=;
        b=i3pq+Yaw2WwfpToeGAU6Xvr8OCxxdx6iHK55SikMFQUpmnaniMLLNguYqq0/gDKDEp
         yXkmVa6xG7xSjoAEeiPCj7GLL3lueTrvSrRexL+6YexS9t1HIBTHo6KvpEm5GqSUK5cS
         yr/C5rBs+xL67n4s55ftyk+f2kTI2tj1sipzD9nyNuaEzRZdIejU/JgczMM5P1yHCyT+
         EqGWu66Fujen+65zDi1xr+iWXqm5IQ747tec1/95MggkgHbdRgGimK0tobPjcIgCgqI3
         i9sQyuL+/8eSWcTCPALxsvcqiKrs3kQGo1iIQbFQLa9znWKwYCC/Rqt8rlZirzYgHM5i
         2zGA==
X-Gm-Message-State: AC+VfDxn4MI+jssczfig/iNE6yFTkympJVFhVJM/uuFzCoSkG+k0Jgcc
	PAzcsZDJPodPYLRrSiXRt388gFMwL6NdsXYkR3/KfnqwzHbiS0q1jaGf7fCmf+AAFPrHrtFQ+ft
	6yYtMzrURo63ouKaUZHXWer1p1XyqkWYrgA==
X-Received: by 2002:a17:90b:4d83:b0:263:4164:dfba with SMTP id oj3-20020a17090b4d8300b002634164dfbamr3149164pjb.6.1688009528940;
        Wed, 28 Jun 2023 20:32:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6q/WyQczcM65401ZAq7i/3V2e/Cybblvzag8eS9cEpcshnrGWvr/siUm0qncI3nezg+HAb+w==
X-Received: by 2002:a17:90b:4d83:b0:263:4164:dfba with SMTP id oj3-20020a17090b4d8300b002634164dfbamr3149150pjb.6.1688009528620;
        Wed, 28 Jun 2023 20:32:08 -0700 (PDT)
Message-ID: <2522ab61-a333-a33b-784c-01ea6b4b42da@redhat.com>
Date: Thu, 29 Jun 2023 11:31:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Heng Qi <hengqi@linux.alibaba.com>, virtio-comment@lists.oasis-open.org,
 virtio-dev@lists.oasis-open.org, Parav Pandit <parav@nvidia.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20230627163549.40028-1-hengqi@linux.alibaba.com>
 <CACGkMEvFmAiWDp8w=ytin21Oi+PcTb1X3Eve7Kt2NVr_RkhgmA@mail.gmail.com>
 <20230628060519-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230628060519-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH v19] virtio-net: support inner header hash


在 2023/6/28 18:10, Michael S. Tsirkin 写道:
> On Wed, Jun 28, 2023 at 11:46:22AM +0800, Jason Wang wrote:
>> On Wed, Jun 28, 2023 at 12:35 AM Heng Qi <hengqi@linux.alibaba.com> wrote:
>>> 1. Currently, a received encapsulated packet has an outer and an inner header, but
>>> the virtio device is unable to calculate the hash for the inner header. The same
>>> flow can traverse through different tunnels, resulting in the encapsulated
>>> packets being spread across multiple receive queues (refer to the figure below).
>>> However, in certain scenarios, we may need to direct these encapsulated packets of
>>> the same flow to a single receive queue. This facilitates the processing
>>> of the flow by the same CPU to improve performance (warm caches, less locking, etc.).
>>>
>>>                 client1                    client2
>>>                    |        +-------+         |
>>>                    +------->|tunnels|<--------+
>>>                             +-------+
>>>                                |  |
>>>                                v  v
>>>                        +-----------------+
>>>                        | monitoring host |
>>>                        +-----------------+
>>>
>>> To achieve this, the device can calculate a symmetric hash based on the inner headers
>>> of the same flow.
>>>
>>> 2. For legacy systems, they may lack entropy fields which modern protocols have in
>>> the outer header, resulting in multiple flows with the same outer header but
>>> different inner headers being directed to the same receive queue. This results in
>>> poor receive performance.
>>>
>>> To address this limitation, inner header hash can be used to enable the device to advertise
>>> the capability to calculate the hash for the inner packet, regaining better receive performance.
>>>
>>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/173
>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
>>> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>>> Reviewed-by: Parav Pandit <parav@nvidia.com>
>>> ---
>>> v18->v19:
>>>          1. Have a single structure instead of two. @Michael S . Tsirkin
>>>          2. Some small rewrites. @Michael S . Tsirkin
>>>          3. Rebase to master.
>>>
>>> v17->v18:
>>>          1. Some rewording suggestions from Michael (Thanks!).
>>>          2. Use 0 to disable inner header hash and remove
>>>             VIRTIO_NET_HASH_TUNNEL_TYPE_NONE.
>>> v16->v17:
>>>          1. Some small rewrites. @Parav Pandit
>>>          2. Add Parav's Reviewed-by tag (Thanks!).
>>>
>>> v15->v16:
>>>          1. Remove the hash_option. In order to delimit the inner header hash and RSS
>>>             configuration, the ability to configure the outer src udp port hash is given
>>>             to RSS. This is orthogonal to inner header hash, which will be done in the
>>>             RSS capability extension topic (considered as an RSS extension together
>>>             with the symmetric toeplitz hash algorithm, etc.). @Parav Pandit @Michael S . Tsirkin
>>>          2. Fix a 'field' typo. @Parav Pandit
>>>
>>> v14->v15:
>>>          1. Add tunnel hash option suggested by @Michael S . Tsirkin
>>>          2. Adjust some descriptions.
>>>
>>> v13->v14:
>>>          1. Move supported_hash_tunnel_types from config space into cvq command. @Parav Pandit
>> I may miss some discussions, but this complicates the provisioning a lot.
>>
>> Having it in the config space, then a type agnostic provisioning
>> through config space + feature bits just works fine.
>>
>> If we move it only via cvq, we need device specific provisioning interface.
>>
>> Thanks
> Yea that's what I said too. Debugging too.  I think we should build a
> consistent solution that allows accessing config space through DMA,
> separately from this effort.  Parav do you think you can live with this
> approach so this specific proposal can move forward?


We can probably go another way, invent a new device configuration space 
capability which fixed size like PCI configuration access capability?

struct virtio_pci_cfg_cap {
         struct virtio_pci_cap cap;
         u8 dev_cfg_data[4]; /* Data for device configuration space 
access. */
};

So it won't grow as the size of device configuration space grows.

Thanks


>


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

