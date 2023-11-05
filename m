Return-Path: <virtio-comment-return-8167-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D08C4332F
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Nov 2023 13:13:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 72F742B03F
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Nov 2023 13:13:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 53A3F9866B6
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Nov 2023 13:13:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3C06298669B; Sun,  5 Nov 2023 13:13:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 26FF798669C
	for <virtio-comment@lists.oasis-open.org>; Sun,  5 Nov 2023 13:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0VvefH73_1699190030;
Message-ID: <03dfc1d5-bb88-45b3-8617-d1f77726afbd@linux.alibaba.com>
Date: Sun, 5 Nov 2023 21:13:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Satananda Burla <sburla@marvell.com>, Parav Pandit <parav@nvidia.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <d8aa405e0aa02043e486e3ac782c2680abeff9f7.1698992387.git.hengqi@linux.alibaba.com>
 <87cywrq6kh.fsf@redhat.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <87cywrq6kh.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v5] virtio-net: support the RSS context



在 2023/11/3 下午10:01, Cornelia Huck 写道:
> On Fri, Nov 03 2023, Heng Qi <hengqi@linux.alibaba.com> wrote:
>
>> Commit 84a1d9c48200 ("net: ethtool: extend RXNFC API to support RSS spreading of
>> filter matches") adds support for RSS context as a destination for receive flow filters
>> (see WIP work: https://lists.oasis-open.org/archives/virtio-comment/202308/msg00194.html).
>>
>> An RSS context consists of configurable parameters specified by receive-side scaling.
>>
>> Some use cases:
>> 1. When users want some data flows to be steered to specific multiple rxqs, they can set
>>     receive flow filter rules for these data flows to an RSS context with desired rxqs.
>> 2. Traffic isolation. Used when users want the traffic of certain applications to occupy
>>     several queues without being distubed.
>>
>> How to set/configure an RSS context:
>> Assuming no RSS context has been created before.
>> 1. ethtool -X eth0 context new start 5 equal 8
>>
>> This command creates an RSS context with an id=1 for eth0, and fills in the indirection
>> table with rxq indexes 5-8 circularly. The hash key and hash types reuse the default
>> RSS configuration.
>>
>> Then, we can use 'ethtool -x eth0 context 1' to query the above configuration.
>>
>> 2. ethtool -X eth0 context new start 6 equal 7 \
>>     hkey 8f:bf:dd:11:23:58:d2:8a:00:31:d0:32:a3:b5:1f:\
>>     1f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:18:dd:4d:c8:f3
>>
>> This command creates an RSS context with an id=2 for eth0, and fills in the indirection
>> table with rxq indexes 6-7 circularly. The hash key is 8f:bf:dd:11:23:58:d2:8a:00:31:d0\
>> :32:a3:b5:1f:1f:e4:d1:fe:47:7f:64:42:fd:d0:61:16:b8:b0:f9:71:e8:2d:36:7f:18:dd:4d:c8:f3.
>> Hash types reuse the default RSS configuration.
>>
>> 3. ethtool -N eth0 rx-flow-hash tcp4 sdfn context 1
>>
>> This command specifies the hash types for the RSS context whose id=1 on eth0.
>> Now this RSS context only has the hash key to reuse the default RSS configuration.
>>
>> 4. ethtool -N eth0 flow-type udp4 src-ip 1.1.1.1 context 1
>>
>> This command configures a receive flow filter rule for eth0, and the data flow matching
>> this rule will continue to select the final rxq according to the RSS context configuration
>> with id=1.
>>
>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/178
>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
>> Signed-off-by: Parav Pandit <parav@nvidia.com>
>> Acked-by: Satananda Burla <sburla@marvell.com>
>> ---
>> v4->v5:
>>    1. Use 'u8 reserved[6]' instead of u16 padding to align the structure.
>>
>> v3->v4:
>>    1. Rebase to Xuan's device stats patch.
>>
>> v2->v3:
>>    1. Process Satananda's comments and add his ack tag.
>>    2. Add link to fix issue and optimize commit log.
>>
>> v1->v2:
>>    1. u8 to le16 for field rss_ctx_id.
>>    2. Add normativation when device resetting. @Yuri Benditovich
>>    3. Use ctrlq cmd to query rss context capability instead of reading config space. @Parav Pandit
>>
>>   device-types/net/description.tex        | 85 +++++++++++++++++++++++++
>>   device-types/net/device-conformance.tex |  1 +
>>   device-types/net/driver-conformance.tex |  1 +
>>   3 files changed, 87 insertions(+)
> So, what's the status here? The github issue still points to the
> previous version (where you had asked for opening a vote.)

Hi, Cornelia.

Currently this version has been acked by Satananda and Parav, I will 
modify the link
in the github issue and this will require a vote. Could you please 
initiate a vote?

> There's only
> the padding change in this version... can I get some ack from net folks
> on whether this is ready for a vote?

I don't understand what this means, what do I need to do?
Aren’t Parav and Satananda the net folks :)?

Thanks!




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

