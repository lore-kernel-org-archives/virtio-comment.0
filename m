Return-Path: <virtio-comment-return-6150-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834C7C77B73
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 07:16:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 980C0E6949
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 07:16:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7E54498648C
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 07:16:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 65BFF986262; Tue,  6 Jun 2023 07:16:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4AA12986488
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 07:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686035772; x=1688627772;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z4+5u346BDhJI/xQspczijGVOx1596UNX289bT0SkPM=;
        b=dzDvFlFRSwthrhaamu/3Ct/JPCW3jPh2ARsmV4I6p34tllYfWoLeJxuTi6Yf0WKfX7
         v6Y6qZUV2xQFMl+isAwOUPxcSqgjOvBQ45/FgL+CKrGRKNl5illZwUOz7Cb9vtyhmveY
         A2Xgu5R3+aGfMT5g1n+UbShu+vcCxibh94Vqjyrbq5DqI3o7IQkEqEbXLVwOLfwN6gIJ
         na1kcNx2qFu8VXcuDM20K1LgbeHDjMdY2Q4WpMlKySfGueSxRsmui/x3rEIZN0aSh58T
         G+EJ455F0APPoaXnRrkbK80+PsRvh/inqtnHgVu/S/tjatCXsChxJlimsfB7Ukl27k6o
         rakg==
X-Gm-Message-State: AC+VfDyjZLJpJEe1arGJTHqcVpbfjZvLEWBrU0peXWj8yc+hryMlvCNF
	glNzkj3/41w3HGAPkQt4Zw7hFg==
X-Google-Smtp-Source: ACHHUZ6+yTgE6wYKmPGtL5r6Nbz0O4kuow0Xtw0emHgQn2qu8xNfMY0zNHXg6GO1AVuNJySZ+0hjnw==
X-Received: by 2002:a25:ef12:0:b0:bad:5ee:e786 with SMTP id g18-20020a25ef12000000b00bad05eee786mr1015233ybd.18.1686035771835;
        Tue, 06 Jun 2023 00:16:11 -0700 (PDT)
Message-ID: <5a87cd0a-c883-5c4c-89d1-59be3ad73b4e@bytedance.com>
Date: Tue, 6 Jun 2023 15:13:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, "stefanha@redhat.com"
 <stefanha@redhat.com>
Cc: "mst@redhat.com" <mst@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "houp@yusur.tech" <houp@yusur.tech>,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
 "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>,
 "jasowang@redhat.com" <jasowang@redhat.com>, zhouhuaping.san@bytedance.com
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-6-pizhenwei@bytedance.com>
 <6b653208-ca45-4674-4568-9cb003e14d02@nvidia.com>
 <5c3600cd-4c9f-9d1f-a807-13ed54f6b11f@bytedance.com>
 <PH0PR12MB548194DBF9A205173DFE8042DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fe6a7f09-6ee5-25d0-ea7e-ef4d77a37263@bytedance.com>
 <PH0PR12MB54817ED91B804F55FDC99EC5DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <PH0PR12MB54817ED91B804F55FDC99EC5DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: RE: RE: [virtio-comment] Re: [PATCH v2 05/11] transport-fabrics:
 introduce Keyed Transmission



On 6/5/23 21:12, Parav Pandit wrote:
> 
> 
>> From: zhenwei pi <pizhenwei@bytedance.com>
>> Sent: Monday, June 5, 2023 8:50 AM
> 
> 
>>>>> if we talk blk as an example, above command descriptor can be of 32
>>>>> bytes, such as struct virtio_of_cmd {
>>>>>        u8 opcode;
>>>>>        u8 rsvd;
>>>>>        le16 cmd_id;
>>>>>        u8 inline_desc_cnt;
>>>>>        u8 rsvd[3];
>>>>>        /* some padding/metadata for long desc list if any */ };
>>>>>
>>>>> struct virtio_of_rdma_desc {
>>>>>        le64 addr;
>>>>>        le32 length;
>>>>>        le32 rdma_key;
>>>>> };
>>>>>
>>>>> struct virtio_rdma_op {
>>>>>        struct virtio_of_cmd cmd;
>>>>>        struct virtio_of_rdma_desc desc[1 or 3]; /* count can be
>>>>> negotiated */ };
>>>>>
>>>>> With this a send and receive queue on initiator and target can
>>>>> exchange, cmd descriptor for read/writes.
>>>>>
>>>>
>>>> Hi,
>>>>
>>>> Do you mean that separating a Virtio Over RDMA queue into 2 QP, one
>>>> for sending, another one for receiving?
>>>>
>>> No. just one QP.
>>>
>>> Initiator_QP_A -> target_QP_B.
>>>
>>> When initiator QP A sends 32B cmd, it lands in the target QP B's receive
>> queue.
>>>
>>> After this target can do one or more read/write DMA using RDMA read/write
>> from the initiator's memory.
>>>
>>
>> Hi, I have several questions:
>> 1, how to tell the target to read/write DMA using RDMA read/write? is
>> virtio_of_rdma_desc missing?
>>
> Virtio_of_rdma_desc is part of the 32B struct virtio_rdma_op in above example.
> 
>> 2, if several virtio_of_rdma_desc arrives, the target need to distinguish READ *
>> m + WRITE * n descriptors. but *flags* field has been removed ...
>>
> The idea is to not have multiple virtio_of_rdma_desc.
> An initiator can represent 1B to 4GB of noncontiguous buffer using a single rdma mkey.
> Hence, only one virtio_of_rdma_desc is enough from initiator to target.
> 

I have only a few knowledge about this:
https://docs.nvidia.com/networking/pages/viewpage.action?pageId=25138119

And I notice that rdma-core and linux infiniband/core has no standard 
support for this, it seems mlx5 specific. Please correct me if I 
misunderstood...

>> 3, if I understand correctly, Initiator_QP_A -> Target_QP_B(CMD),
>> Target_QP_B(RDMA READ), Target_QP_B(RDMA WRITE), Target_QP_B ->
>> Initiator_QP_A(COMP). this uses 4 RTT.
>>
> RDMA read and writes are for the actual variable size data of 512B, 4K, 1MB etc.
> 
> Optionally, a target can expose a constant size buffer where initiator can directly write the data of 512B, 4KB as well.
> However, this doesn't scale very well always, but sure it is possible, and it only works for blk write commands.
> 
> In a more advanced scheme target can dynamically add such buffers and advertise it to the initiator.
> I would think to make it incremental once the basic data flow model is established.
> 
>>> Finally target_QP_B sends 8B completion, it arrives in the QP_A's receive
>> queue.
>>
>> --
>> zhenwei pi

-- 
zhenwei pi

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

