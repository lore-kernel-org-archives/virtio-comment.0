Return-Path: <virtio-comment-return-5692-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB2CC77B60
	for <virtio-comment@archiver.kernel.org>; Fri, 28 Apr 2023 07:55:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1CCE72A88B
	for <virtio-comment@archiver.kernel.org>; Fri, 28 Apr 2023 07:55:58 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0293D98668B
	for <virtio-comment@archiver.kernel.org>; Fri, 28 Apr 2023 07:55:58 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EB63B986681; Fri, 28 Apr 2023 07:55:57 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DB219986682
	for <virtio-comment@lists.oasis-open.org>; Fri, 28 Apr 2023 07:55:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682668555; x=1685260555;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VL9LDu8DU3Va3PDXDkVz37vkQYafMGcSZXK+8VgtsTw=;
        b=UFK09UNf20Bdl0eSyoM4KbCAqf8vMgPQaGMnZiOX54EiZp0js84YBZdgQCt39Z/6DM
         Sj7t5kZkyXArm9qr678rlbhUutP4lBZuiPkUJyP2ktDSj97J9JVNZs1uDpYA+6lP6qjD
         DcyfDAoo5i11W4pKlWACTTqZucdm7AYTd9OuDSpNpyfvoqj/uioCAD+mScrx3fzZ1S+I
         NkdoiseY45U11QkwshPiXhMCX6nm5om+9mYxAvSKlBJx1TcICZ6QqtzB4u661lo1/l2+
         3zoC/jfqafrh/4Zc/PaOPz6Wr/jhhng4MOmvrC4oFT2+57BbWYdkcMTzh7CJbWEckL/t
         rRLA==
X-Gm-Message-State: AC+VfDzeJ74Vox/1NZucx9tV9pG/uoszefdNFdij2Oy6LdKMwXEswpCO
	C+8lkslw6Uu7HzbeevXZfKwEzFS0bBDTNLaG8ak=
X-Google-Smtp-Source: ACHHUZ7IsB/SjeLgBIWWjThtg8oNqaSAhSFK85OAX5XSoWXvwP2M1TZ4xb4WgJM5sM55FP2hJNh9PQ==
X-Received: by 2002:a05:6a20:3d91:b0:f5:78fd:4152 with SMTP id s17-20020a056a203d9100b000f578fd4152mr6130372pzi.13.1682668554954;
        Fri, 28 Apr 2023 00:55:54 -0700 (PDT)
Message-ID: <b22ed875-8940-df96-0cfd-131fba093609@bytedance.com>
Date: Fri, 28 Apr 2023 15:53:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: virtio-comment@lists.oasis-open.org
References: <1ab0beff-8b18-7a94-1a68-6bf36bcd0394@bytedance.com>
 <CACGkMEvh+G2Tm=WDTOK3K2GO8c2dQ4y=UiKAk_kvsid2MGzbGg@mail.gmail.com>
 <8f65c9aa-c867-0929-151c-21bbe25a0693@bytedance.com>
 <4150bd72-a358-c854-0c64-b149621a1b8d@nvidia.com>
 <5af40945-9f11-93f8-bd2b-3a795d13f06c@bytedance.com>
 <PH0PR12MB54818E051102FDC9281F2DA0DC6A9@PH0PR12MB5481.namprd12.prod.outlook.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <PH0PR12MB54818E051102FDC9281F2DA0DC6A9@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: RE: Re: [virtio-comment] [PROPOSAL] Virtio Over Fabrics(TCP/RDMA)



On 4/28/23 04:31, Parav Pandit wrote:
> 
> 
>> From: zhenwei pi <pizhenwei@bytedance.com>
>> Sent: Thursday, April 27, 2023 4:21 AM
>>
>> On 4/25/23 13:03, Parav Pandit wrote:
>>>
>>>
>> [...]
>>>
>>> I briefly see your rdma command descriptor example, which is not
>>> aligned to 16B. Perf wise it will be poor than nvme rdma fabrics.
>>>
>>
>> Hi,
>> I'm confused here, could you please give me more hint?
>> 1, The size of command descriptor(I defined in example) is larger than
>> command size of nvme rdma, more overhead leads performance worse than
>> nvme over rdma.
>>
> Which structure?
> 
> I am guessing from the header file that you have,
> 
> virtio_of_command_vring
> followed by
> virtio_of_vring_desc[cmd.ndesc] where cmd.opcode = virtio_of_op_vring
> 
> if so, it seems fine to me.
> However, the lack of actual command missing in the virtio_of_command_vring struct is not so good.
> Such indirection overheads only reduce the perf as it is not constant size data coming in for the blk storage target side.
> And even if it comes somehow, it requires two level protocol parsers.
> Can be simplified as you are not starting with any history here, abstraction point can be possibly virtio commands than the vring.
> 
> I don’t see a need for desc to have id and flags the way its drafted over the rdma fabrics:
> What I had in mind as,
> struct virtio_of_descriptor {
> 	le64 addr;
> 	le32 len;
> 	union {
> 		le32 rdma_key;
> 		le32 id + reserved;
> 		le32 tcp_desc_id;
> 	};
> 
> We can possibly define appropriate virtio fabric descriptors; at that point, the abstraction point is not literally taking the vring across the fabric.
> 
> Depending on use case may be starting with either one of TCP or RDMA makes sense, instead of cooking all at once.
> 
>> 2, The command size not aligned to 16B leads performance issue on RDMA
>> SEND operation. My colleague Zhuo help me test the performance on sending
>> 16/24/32 bytes:
>> taskset -c 30 ib_send_bw -d mlx5_2 -i 1 -x 3 -s 16 -t 1 xx.xx.xx.xx taskset -c 30
>> ib_send_bw -d mlx5_2 -i 1 -x 3 -s 24 -t 1 xx.xx.xx.xx taskset -c 30 ib_send_bw -d
>> mlx5_2 -i 1 -x 3 -s 32 -t 1 xx.xx.xx.xx The QPS seems almost same.
>>
> structure [1] generated subsequent vring_desc[] descriptors to unaligned 8B address results in partial writes of the desc.
> 
> It is hard to say from ib_send_bw test what is being done.
> I remember mlx5 have cache aligned accesses, nop wqe segments and more.
> 
> I also don’t see the 'id' field coming back in the response command_status.
> So why to transmit over the fabric which is not used.
> Did I miss the id in completion side?
> 
> [1] https://github.com/pizhenwei/linux/blob/7a13b310d1338c462f8e0b13d39a571645bc4698/include/uapi/linux/virtio_of.h#L129

I got your point clearly. Thanks a lot! I'm working on the spec and I'll 
send it soon. Let's continue to discuss the detail in that series.

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

