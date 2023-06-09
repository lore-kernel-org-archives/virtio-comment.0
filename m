Return-Path: <virtio-comment-return-6267-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEA8C7EE29
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 01:41:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 33E352AED0
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 01:41:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 24C90986697
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 01:41:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 15D099842E9; Fri,  9 Jun 2023 01:41:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F19AE98668D
	for <virtio-comment@lists.oasis-open.org>; Fri,  9 Jun 2023 01:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686274893; x=1688866893;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lDfUskOQowHHJftyOvPfqgwG6ojbSIgP/n+z+1ycwig=;
        b=H0UWpW+r/6pWEbECgdZGE8OUehb22rtjIK8vb4W+qDPGkfw9P9QdRKylx6XEnAewZU
         CIKt69vTwxEHb19zNCjY8rqGqO2OH1babfG+yBSgqA5jM6jJs347Xdq7716PRk8MmW/A
         tYZfLzO3zuo6x2PNzW/9RNh+/6dGDaifj03qaHLe/wGT9hGtnOe5rDXLtrQ+xGAAqXrf
         y39fkydRomN1l7OUqOcjwQLuba2V0N7XqRAzsaSciy4WE1cyfKka7adM4yFnTIMvbj/6
         x4aSlSnD/VAnSOyj5nT3pX9a33ooQSnmtQ8Ge2SldEhHiSy2Zo550LWcscD404g8/9bE
         j+lQ==
X-Gm-Message-State: AC+VfDzc3x2w5v5bh6VQ3mvFKk2e9IUt9WePuXNk+Fmui6taMesHFTNV
	0edj65U3vagnNBkywLGirZqAPg==
X-Google-Smtp-Source: ACHHUZ4pMVueuNZumTXRwhHyaDVN7k+vKZUfnX9Vf/B5NT3AJcG55mUCil9GyGlvll3OO6WO7n6c1g==
X-Received: by 2002:a05:6358:4e06:b0:127:f023:d273 with SMTP id cf6-20020a0563584e0600b00127f023d273mr19659rwb.27.1686274893245;
        Thu, 08 Jun 2023 18:41:33 -0700 (PDT)
Message-ID: <d3455f74-c0a8-5285-0b07-caa99e17ce44@bytedance.com>
Date: Fri, 9 Jun 2023 09:39:19 +0800
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
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <PH0PR12MB5481C447A5FCA25A6D5B28E0DC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] Re: RE: Re: Re: Re: [PATCH v2 06/11] transport-fabrics: introduce
 command set



On 6/9/23 01:01, Parav Pandit wrote:
> 
>> From: Stefan Hajnoczi <stefanha@redhat.com>
>> Sent: Thursday, June 8, 2023 12:41 PM
> 
>>>>> For stream protocol, it always work fine.
>>>>> For keyed protocol, for example RDMA, the target side needs to use
>>>>> ibv_post_recv to receive a large size(sizeof
>>>>> virtio_of_command_connect + sizeof virtio_of_connect). If the
>>>>> target uses ibv_post_recv to receive
>>>>> sizeof(CMD) + sizeof(DESC) * 1, the initiator fails in RDMA SEND.
>>>>
>>>> I read that "A RC connection is very similar to a TCP connection" in
>>>> the NVIDIA documentation
>>>> (https://docs.nvidia.com/networking/display/RDMAAwareProgrammingv17/
>>>> Transport+Modes) and expected SOCK_STREAM semantics for RDMA SEND.
>>>>
>>>> Are you saying ibv_post_send() fails when the receiver's work
>>>> request sg_list size is smaller (fewer bytes) than the sender's?
>>>>
>>>
>>> Yes, it will fail.
>>> The receiver get a CQE with status 'IBV_WC_LOC_LEN_ERR', see
>>> https://www.rdmamojo.com/2013/02/15/ibv_poll_cq/
>>
>> Parav: Can you confirm that this is expected?
>>
> Ibv_post_send() will not fail because it is a queuing interface.
> But the send operation itself will fail via send (requester) side completion moving the QP to error.
> Receive q also moves to error.
> 
>> This makes it hard to inline payloads as I was suggesting before :(.
> 
> What I was suggesting in other thread, is if we want to inline the payload, we should do following.
> RDMA write followed by RDMA send. So, a Block write commands actual data can be placed directly in say 4K memory of target.
> 
> This way, sender and receiver works with constant size buffers in send and receive queue.
> RDMA is message based and not byte stream based.
> 
> Inline RDMA write is often called eager buffer, similar to PCIe write combine buffer.
> 
> Both doesn't likely work at scale as the buffer sharing becomes difficult across multiple connections.
> It is memory vs perf trade off.
> But doable.
> 
> We should start with first establishing the data transfer model covering 512B to 1M context and take up the optimizations as extensions.
> 
> 

Hi, Parav

What do you think about another RDMA inline proposal in
'[PATCH v2 11/11] transport-fabrics: support inline data for keyed 
transmission'?

1, use feature command to get the target max recv buffer size, for 
example 16k
2, use feature command to set the initiator max recv buffer size, for 
example 16k
If the size of payload is less than max recv buffer size, using a single 
RDMA SEND is enough. for example, virtio-blk writes 8k: 16 + 8192 < 
16384, this means a single RDMA SEND is fine.

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

