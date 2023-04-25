Return-Path: <virtio-comment-return-5629-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D632C77B61
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 07:05:32 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 906572ACA8
	for <virtio-comment@archiver.kernel.org>; Tue, 25 Apr 2023 07:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by host09.ws5.connectedcommunity.org (Postfix) with QMQP
	id 85C5F3D8D4; Tue, 25 Apr 2023 07:05:31 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BA62D9863E1
	for <virtio-comment@lists.oasis-open.org>; Tue, 25 Apr 2023 07:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682406265; x=1684998265;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IL9kc7mFRmmHIy1kFjAeVngNv7apJV+bSnDYD76jMk=;
        b=akiqBi2fpGBCiJs7uZPtECgYL6mUa+kan0AHjSFt8vyb1PcFDvTmU9qfCkOCvjT3Op
         yHXPxsfCC2Ug6c7GrzyOI1MB5K9gx6wAc/yE4ajlNQ6hT2CXwkcxca9BgtpcDSVSSu3c
         BzCnWPOsPkkEiLveoq6htt55T6XKY94mkTzvDlr5NyjYWJXQH8f/w9wgmxreCW6uU2Hc
         pIQYYXItwrf6QBAqL8lYqBD0VRCghlbpbPrerP2RL3pKSOcDkWRpqo2tgRkxrjgWWD5B
         HxSSR0AbBBC6NCvyLtWRRo2UozlRacgg6ac7SN/vXlvMzLK1lolO2p4BSmfTcUAQVC3R
         tEFQ==
X-Gm-Message-State: AAQBX9dFyTBwOerSOs3ieemEMsXjsJ1tE5bYMv/i9h4rDgcr4hoyER9k
	TZz39dKMX8ZcICE488p8bAh3qg==
X-Google-Smtp-Source: AKy350Y9lDG3TzdJf2dLB12mA8kyMQVtz2U0JoPe2VzqMFYRjpmxRjoOrIwnBkI6Q7vGdltRDcKZvw==
X-Received: by 2002:a17:902:d2cb:b0:19d:611:2815 with SMTP id n11-20020a170902d2cb00b0019d06112815mr19390023plc.42.1682406264774;
        Tue, 25 Apr 2023 00:04:24 -0700 (PDT)
Message-ID: <66cc128e-d903-f9b3-1e94-1bb48d0173ad@bytedance.com>
Date: Tue, 25 Apr 2023 15:02:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, virtio-dev@lists.oasis-open.org,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>, houp@yusur.tech
References: <1ab0beff-8b18-7a94-1a68-6bf36bcd0394@bytedance.com>
 <CACGkMEvh+G2Tm=WDTOK3K2GO8c2dQ4y=UiKAk_kvsid2MGzbGg@mail.gmail.com>
 <8f65c9aa-c867-0929-151c-21bbe25a0693@bytedance.com>
 <4150bd72-a358-c854-0c64-b149621a1b8d@nvidia.com>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <4150bd72-a358-c854-0c64-b149621a1b8d@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: Re: [virtio-comment] [PROPOSAL] Virtio Over Fabrics(TCP/RDMA)

On 4/25/23 13:03, Parav Pandit wrote:
[...]
> Example #3 enables to implement virtio backend over fabrics initiator in 
> the user space, which is also a good use case.
Yes.

> It can be also be done in non native virtio backend.
> More below.
> 
>> 3, SmartNIC/DPU/vDPA environment. It's possible to convert virtio-pci 
>> request to virtio-of request by hardware, and forward request to 
>> virtio target directly.
>>          +----------+    +----------+       +----------+
>>          |Map-Reduce|    |   nginx  |  ...  | processes|
>>          +----------+    +----------+       +----------+
>> ------------------------------------------------------------
>> Host         |               |                  |
>> Kernel   +-------+       +-------+          +-------+
>>           | ext4  |       | LKCF  |          | HWRNG |
>>           +-------+       +-------+          +-------+
>>               |               |                  |
>>           +-------+       +-------+          +-------+
>>           |  vdx  |       |vCrypto|          | vRNG  |
>>           +-------+       +-------+          +-------+
>>               |               |                  |
>> PCI --------------------------------------------------------
>>                               |
>> SmartNIC             +---------------+
>>                       |virtio HW queue|
>>                       +---------------+
>>                               |
>>                           +------+
>>                           |NIC/IB|
>>                           +------+
>>                               |                      +-------------+
>>                               +--------------------->|virtio target|
>>                                                      +-------------+
>>
> All 3 seems a valid use cases.
> 
> Use case 1 and 2 can be achieved directly without involving any 
> mediation layer or any other translation layer (for example virtio to nfs).
> Many blk and file protocols outside of the virtio already exists which 
> achieve this. I don't see virtio being any different to support this in 
> native manner, mainly the blk, fs, crypto device.
> 

I'm working on iSCSI/iSER/NVMe-oF for several years, frankly, I also 
think there is no essential difference between virtio-blk over fabrics 
and NVMe-oF. As far as I know, storage specified protocol is quit common 
and popular, but the other device types seems lack. For example, I don't 
know any protocol to support remote crypto device(please correct me if 
there is already one). I also notice that virtio-camera is reserved, a 
remote camera protocol may be developed to support camera redirection in 
future. virtio-of works on virtio transport layer, it allow us to 
support almost the full virtio device family.

> use case #3 brings additional a benefits at the same time different 
> complexity but sure #3 is also a valid and common use case in our 
> experiences.
> 
> In my experience working with FC, iSCSI, FCoE, NVMe RDMA fabrics, iSER,
> A virito fabrics needs a lot of work to reach the scale, resiliency and 
> lastly the security. (step by step...)
> 
> My humble suggestion is : pick one transport instead of all at once, 
> rdma being most performant probably the first candidate to see the perf 
> gain for use case #1 and #2 from remote system.
> 
> I briefly see your rdma command descriptor example, which is not aligned 
> to 16B. Perf wise it will be poor than nvme rdma fabrics.
> 
Thanks, I'll confirm this with RDMA expert, maybe add a padding field in 
command.

> For PCI transport for net, we intent to start the work to improve 
> descriptors, the transport binding for net device. From our research I 
> see that some abstract virtio descriptors are great today, but if you 
> want to get best out of the system (sw, hw, cpu), such abstraction is 
> not the best. Sharing of "id" all the way to target and bring back is an 
> example of such inefficiency in your example.

Could you please give me more hint about this?
Because requests from virtqueue always have unique id, so the inflight 
virtio-of request use id to distinguish. otherwise, it has no other meaning.

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

