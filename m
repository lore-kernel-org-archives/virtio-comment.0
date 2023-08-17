Return-Path: <virtio-comment-return-7187-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D8DC2FC04
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 05:14:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 204D994EE3
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 05:14:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1712B986419
	for <virtio-comment@archiver.kernel.org>; Thu, 17 Aug 2023 05:14:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0E675984043; Thu, 17 Aug 2023 05:14:58 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F34CC9863F0;
	Thu, 17 Aug 2023 05:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=hengqi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0Vpyd788_1692249224;
Message-ID: <433ebf9c-97c6-4d1d-92ac-6a7be65e3241@linux.alibaba.com>
Date: Thu, 17 Aug 2023 13:14:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Parav Pandit <parav@nvidia.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "david.edmondson@oracle.com" <david.edmondson@oracle.com>,
 "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
 "sburla@marvell.com" <sburla@marvell.com>
Cc: Shahaf Shuler <shahafs@nvidia.com>,
 "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
References: <20230815074600.473933-1-parav@nvidia.com>
 <20230815074600.473933-6-parav@nvidia.com>
 <131c210d-dced-454c-b60b-950442308dcf@linux.alibaba.com>
 <PH0PR12MB54812AD79BF20B024DB1F63CDC1AA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Heng Qi <hengqi@linux.alibaba.com>
In-Reply-To: <PH0PR12MB54812AD79BF20B024DB1F63CDC1AA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH requirements v4 5/7] net-features: Add n-tuple receive
 flow filters requirements



在 2023/8/17 下午12:52, Parav Pandit 写道:
>
>> From: Heng Qi <hengqi@linux.alibaba.com>
>> Sent: Wednesday, August 16, 2023 5:12 PM
>>> +/* command 1 */
>>> +struct flow_filter_capabilities {
>>> +	le16 start_vq_index;
>>> +	le16 num_flow_filter_vqs;
>>> +	le16 max_flow_groups;
>>> +	le16 max_group_priorities; /* max priorities of the group */
>>> +	le32 max_flow_filters_per_group;
>>> +	le32 max_flow_filters; /* max flow_id in add/del
>>> +				* is equal = max_flow_filters - 1.
>>> +				*/
>>> +	u8 max_priorities_per_group;
>> + u8 padding[3];
>>
> Ack.
>
>>> +struct virtio_net_rff_group_add {
>>> +	le16 priority;
>> Please explicitly explain the relationship between the number and the priority,
>> for example, the smaller the number, the higher the priority :)
>>
> Right. Will do.
> I was thinking of higher the value higher the priority, so that one doesnt need to invert this in brain every time seeing the priority field. :)
>   

It's ok :)

>>> +	le16 group_id;
>>> +};
>>> +
>>> +
>>> +struct virtio_net_rff_group_delete {
>>> +	le16 group_id;
>>> +
>>> +```
>>> +
>>> +3. Flow filter entry add/modify, delete over flow vq:
>>> +
>>> +```
>>> +struct virtio_net_rff_add_modify {
>>> +	u8 flow_op;
>>> +	u8 padding;
>> s/padding/priority
>>
> Ack.
>
>> Each rule needs a priority.
>>
>>> +	u16 group_id;
>>> +	le32 flow_id;
>>> +	struct match_criteria mc;
>>> +	struct destination dest;
>>> +	struct action action;
>>> +
>>> +	struct match_criteria mask;	/* optional */
>>> +};
>>> +
>>> +struct virtio_net_rff_delete {
>>> +	u8 flow_op;
>>> +	u8 padding[3];
>>> +	le32 flow_id;
>>> +};
>>> +
>>> +```
>>> +
>>> +4. Flow filter commands over cvq:
>>> +
>>> +```
>>> +
>>> +struct virtio_net_rff_cmd {
>>> +	u8 class; /* RFF class */
>>> +	u8 commands; /* RFF cmd = A */
>>> +	u8 command-specific-data[]; /* contains struct
>> virtio_net_rff_add_modify or
>>> +				     * struct virtio_net_rff_delete
>> For flow vq, we no longer distinguish operations by command, but by flow_op.
>> But for ctrlq, this field will be carried. We should make it clear that when ctrlq is
>> delivered based on cmd, the flow_op field is ignored.
>>
> Since cvq is only the communication medium for delivering of command, it is better use the flow_op as is, and cvq commands field to be ignored.
> This way, software layers are more organized cvq or flow vq.

Agree.

Thanks!

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

