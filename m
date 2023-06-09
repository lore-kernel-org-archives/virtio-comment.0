Return-Path: <virtio-comment-return-6283-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D08C7EE29
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 03:57:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 110F02ACA9
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 03:57:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0098298669B
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 03:57:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E112298668E; Fri,  9 Jun 2023 03:57:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CE49D98668F
	for <virtio-comment@lists.oasis-open.org>; Fri,  9 Jun 2023 03:57:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686283040; x=1688875040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QapHwANnaX4l8/XqJb1pzjwveSasVFbl6eTxj13JV50=;
        b=VbIsovqP++LzQEh860JOe4pK3dFK/J0d8Lz7yoGMzs0JpBwJ/Sj+L2C2INFYEFu/qz
         vBRIfucffQMNfh3EzxHAq6EN5r0/1pk/lE/uefXvmaOtxgPBDnm8KxZXkYFezXw54rnP
         1b9EMl4/4V89Hpxcb2ZAp8dz0dN2Y0KFVjo4OhVC6sIdYmtAhZKRDoCtuwPb686q7330
         aRLt3iQjyJyOhgneolLZ+YpGGThje+/Ld4OdzICIlk3olhaaj/rYq6BU14NiDUlyVdsx
         iP8nRupbiQZ7vQDlSRYSWdfx25+DyVXWKCAaMsQOz+4GkSfAWMOUJJloW2dDq2nKW3Sq
         kneA==
X-Gm-Message-State: AC+VfDwqIQLkmYJcKVZC55NRiD49gr1Uv6n6p4Vu4uaJiCUr858gx+al
	oGZYLsIaiY2zjcob7FBB2bVqEA==
X-Google-Smtp-Source: ACHHUZ7jq4LFuJ5wqN0cZkj5LGLq/NeDsrMuPxcJ1phA2L+dMjplBsATQSfDyQGY0JGHwTGAQXMzdA==
X-Received: by 2002:a05:6a20:748c:b0:110:b7fb:2c92 with SMTP id p12-20020a056a20748c00b00110b7fb2c92mr729837pzd.11.1686283039974;
        Thu, 08 Jun 2023 20:57:19 -0700 (PDT)
Message-ID: <36cf507b-2dd8-2d77-c6a9-b561e5ba491e@bytedance.com>
Date: Fri, 9 Jun 2023 11:55:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Parav Pandit <parav@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: "mst@redhat.com" <mst@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "houp@yusur.tech" <houp@yusur.tech>,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>,
 "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-7-pizhenwei@bytedance.com>
 <20230531171036.GH1248296@fedora>
 <8cfdc9bf-03c9-92fc-f2e0-d59b180b0d82@bytedance.com>
 <20230605163046.GB1624556@fedora>
 <54bb85af-7979-8226-cfef-d72c1cf2332f@bytedance.com>
 <20230606133444.GC1958291@fedora>
 <86978fc3-c065-5a64-2996-28b4eb2b40bd@bytedance.com>
 <20230608164123.GB2240319@fedora>
 <PH0PR12MB5481C447A5FCA25A6D5B28E0DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d3455f74-c0a8-5285-0b07-caa99e17ce44@bytedance.com>
 <PH0PR12MB548134F882F3B725749BED05DC51A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <PH0PR12MB548134F882F3B725749BED05DC51A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [virtio-comment] RE: RE: Re: Re: Re: [PATCH v2 06/11]
 transport-fabrics: introduce command set

On 6/9/23 10:06, Parav Pandit wrote:
> 
>> From: zhenwei pi <pizhenwei@bytedance.com>
>> Sent: Thursday, June 8, 2023 9:39 PM
> 
> 
>>> We should start with first establishing the data transfer model covering 512B
>> to 1M context and take up the optimizations as extensions.
>>>
>>>
>>
>> Hi, Parav
>>
>> What do you think about another RDMA inline proposal in '[PATCH v2 11/11]
>> transport-fabrics: support inline data for keyed transmission'?
>>
>> 1, use feature command to get the target max recv buffer size, for example 16k
>> 2, use feature command to set the initiator max recv buffer size, for example
>> 16k If the size of payload is less than max recv buffer size, using a single RDMA
>> SEND is enough. for example, virtio-blk writes 8k: 16 + 8192 < 16384, this
>> means a single RDMA SEND is fine.
> 
> Let me read it.
>  From above short description, it appears that every receive buffer posted must be of size 16K.
> And if sender choose not to do inline, there is super buffer wasted.
> 
> If it is read only or read workload, target majority buffer wastage is close to 98% or so assuming 64B command size.
> 
> And when buffer is full, the sender is stalled for the full round trip to enqueue the command.

Yes, this waste memory, it's not good enough.

I tried to understand your proposal, please correct me if I misunderstand...

Define data structure like:

struct virtio_of_keyed_desc {
         le64 addr;
         le32 length;
         le32 key;
};

struct virtio_of_command_vq {
         le16 opcode;
         le16 command_id;
         le32 out_length;
         le32 in_length;
         union {
                 struct virtio_of_keyed {
                         le32 out_offset;
                 };

                 struct virtio_of_stream {
                         u8 rsvd[4];
                 };
         };
};

struct virtio_of_completion {
         le16 status;
         le16 command_id;
         u8 rsvd[4];
         union {
                 le64 value;
                 struct virtio_of_vq_completion {
                         le32 in_length;
                         le32 len;
                 };
         }
};


For stream(Ex TCP/IP), the request PDU includes [struct 
virtio_of_command_vq + data], the response PDU includes [struct 
virtio_of_completion + data].

For keyed(Ex RDMA), the request PDU includes [struct 
virtio_of_command_vq + struct virtio_of_keyed_desc], there are 2 opcodes 
for keyed transmission:
1, opcode virtio_of_op_vq: (basic and required command)
the initiator prepares a buffer of [out_length + in_length], the target 
recv a 32B command, and reads the remote memory [addr, addr+out_length) 
by RDMA READ, then writes the remote memory [addr+out_length, 
addr+out_length+in_length) by RDMA WRITE, finally sends completion by 
RDMA SEND.

2, opcode virtio_of_op_vq_write_inline: (optional command)
the initiator gets a remote buffer of target(Ex, 128K) after feature 
negotiation.

The initiator selects a region of target remote memory(Ex, 4k - 12k), 
and writes payload by RDMA WRITE, then sends a 32B command by RDMA 
SEND(out_offset is 4K, ).
The target handles command, writes the remote memory [addr, 
addr+in_length), finally sends completion by RDMA SEND.

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

