Return-Path: <virtio-comment-return-5583-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80EBC7618E
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 13:38:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0FF07C6224
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 13:38:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F3B8C98636F
	for <virtio-comment@archiver.kernel.org>; Mon, 24 Apr 2023 13:38:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E2B8298633A; Mon, 24 Apr 2023 13:38:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D1CE0986350
	for <virtio-comment@lists.oasis-open.org>; Mon, 24 Apr 2023 13:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682343521; x=1684935521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpNApqBi3Ia61ZGzd56nD1WWy84eyBXVwxv0T/cLNzg=;
        b=MUcC3YhZ/qgn1ue8BDTBVJYI/LihvCqoH2BzH4I/b2mhOaHvlKxvjrjF6fy/+K5NcG
         4xAItMR18zoC5WbaEPcRdsDzMImsZvgDyilNEEUgS4xBY7PVIWwaUY66MK4pif7piEXm
         bDdZcInF+jBacWc4unTsyxvvX3bIDD0UFaEvSWlquEdXm18lhAds/crnDF4xhyVJo3K6
         h+EtSHSm/u1art4qX5RAEx7QMiU7AnyJNVMqUXPMxXRn3l0mPAKbV4pFzw0PfNPDuzJM
         vNzJ0dj6jXN3V1isrgpM0WdACiPvE1V/zvhn1MmT38/hhyHppHiT5d61yBxKnMDfnJgl
         +n0w==
X-Gm-Message-State: AAQBX9fEvsvjuntHGOZCQ+eJ0rF2oL9kSokU2ZWMnuSABTIvmsTeBfOt
	ECcw1xqhL5MwxZIZDnd9Ly4IvA==
X-Google-Smtp-Source: AKy350bq0zgLR0N/8SJmF1RMBWLxYkrHUy/hP70KY4ondrO98TSwemseyHtf/i1yiIsrEkl6zB2jLg==
X-Received: by 2002:a17:902:c793:b0:19f:87b5:1873 with SMTP id w19-20020a170902c79300b0019f87b51873mr12182721pla.62.1682343520656;
        Mon, 24 Apr 2023 06:38:40 -0700 (PDT)
Message-ID: <8f65c9aa-c867-0929-151c-21bbe25a0693@bytedance.com>
Date: Mon, 24 Apr 2023 21:38:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Jason Wang <jasowang@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, parav@nvidia.com, virtio-dev@lists.oasis-open.org,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "helei.sig11@bytedance.com" <helei.sig11@bytedance.com>, houp@yusur.tech
References: <1ab0beff-8b18-7a94-1a68-6bf36bcd0394@bytedance.com>
 <CACGkMEvh+G2Tm=WDTOK3K2GO8c2dQ4y=UiKAk_kvsid2MGzbGg@mail.gmail.com>
Content-Language: en-US
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <CACGkMEvh+G2Tm=WDTOK3K2GO8c2dQ4y=UiKAk_kvsid2MGzbGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: Re: [virtio-comment] [PROPOSAL] Virtio Over Fabrics(TCP/RDMA)



On 4/24/23 11:40, Jason Wang wrote:
> On Sun, Apr 23, 2023 at 7:31 PM zhenwei pi <pizhenwei@bytedance.com> wrote:
>>
>> Hi,
>>
>> In the past years, virtio supports lots of device specifications by
>> PCI/MMIO/CCW. These devices work fine in the virtualization environment,
>> and we have a chance to support virtio device family for the
>> container/host scenario.
> 
> PCI can work for containers for sure (or does it meet any issue like
> scalability?). It's better to describe what problems you met and why
> you choose this way to solve it.
> 
> It's better to compare this with
> 
> 1) hiding the fabrics details via DPU
> 2) vDPA
> 
Hi,

Sorry, I missed this part. "Network defined peripheral devices of virtio 
family" is the main purpose of this proposal, this allows us to use many 
types of remote resources which are provided by virtio target.

 From the point of my view, there are 3 cases:
1, Host/container scenario. For example, host kernel connects a virtio 
target block service, maps it as a vdx(virtio-blk) device(used by 
Map-Reduce service which needs a fast/large size disk). The host kernel 
also connects a virtio target crypto service, maps it as virtio crypto 
device(used by nginx to accelarate HTTPS). And so on.

         +----------+    +----------+       +----------+
         |Map-Reduce|    |   nginx  |  ...  | processes|
         +----------+    +----------+       +----------+
------------------------------------------------------------
Host         |               |                  |
Kernel   +-------+       +-------+          +-------+
          | ext4  |       | LKCF  |          | HWRNG |
          +-------+       +-------+          +-------+
              |               |                  |
          +-------+       +-------+          +-------+
          |  vdx  |       |vCrypto|          | vRNG  |
          +-------+       +-------+          +-------+
              |               |                  |
              |           +--------+             |
              +---------->|TCP/RDMA|<------------+
                          +--------+
                              |
                          +------+
                          |NIC/IB|
                          +------+
                              |                      +-------------+
                              +--------------------->|virtio target|
                                                     +-------------+

2, Typical virtualization environment. The workloads run in a guest, and 
QEMU handles virtio-pci(or MMIO), and forwards requests to target.
         +----------+    +----------+       +----------+
         |Map-Reduce|    |   nginx  |  ...  | processes|
         +----------+    +----------+       +----------+
------------------------------------------------------------
Guest        |               |                  |
Kernel   +-------+       +-------+          +-------+
          | ext4  |       | LKCF  |          | HWRNG |
          +-------+       +-------+          +-------+
              |               |                  |
          +-------+       +-------+          +-------+
          |  vdx  |       |vCrypto|          | vRNG  |
          +-------+       +-------+          +-------+
              |               |                  |
PCI --------------------------------------------------------
                              |
QEMU                 +--------------+
                      |virtio backend|
                      +--------------+
                              |
                          +------+
                          |NIC/IB|
                          +------+
                              |                      +-------------+
                              +--------------------->|virtio target|
                                                     +-------------+

3, SmartNIC/DPU/vDPA environment. It's possible to convert virtio-pci 
request to virtio-of request by hardware, and forward request to virtio 
target directly.
         +----------+    +----------+       +----------+
         |Map-Reduce|    |   nginx  |  ...  | processes|
         +----------+    +----------+       +----------+
------------------------------------------------------------
Host         |               |                  |
Kernel   +-------+       +-------+          +-------+
          | ext4  |       | LKCF  |          | HWRNG |
          +-------+       +-------+          +-------+
              |               |                  |
          +-------+       +-------+          +-------+
          |  vdx  |       |vCrypto|          | vRNG  |
          +-------+       +-------+          +-------+
              |               |                  |
PCI --------------------------------------------------------
                              |
SmartNIC             +---------------+
                      |virtio HW queue|
                      +---------------+
                              |
                          +------+
                          |NIC/IB|
                          +------+
                              |                      +-------------+
                              +--------------------->|virtio target|
                                                     +-------------+

>>
>> - Theory
>> "Virtio Over Fabrics" aims at "reuse virtio device specifications", and
>> provides network defined peripheral devices.
>> And this protocol also could be used in virtualization environment,
>> typically hypervisor(or vhost-user process) handles request from virtio
>> PCI/MMIO/CCW, remaps request and forwards to target by fabrics.
> 
> This requires meditation in the datapath, isn't it?
> 
>>
>> - Protocol
>> The detail protocol definition see:
>> https://github.com/pizhenwei/linux/blob/virtio-of-github/include/uapi/linux/virtio_of.h
> 
> I'd say a RFC patch for virtio spec is more suitable than the codes.
> 

OK. I'll send a RFC patch for virtio spec later if this proposal is 
acceptable.

[...]

> 
> A quick glance at the code told me it's a mediation layer that convert
> descriptors in the vring to the fabric specific packet. This is the
> vDPA way.
> 
> If we agree virtio of fabic is useful, we need invent facilities to
> allow building packet directly without bothering the virtqueue (the
> API is layout independent anyhow).
> 
> Thanks
> 

This code describes the case 1[Host/container scenario], also proves 
this case works.
Create a virtqueue in the virtio fabric module, also emulate a 
"virtqueue backend" here, when uplayer kicks vring, the "backend" gets 
notified and builds packet to TCP/RDMA.

[...]

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

